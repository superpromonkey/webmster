

<template>
  <el-form ref="form" label-position="left" label-width="0px" class="demo-ruleForm login-container">
    <div class="login-logo"><img src="../assets/img/logo/one piece.png" alt=""></div>
    <h3 class="title">ONE PIECE后台管理系统</h3>
    <el-form-item>
    <div style="margin-top: 15px;">
      <el-input type="text" v-model="form.username" auto-complete="off" placeholder="账号" > 
           <el-button slot="prepend" class="el-icon-edit"></el-button>
      </el-input>
    </div> 
    </el-form-item>
    <el-form-item>
      <el-input type="password" v-model="form.password" auto-complete="off" placeholder="密码">
        <el-button slot="prepend" class="el-icon-search"></el-button>
      </el-input>
    </el-form-item>
    <el-form-item style="width:100%;">
      <el-button type="primary" style="width:100%;" @click="onSubmit">登 录</el-button>

    </el-form-item>
    <el-form-item>
      <el-checkbox checked class="remember" float="left">记住密码</el-checkbox>
      <a href="#" style="float:right;">忘记密码</a>
    </el-form-item>
    
  </el-form>
</template>

<script>
export default {
  name: 'Login',
   data() {
      return {
        form: {
          username: '',
          password: '',
          codeImgNum:'',
          url:'api'

        },
        
      }
    },
    methods: {
      onSubmit(){

        // 用户名密码都不许为空
        if(this.form.username===''||this.form.password===''){
          this.$message({
            message: '请完善全部信息!',
            type: 'warning'
          });
        }

          // 判断账号和密码不为空
        if(this.form.username!==''&&this.form.password!==''){
              this.$axios.get(this.form.url+'/login?name='+this.form.username+'&password='+this.form.password).then(res=>{
                console.log(res);
                
                if(res.data==='你的用户名或密码错误'){

                    this.$message.error('输入的用户名或密码错误');
                
                }else if(res.data==='登录成功'){
                
                    this.$message({
                      message: '登录成功',
                      type: 'success'
                    });
                   
                    this.$router.push({
                      name: '商品管理',
                      params:{
                      name: this.form.username,
                      password: this.form.password
                      }
                    }) 
                  
                  
              }
          })
      }  
    }
  }
}
</script>

<style lang="scss" scoped>
  .login-container {
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-border-radius: 5px;
    background-clip: padding-box;
    margin: 180px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
    .login-logo{
      width: 100%;
      height: 100px;
      text-align: center;
      img{
        width:100px;
      }
    }
    .title {
      margin: 0px auto 40px auto;
      text-align: center;
      color: #505458;
    }
    .remember {
      margin: 0px 0px 35px 0px;
    }
  
  }
</style>