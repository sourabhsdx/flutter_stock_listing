import 'package:flutter/material.dart';

import 'component/listItem.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Listing'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: <Widget>[
            ListItem(
              medicineName: "Medicine ",
              qty: 1200,
              batchNo: "A11811",
              exp: "Sep-2019",
              mfg: "Aug-2019",
            ),
            ListItem(
              medicineName: "Medicine 2",
              qty: 1290,
              batchNo: "A11812",
              exp: "Sep-2020",
              mfg: "Aug-2020",
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text("Add Entry"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
