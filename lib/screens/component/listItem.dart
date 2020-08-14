import 'package:flutter/material.dart';
import 'package:flutter_stock_listing/models/StockList.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatelessWidget {
  ListItem({this.data});
  final Data data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          key: Key(data.batchNo),
          title: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(data.drugName,style: GoogleFonts.cabin(),),
              ),
              Chip(
                backgroundColor: Colors.green,
                label:Text(
                  "Available Qty. ${data.availableQty}",
                  style: GoogleFonts.cabin(color: Colors.white,fontSize: 12),
                ) ,
              ),

            ],
          ),
          children: <Widget>[
            Text("Batch No.  ${data.batchNo}"??"null",style: GoogleFonts.cabin(),),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Exp. Date: ${data.expiryDate}",style: GoogleFonts.cabin(),),
                Text("Mfg. Date: ${data.manufactureDate}",style: GoogleFonts.cabin(),)
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
        Divider(color: Colors.blue,)
      ],
    );
  }
}
