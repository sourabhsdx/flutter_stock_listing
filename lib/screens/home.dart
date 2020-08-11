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
          future: httpService.getData(),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.done){
              if(snapshot.hasData){
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
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: null,
//        label: Text("Add Entry"),
//        icon: Icon(Icons.add),
//      ),
    );
  }
}
