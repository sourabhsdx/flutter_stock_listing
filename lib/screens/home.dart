import 'package:flutter/material.dart';
import 'package:flutter_stock_listing/models/StockList.dart';
import 'package:flutter_stock_listing/services/http_service.dart';

import 'component/listItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var httpService = HttpService();
  int _counter=1;
  int _index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Listing'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: FutureBuilder<StockList>(
          future: httpService.getData(pageNo:_counter),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.done){
              if(snapshot.hasData){
                if(snapshot.data.data.length==0){
                  return Center(child: Text("No Data Fetched"));
                }
                return RefreshIndicator(
                  onRefresh:() async {
                    setState(() {});
                  } ,
                  child: ListView.builder(
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context,i)=>ListItem(data: snapshot.data.data[i],),
                  ),
                );
              }
              return Center(child: Text("No Data"));
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex:_index ,
       onTap: (i){
         switch(i){
           case 0:
             _prevCounter();
             break;
           case 1:
             _nextCounter();
             break;
           default:
             break;
         }
         setState(() {
           _index = i;
         });
       },
       items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.arrow_back_ios),
           title: Text("Previous")
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.arrow_forward_ios),
             title: Text("Next")
         )
       ],
     ),
    );
  }

  void _nextCounter() {
    setState(() {
      _counter++;
    });
  }

  void _prevCounter() {
    setState(() {
      _counter--;
    });
  }

}
