import 'package:flutter/material.dart';
import 'package:myapp/pages/list_page.dart';
import 'package:myapp/pages/stud_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("CRUD"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StudentPage()));
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ))
        ],
      )),
      body: ListStudentPage(),
    );
  }
}
