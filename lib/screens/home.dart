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
  int _counter=0;
  final ScrollController _scrollController = ScrollController();
  bool _stop = false;
  List<Widget> _listMedicines = [];
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMedicines();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(!_stop) {
          _loadMedicines();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Listing'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _listMedicines = [];
              _stop = false;
              _counter =0;
              _loadMedicines();
            });
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _listMedicines.length,
            itemBuilder: (context,i){
              return _listMedicines[i];
            },
          ),
        ),
      ),
    );
  }


  _loadMedicines(){
    _counter++;
    setState(() {
      _listMedicines.add(FutureBuilder<StockList>(
        future: httpService.getData(pageNo:_counter),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasData){
              if(snapshot.data.data.length==0){
                _stop = true;
                return Center(child: Text("No More Medicines",style: GoogleFonts.cabin(),));
              }
              return Column(children:snapshot.data.data.map((e) => ListItem(data: e,)).toList(),);
            }
            return Center(child: Text("No Data",style:GoogleFonts.cabin()));
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ));
    });

  }

}



