<template>
    <div id="personData" >
      
         <el-form  label-posstion="right"  prop="name" :model="form" label-width="80px" > 
            <el-form-item label="我的角色">
                <el-select v-model="form.region" placeholder="请选择角色" class="my-inwt">
                    <el-option label="管理员" value="shanghai"></el-option>
                    <el-option label="超级管理员" value="beijing"></el-option>
                </el-select>
                <i>当前角色不可更改为其他角色</i>
            </el-form-item>
             
            <el-form-item label="用户名:">
                  <el-input v-model="myname" disabled  class="my-inwt"></el-input>
            </el-form-item>

            <el-form-item label="电话:">
                  <el-input v-model="form.iphone"  class="my-inwt"></el-input>
            </el-form-item>

            <el-form-item    label="性别:">
               <el-radio  value="nan"  v-model="sex" label="男">男</el-radio>
               <el-radio value="nv" v-model="sex" label="女">女</el-radio>
            </el-form-item>

            <el-form-item label="头像上传：" class="mgbot">
              <el-upload
                class="upload-demo"
                name="file1"
                :action="'api/imgupload?name='+myname"
                :on-preview="handlePreview"
                :on-remove="handleRemove"
                list-type="picture">
                <el-button type="primary">上传图片<i class="el-icon-upload el-icon--right"></i></el-button>    
                <div slot="tip" class="el-upload__tip">只能上传jpg，且不超过500kb</div>
            </el-upload>
            </el-form-item>
             <el-form-item    label="昵称:">
                  <el-input v-model="form.nickname"  class="my-inwt"></el-input>
            </el-form-item>

             <el-form-item    label="邮箱:">
                  <el-input  v-model="form.email"  class="my-inwt"></el-input>
            </el-form-item>
 
              <el-form-item    label="备注:">
                 <el-input type="textarea" v-model="form.textare" class="mgbot"></el-input>
             </el-form-item>
             
             <el-button   @click="submit"   type="success">提交</el-button>
             <el-button   @click="reset"  >重置</el-button>

         </el-form>
    </div>
</template>



<script>
export default {
    props:['name'],
    data(){
        return {
              radio:'1',
              url:'api',
              myname:this.name,
              sex:'',
              form:{
                  textare:'',
                  iphone:'',
              }
        }
    },
    methods: {
            handleRemove(file, fileList) {
                console.log(file, fileList);
                
            },
            handlePreview(file) {
                console.log(file);
                console.log(5656)
            },
            reset:function(){
                for(var i in this.form ){
                      this.form[i]=''
                }
            },
             open4(){
                this.$notify.error({
                title: '错误',
                message: '输入有误，请从新输入。'
                });
             },
             open2() {
                    this.$message({
                    message: '恭喜你，修改成功',
                    type: 'success'
                    });
            },
            submit:function(){
                this.form.sex=this.sex;
                this.form.name=this.myname;
                this.form.iphone!=''&& this.form.email!='' &&this.form.sex!=''&& this.nickname!=''?this.resetData() :this.open4()   
            },
          
           
            resetData:function(){
                // console.log(this.form)
                this.$axios({
                                  url:'/api/resetData',
                                  method:'post',
                                  data:(()=>{
                                      let data = '';
                                      for(let key in this.form){
                                          data += key + '=' + this.form[key] + '&'
                                      }
                                      data = data.slice(1);
                                      console.log(data)
                                      return data;
                                  })(),
                                

                                 }).then(res=>{
                            this.open2();
                       
                         })
            }
    },
    created(){
        this.$axios.get(this.url+'/personData?name='+this.myname).then(res=>{
             Object.assign(this.form,res.data[0]); 
            this.sex= res.data[0].sex;
        });
    }
}
</script>

<style>
#personData  {
     width:60%;
}
.my-inwt{width: 200px;
    margin-bottom:16px;
    margin-left: -15px;
    }
    .mgbot{
        margin-bottom:16px;
    }


</style>
