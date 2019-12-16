import "package:dio/dio.dart";
import 'dart:async';
//import 'dart:io';
import '../config/service_url.dart';

Future request(method, url, {formData}) async{
  try{
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio();
    // 因为dio请求返回的数据默认是以json的格式读取的,而返回的数据是密文形式,需要修改dio的Options的responseType为ResponseType.PLAIN,这样返回的数据就以字符串形式处理.
    dio.options.responseType = ResponseType.plain;
//    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if(method == 'post') {
      if (formData==null) {
        response = await dio.post(servicePath[url]);
      } else {
        response = await dio.post(servicePath[url],queryParameters: formData);
      }
    } else {
      if (formData==null) {
        response = await dio.get(servicePath[url]);
      } else {
        response = await dio.get(servicePath[url],queryParameters: formData);
      }
    }
    if(response.statusCode == 200){
//      print(response.data);
      return response.data;
    }else{
      print('后端接口出现异常，请检测代码和服务器情况.........');
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}