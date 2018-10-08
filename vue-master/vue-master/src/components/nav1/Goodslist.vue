<template>
 <div class="goodslist">
     <!-- 顶部工具条 -->
        <div class="serachtop">
            <label for="importantKey">关键字:
                <el-input  class="goodsseach"
                    placeholder="请输入内容"
                    v-model="importantKey"
                    clearable id="importantKey">
                </el-input>
            </label>
            
            <label for="goodslist">商品种类
                <el-select  class="goodsseach"   v-model="selectKind"  placeholder="商品分类">
                    <el-option
                     v-for="(item,idx) in options "
                     :value="item.type"
                     :key="idx"
                     id="goodslist">
                    </el-option>
                </el-select>
                <el-button @click="searchKind" icon="el-icon-search" type="primary" style="float:righr;">查询</el-button>
            </label>
        </div>
        <div class="btns"  style="margin: 10px">
            <el-button @click="open"    type="danger"  class="el-icon-delete">删除</el-button>
            <el-button @click="newShow=!newShow"   type="primary"  class="el-icon-edit m-blue">添加</el-button>
        </div>

        <!-- 商品列表 -->
        
        <div class="table" >
            <el-table
                border
                height="300"
                ref="multipleTable"
                :data="tableData"
                tooltip-effect="dark"
                style="width: 100%;"
                @selection-change="handleSelectionChange">
                <el-table-column
                type="selection"
                width="55">
                </el-table-column>
                <el-table-column
                label="id"
                width="70"
                prop="id"
               
                >
              
                </el-table-column>
              
                <el-table-column
                prop="type"
                label="商品分类"
                show-overflow-tooltip>
                </el-table-column>
                <el-table-column
                 style=" overflow: hidden;text-overflow : clip | ellipsis"
                prop="name"
                label="商品名称"
                height="40"
                >
                </el-table-column>
                <el-table-column
                width="150"
                prop="price"
                label="价格（￥）"
                 sortable
                show-overflow-tooltip>
                </el-table-column>
                <el-table-column
                prop="date"
                label="时间"
                sortable
                >
                </el-table-column>
                <el-table-column
                 width="100"
                prop="tag"
                :v-if="status==0"
                label="发布状态"
                show-overflow-tooltip>
                </el-table-column>

                <el-table-column
                fixed="right"
                label="操作"
                width="160">
                    <template slot-scope="scope">
                        <el-button     type="primary" size="mini" @click="handleClick(scope.row)"  icon="el-icon-edit">编辑</el-button>
                        <el-button type="danger" size="mini"  @click="delClick(scope.row)"  icon="el-icon-delete">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>
        
      <!--分页-->

			<el-pagination layout="prev, pager, next" @current-change="handleCurrentChange" background :page-size="20" :total="total" style="margin-top:14px;">
			</el-pagination>


      

        <!-- 编辑商品信息 -->
         <div class="mack" v-if="isShow">
            <el-form class="goodscompile"  label-width="100">
                <el-form-item label="id:" >
                    <el-input type="text" id="userid" disabled v-model="youSelect.id"></el-input>
                </el-form-item><br>
                <el-form-item label="商品名称:"   label-width="100">
                    <el-input type="text" id="username" v-model="youSelect.name"></el-input>
                </el-form-item><br>
                <el-form-item label="价格:"   label-width="100">
                    <el-input type="number" id="usertell" v-model="youSelect.price"></el-input>
                </el-form-item><br>
                <el-form-item label="分类:"  label-width="100">
                    <el-input type="text" id="useremail" disabled  v-model="youSelect.type"></el-input>
                </el-form-item><br>
                <el-form-item label="交易详情:"   label-width="100">
                    <el-input type="text" id="userjuese" ></el-input>
                </el-form-item><br>
                <el-form-item label="审核状态:"   label-width="80">
                    <el-select type="text"  v-model="youSelect.status" id="userstatus" placeholder="审核状态">
                        <el-option label="未审核" value="no"></el-option>
                        <el-option label="已审核" value="yes"></el-option>
                    </el-select>
                </el-form-item><br>
                <el-button  @click="resetGood"   type="primary" >确定</el-button>
                <el-button   :plain="true" @click="isShow=!isShow">取消</el-button>
            </el-form>
        </div>

        <!-- 添加商品纪录 -->
       <div class="mack" v-if="newShow">
            <el-form class="goodscompile">
                <el-form-item label="商品名称:"  label-width="100">
                    <el-input type="text" id="username" v-model="newGood.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="价格:"   label-width="100">
                    <el-input type="number" id="usertell" v-model="newGood.price"></el-input>
                </el-form-item>
                <el-form-item label="分类:"  label-width="100">
                    <el-input type="text" id="useremail" v-model="newGood.type"></el-input>
                </el-form-item>
                <el-form-item label="交易详情:"   label-width="100">
                    <el-input type="text" id="userjuese" ></el-input>
                </el-form-item>
                <el-form-item label="审核状态:"   label-width="100">
                    <el-select type="text"  v-model="newGood.status" id="userstatus" placeholder="审核状态">
                        <el-option label="未审核" value="0"></el-option>
                        <el-option label="已审核" value="1"></el-option>
                    </el-select>
                </el-form-item>
                <el-button   @click="addGood"   type="primary" >确定</el-button>
                <el-button     :plain="true" @click="newShow=!newShow">取消</el-button>
            </el-form>
        </div>







        
    </div>

</template>


<script  >
export default {
    data(){
       return {
            importantKey:'',
            tableData:[],
            currentPage:1,
            url:'api',
            start:0,
            count:10,
            total:0,
            youSelect:{},
            selectKind:'',
            isShow:false,
            newShow:false,
            newGood:{
                name:'',
                price:'',
                type:'',
                date:'',
                status:'',
                tag:''
            },
            allDel:'',
            options:[],


            




       }
    },
    methods:{
          status:function(){
            this.tag = this.status===undefined ? false : true ;
            //   this.status == 0 ? '未发布' : '已发布' ;
          },
        handleSizeChange:function(val){
            this.count=val;
            this.start=0;
            this.getData();
        },
        handleCurrentChange:function(val){
             this.currentPage=val;
             console.log(666);
             this.start=(this.currentPage-1)*this.count;
             this.getData();

        },
        handleSelectionChange:function(val){
           this.allDel = val.map(item=>{
                return item.id+'-'
          }).join('').slice(0,-1)
           
        },
        open4(){
                  this.$notify.error({
                title: '错误', 
                message: '输入有误!!!'
                //  type: 'danger'
                });   
                 
        },
         open2() {
                    this.$message({
                    message: '修改成功',
                    type: 'success'
                    });
        },
        open() {
        this.$alert('你确定要删除码！！！', '注意', {
            confirmButtonText: '确定',
            callback: action => {
                this.$message({
                type: 'info',
                message: `删除成功`
                });
              this.allDelgoods();
            }
                
            });
         },
        open3() {
        this.$message.error('输入有误，保证您的内容均不为空');
        },
        open6() {
        this.$message({
          message: '没有找到你要的数据',
          type: 'warning'
        });
        },
        allDelgoods:function(){
         if(this.allDel==''){
             this.open3()
         }else{
               this.$axios.get(this.url+'/delGoods?id='+this.allDel).then(res=>{
                console.log(res);
                this.allDel='';
                this.getData();
           })
         }
        },
        resetGood:function(){
            if(this.youSelect.name!=''&& this.youSelect.price!=''){
                 this.$axios({
                                  url:'/api/resetGood',
                                  method:'post',
                                  data:(()=>{
                                      let data = '';
                                      for(let key in this.youSelect){
                                          data += key + '=' + this.youSelect[key] + '&'
                                      }
                                      data = data.slice(1);
                                      console.log(data)
                                      return data;
                                  })(),
                                

                                 }).then(res=>{
                               this.isShow=!this.isShow;
                               this.open2();
                               this.getData();

                       
                         })
             
            }else{
                this.isShow=!this.isShow;
                this.open4();
            }
         },
        getData:function(){
         this.$axios.get(this.url+'/goodslist?start='+this.start+'&count='+this.count).then(res=>{
                   this.tableData=res.data;
         });
        },
        handleClick:function(val){
            Object.assign(this.youSelect,val);
            this.isShow=!this.isShow;
            //发起请求
        },
        delClick:function(val){
               console.log(val.id);
               this.$axios.get(this.url+'/delGood?id='+val.id).then(res=>{
                         console.log(res);
                         this.getData();
                            this.$axios.get(this.url+'/goodslistCount').then(res=>{ 
                            this.total=res.data*1;
                             });
               })
        },
        addGood:function(){
            this.newGood.name!=''&& this.newGood.price!=''&& this.newGood.type!=''&& this.newGood.status!='' ?  this.goodAdd() :this.open3();
        },

        goodAdd:function(){
               this.$axios({
                                  url:'/api/addGood',
                                  method:'post',
                                  data:(()=>{
                                      let data = '';
                                      for(let key in this.newGood){
                                          data += key + '=' + this.newGood[key] + '&'
                                      }
                                      data = data.slice(1);
                                      console.log(data)
                                      return data;
                                  })(),
                                

                                 }).then(res=>{
                               this.newShow=!this.newShow;
                               this.open2();
                               this.getData();
                                    this.$axios.get(this.url+'/goodslistCount').then(res=>{ 
                               this.total=res.data*1;
                                });
                             
                         })
        },
        searchKind:function(){
            if(this.importantKey.length>=2 && this.selectKind!=''){
                this.$axios.get(this.url+'/searchGood?type='+this.selectKind+'&key='+this.importantKey).then(res=>{
                     res.data=="没有找到数据"? this.open6() : this.tableData=res.data;
                })
            }else{
                this.open4();
            } 
        }
        
        
    },
    created(){
           this.getData();
           this.$axios.get(this.url+'/goodslistCount').then(res=>{ 
              this.total=res.data*1;
           });
           this.$axios.get(this.url+'/allData').then(result=>{
            var arr=[]
           result.data.forEach(item=>{
               arr.indexOf(item.type)>=0 ? null :arr.push(item.type);
           });
           this.options=arr.map((item,idx)=>{
                return {
                     type:item,
                     id:idx+1
                   } 
           })

            
        })

    }
}
</script>


<style >
   .goodslist .mack .el-input{
        width: 300px;
    }
    .goodsseach{
        width: 200px!important;
    }
    .serachtop{
        padding: 10px;
        border-bottom:1px solid #ddd; 
    }
    label{
        margin-right: 15px;
    }
    .btns{
        margin: 10px 0 0 8px;
    }
    .el-button--mini, .el-button--mini.is-round {
        padding: 7px 5px;
    }
    .cell{
       
        overflow: visible !important;
    }
    .cell button{
        width: 60px;
    }
    .block{
        margin: 10px;
    }
    .mack{
       
        position: fixed;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        background: rgba(27, 27, 29, 0.449);
        z-index: 500;
    }
    .goodslist .goodscompile{
         border: 1px solid blue;
        border-radius: 20px;
        padding: 10px;
        text-align: center;
        color:#fff;
        background: #eee;
        position: absolute;
        left:50%;
        top:50%;
        transform:translate(-50%,-50%);
    }
    .goodslist .mack .el-form-item__content{
        width: 500px;
        line-height: 60px;
        text-align: left;
    }
    .goodslist .mack .el-form-item__label{
        margin: 10px 0px;
        display: inline-block ;
        width: 100px;
   
        
    }
    .goodslist .mack input {
        width:300px ;
        display: inline-block;
    }
    .el-form-item {
        margin-bottom: 0!important;
    }
    
 
</style>

