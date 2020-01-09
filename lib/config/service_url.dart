const serviceUrl= 'https://5gadmin.zhihuiyunqi.com';//此端口针对于正版用户开放，可自行fiddle获取。
//const serviceUrl2= 'http://v.jspang.com:8088/baixing/';//
const serviceUrl1= 'https://mall.virginhoney.com.cn/wx';

const servicePath={
//  'homeBannerContext': serviceUrl+'/admin/company/list', // 5g商家首页信息
//  'homePageContext': serviceUrl2+'wxmini/homePageContent' //jspang首页数据接口
  'homeBanner': serviceUrl1+'/home/index', // 首页信息接口
  'CategoryIndexContent': serviceUrl1+'/catalog/index',//商品分类默认请求接口
  'CategoryidContent': serviceUrl1+'/catalog/current', // 根据商品分类id获取对应分类数据
  'GoodsDetail': serviceUrl1+'/goods/detail', // 根据商品分类id获取对应分类数据
//  'articleTypelist':serviceUrl+'/admin/articleType/list',
  'Topicgoodslist':serviceUrl1+'/topic/list',
  'Brandgoodslist':serviceUrl1+'/brand/list',
  'searchgoodslist':serviceUrl1+'/goods/list',
  'collect':serviceUrl1+'/collect/addordelete',
  'cartlist':serviceUrl1+'/cart/index',

};