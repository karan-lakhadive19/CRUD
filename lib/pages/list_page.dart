// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/update.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({super.key});

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
// Making Stream
  final Stream<QuerySnapshot> studentStream =
      FirebaseFirestore.instance.collection('students').snapshots();

// for deleting user
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    // print("User Deleted ${id}");
    return students
        .doc(id)
        .delete()
        .then((value) => print("User deleted"))
        .catchError((error) => print("Failed to delete"));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(200)
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                    TableCell(
                        child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                    TableCell(
                        child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          "Action",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                  ]),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: Text(
                          storedocs[i]['name'],
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                      TableCell(
                          child: Center(
                        child: Text(
                          storedocs[i]['email'],
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                      TableCell(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UpdateScreen(id:storedocs[i]['id'])));
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.blue,
                            ),
                            IconButton(
                              onPressed: () {
                                print(deleteUser(storedocs[i]['id']));
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ])
                  ]
                ],
              ),
            ),
          );
        });
  }
}
