import 'package:dio/dio.dart';
import 'package:flutter_stock_listing/models/StockList.dart';
import 'package:flutter_stock_listing/services/api.dart';
class HttpService{
  var dio = Dio();

  Future<StockList> getData() async{
    try{
      Response response = await dio.get(API.baseUrl);
      return StockList.fromJson(response.data);
    }
    catch(e){
      return null;
    }
  }
}