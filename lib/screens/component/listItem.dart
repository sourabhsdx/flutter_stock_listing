import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({this.medicineName, this.batchNo, this.qty, this.exp, this.mfg});
  final String medicineName;
  final String batchNo;
  final int qty;
  final String exp;
  final String mfg;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        title: Wrap(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(medicineName),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Available Qty. $qty",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
        children: <Widget>[
          Text("Batch No.  $batchNo"),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Exp. Date: $exp"),
              Text("Mfg. Date: $mfg")
            ],
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
