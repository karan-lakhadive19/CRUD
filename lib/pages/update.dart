// ignore_for_file: prefer_const_constructors



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpdateScreen extends StatefulWidget {
  String id = '';
  UpdateScreen({super.key, required this.id});

  @override
  State<UpdateScreen> createState() => UpdateScreenState();
}

class UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var password = "";

  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  Future<void> updateUser(id, name, email, password) {
    // print("User updated");
    return students.doc(id).update({
      'name':name,
      'email':email,
      'password':password
    }).then((value) => print("User updated")).catchError((error)=>print("Failed"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Student"),
      ),
      body: Form(
          key: _formKey,
          // getting data
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('students')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print("Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var name = data!['name'];
              var email = data!['email'];
              var password = data!['password'];

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(),
                        child: TextFormField(
                          initialValue: name,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Name: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          onChanged: (value) {name=value;},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter name";
                            }
                            return null;
                          },
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: email,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Email: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        onChanged: (value) {email=value;},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        onChanged: (value) {password=value;},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  updateUser(widget.id, name, email, password);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(fontSize: 18),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Reset",
                                style: TextStyle(fontSize: 18),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
