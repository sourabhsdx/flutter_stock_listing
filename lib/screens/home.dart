import 'package:flutter/material.dart';
import 'package:flutter_stock_listing/models/StockList.dart';
import 'package:flutter_stock_listing/services/http_service.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  return Center(child: Text("No Data Fetched",style: GoogleFonts.cabin(),));
                }
                return RefreshIndicator(
                  onRefresh:() async {
                    setState(() {});
                  } ,
                  child: ListView.builder(
                    itemCount: snapshot.data.data.length+1,
                    itemBuilder: (context,i)=>i==snapshot.data.data.length?ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton.icon(
                          label: Text('Prev',style:GoogleFonts.cabin()),
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: _counter==1?null:_prevCounter,
                        ),
                        FlatButton.icon(
                          label: Text('Next',style: GoogleFonts.cabin(),),
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: snapshot.data.data.length<10?null:_nextCounter,
                        )
                      ],
                    ):ListItem(data: snapshot.data.data[i],),
                  ),
                );
              }
              return Center(child: Text("No Data",style:GoogleFonts.cabin()));
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
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
