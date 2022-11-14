import 'package:flutter/material.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

class Alldatascreen extends StatefulWidget {
  const Alldatascreen({Key? key}) : super(key: key);

  @override
  State<Alldatascreen> createState() => _AlldatascreenState();
}
class _AlldatascreenState extends State<Alldatascreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(20)),
                      SizedBox(
                        height: 40.0,
                        width: 150.0,
                        child: MaterialButton(
                          color: Colors.red,
                          onPressed: () {  },
                          child:  Center(
                              child: Text(
                                'Export to PDF',
                                style: TextStyle(color: Colors.white),
                              )),
                          // onPressed: exportDataGridToPdf
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),
          Expanded(
            child: LazyDataTable(
              rows: 8,
              columns: 20,
              tableDimensions: LazyDataTableDimensions(
                cellHeight: 50,
                cellWidth: 100,
                topHeaderHeight: 50,
                leftHeaderWidth: 75,
              ),
              topHeaderBuilder: (i) => Center(child: Text("Class: ${i + 1}")),
              leftHeaderBuilder: (i) => Center(child: Text("English")),
              dataCellBuilder: (i, j) => Center(child: Text("")),
              topLeftCornerWidget: Center(child: Text("Sub/Class")),
            ),
          )
        ],
      ),
    );
  }
}