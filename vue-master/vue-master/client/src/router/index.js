import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
import login from '@/components/login'
import home from '@/components/home'
import NotFound from '@/components/404.vue';
import goodslist from '@/components/nav1/goodslist'
import goodsclass from '@/components/nav1/goodsclass'
import Changepass from '@/components/nav2/Changepass'
import personData from  '@/components/nav2/personData'
import Transaction from '@/components/nav3/Transaction'

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: login,
      hidden: true
    },{
      path: '/404',
      component: NotFound,
      name: '',
      hidden: true 
    },{
      path: '/home',
      name: '商品管理',
      iconCls: 'el-icon-goods',
      component: home,
      props:function(route){
        // console.log(route.params);
        return Object.assign({},route.params)
      },
      children:[
        {
          path: '/goodslist',
          name: '商品列表',
          component: goodslist
        },
        {
          path: '/goodsclass',
          name: '商品分类',
          component: goodsclass
        }
      ]
    },{
      path: '/home',
      name: '用户管理',
      iconCls: 'el-icon-edit-outline',
      component: home,
      props: function (route) {
        // console.log(route.params);
        return Object.assign({}, route.params)
      },
      children: [{
            path: '/changepass',
            name: '修改密码',
            component: Changepass
          },
          {
            path: '/personData',
            name: '资料修改',
            component: personData
          }
        ]
      },{
        path: '/home',
        name: '交易管理',
        iconCls: 'el-icon-tickets',
        component: home,
        props: function (route) {
          // console.log(route.params);
          return Object.assign({}, route.params)
        },
        children: [{
            path: '/transaction',
            name: '订单列表',
            component: Transaction
         
        }]
    }, {
      path: '*',
      hidden: true,
      redirect: {
        path: '/404'
      }
    }

  ]
})
