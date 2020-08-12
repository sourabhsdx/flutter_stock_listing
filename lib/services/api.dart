class API{
  static String baseUrl({String userId,int pageNo}) => "http://196.1.113.93/dvdms/getStockList?userID=$userId&pageno=$pageNo";
}