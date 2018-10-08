<template>
	<el-row class="container">
		<el-col :span="24" class="header">
			<el-header style="height: 100px; font-size: 12px;margin: 0 20px;">
				<el-container>
					<el-aside width="500px">
						<el-container>
						<!-- <el-aside style="width:100px;font-size:100px; margin: 0px 50px" class="el-icon-upload"></el-aside>  -->
						<img src="../assets/img/logo/one piece.png" alt="logo" width="100px" height="100px">
						<span width="300px" style="display:inlne-block; font-size:34px;height:100px;">ONE PIECE后台管理系统
                             
                        </span>
						</el-container>
					</el-aside> 
				
					
							<div style="display:inline-black font-size:20px;" v-if="!mastershow">
								<span style="margin-left:200px;" >欢迎
									<i class="user"><slot>{{user}}</slot></i>
									登录ONE PIECE后台管理系统
									<!-- <sapn class="goout" v-if="mastershow" router-link to='/'>退出登录</sapn> -->
									<span v-if="!mastershow" ><router-link to='/' class="goout" >退出登录</router-link></span>
								</span>
							</div>
								<div style="display:inline-black;margin-left:300px; font-size:20px;"  v-if="mastershow">
									<span class="ismaster " >用户请登录
                                  <router-link to='/' class="goout " >登录</router-link> 
                        		</span> 
								</div>
						
								
							
							 <span id="touxiang" v-if="mastershow" ><img :src="url+'/uploads/'+user+'.jpg'"  /></span> 
						
				</el-container>
			
			</el-header>
		</el-col>
		<el-col :span="24" class="main">
			<aside :class="collapsed?'menu-collapsed':'menu-expanded'">
				<!--导航菜单-->
				<el-menu :default-active="$route.path" class="el-menu-vertical-demo" @open="handleopen" @close="handleclose" @select="handleselect"
					 unique-opened router v-show="!collapsed">
					<template v-for="(item,index) in $router.options.routes" v-if="!item.hidden" >
						<el-submenu :index="index+''" v-if="!item.leaf" :key="index">
							<template slot="title"><i :class="item.iconCls"></i>{{item.name}}</template>
							<el-menu-item v-for="child in item.children" :index="child.path" :key="child.path" v-if="!child.hidden">{{child.name}}</el-menu-item>
						</el-submenu>
						<el-menu-item v-if="item.leaf&&item.children.length>0" :index="item.children[0].path" :key="index"><i :class="item.iconCls"></i>{{item.children[0].name}}</el-menu-item>
					</template>
				</el-menu>
			</aside>
			<!-- 嵌套路由 -->
			<section class="content-container">
				<div class="grid-content bg-purple-light">
					<el-col :span="24" class="breadcrumb-container">
						<strong class="title">{{$route.name}}</strong>
						<el-breadcrumb separator="/" class="breadcrumb-inner">
							<el-breadcrumb-item v-for="item in $route.matched" :key="item.path">
								{{ item.name }}
							</el-breadcrumb-item>
						</el-breadcrumb>
					</el-col>
					<el-col :span="24" class="content-wrapper">
						<transition name="fade" mode="out-in">
							<router-view></router-view>
						</transition>
					</el-col>
				</div>
			</section>
		</el-col>
	</el-row>
</template>


<script>
export default {
    name:'商品管理',
    props:['name','password'],
    data(){
        return {
            url:'api',
            user:this.name,
            pwd:this.password,
            mastershow:false, 
            isActive:false
        }
    },
    methods:{
        //判断登录状态
        mastershow:function(){
            this.mastershow = this.user==undefined ? false : true ;
        },
        toResetpsd:function(){
            this.isActive=0;
            this.$router.push({ 
            name:'resetpassword',
                params:{
                    name:this.user,
                    password: this.pwd
                }
            })
        },
        toPerson:function(){
            this.isActive=1;
            this.$router.push({
                name:'personData',
                params:{
                    name:this.user
                }
            })
        },
        toUser:function(){
            this.isActive=2;
            this.$router.push({
                name:'manageuser'
            })
        }
    },
    created(){
		this.mastershow();
		
	}
	

    
}
</script>


<style scoped lang="scss">
    .container {
		position: absolute;
		top: 0px;
		bottom: 0px;
		width: 100%;
		.header {	
			height: 100px;
			line-height: 100px;
			background:  #20a0ff;
			color:#fff;
			.user{font-size: 20px;padding:0 10px;}
			.goout{font-size: 18px; padding: 0 50px; 
				&:hover{
					color:#f60;
				}
            }
        #touxiang{
        display: inline-block;
        top:7px;
        right:450px;
        width: 100px;
        height:100px;
            img{
                width: 60px;
                height: 60px;
                border-radius: 50%;
            }	
        }
    
		}
		.main {
			display: flex;
			// background: #324057;
			position: absolute;
			top: 100px;
			bottom: 0px;
			overflow: hidden;
			aside {
				flex:0 0 230px;
				width: 230px;
				// position: absolute;
				// top: 0px;
				// bottom: 0px;
				.el-menu{
					height: 100%;
				}
				.collapsed{
					width:60px;
					.item{
						position: relative;
					}
					.submenu{
						position:absolute;
						top:0px;
						left:60px;
						z-index:99999;
						height:auto;
						display:none;
					}

				}
			}
			.menu-collapsed{
				flex:0 0 100px;
				width: 60px;
			}
			.menu-expanded{
				flex:0 0 230px;
				width: 230px;
			}
			.content-container {
				// background: #f1f2f7;
				flex:1;
				// position: absolute;
				// right: 0px;
				// top: 0px;
				// bottom: 0px;
				// left: 230px;
				overflow-y: scroll;
				padding: 20px;
				.breadcrumb-container {
					//margin-bottom: 15px;
					.title {
						width: 200px;
						float: left;
						color: #475669;
					}
					.breadcrumb-inner {
						float: right;
					}
				}
				.content-wrapper {
					background-color: #fff;
					box-sizing: border-box;
				}
			}
		}
	}

</style>
