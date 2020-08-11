import 'package:flutter/material.dart';
import 'package:flutter_stock_listing/models/StockList.dart';

class ListItem extends StatelessWidget {
  ListItem({this.data});
  final Data data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          key: Key(data.batchNo),
          title: Wrap(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(data.drugName),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Available Qty. ${data.availableQty}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          children: <Widget>[
            Text("Batch No.  ${data.batchNo}"??"null"),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Exp. Date: ${data.expiryDate}"),
                Text("Mfg. Date: ${data.manufactureDate}")
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
        Divider()
      ],
    );
  }
}
