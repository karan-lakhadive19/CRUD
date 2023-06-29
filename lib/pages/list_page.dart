// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myapp/pages/update.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({super.key});

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {

  deleteUser(id) {
    print("User Deleted ${id}");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{1: FixedColumnWidth(200)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              TableCell(
                  child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              TableCell(
                  child: Container(
                color: Colors.greenAccent,
                child: Center(
                  child: Text(
                    "Action",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
            ]),
            TableRow(children: [
              TableCell(
                  child: Center(
                child: Text(
                  "Karan",
                  style: TextStyle(fontSize: 18),
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  "karan@gmail.com",
                  style: TextStyle(fontSize: 18),
                ),
              )),
              TableCell(
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateScreen()));
                      }, icon: Icon(Icons.edit), color: Colors.blue,),

                      IconButton(onPressed: () {
                        deleteUser(1);
                      }, icon: Icon(Icons.delete), color: Colors.red,),

                    ],
                  ),),
            ])
          ],
        ),
      ),
    );
  }
}
