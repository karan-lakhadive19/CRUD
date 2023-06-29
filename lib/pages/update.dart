// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => UpdateScreenState();
}

class UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var password = "";


  updateUser() {
    print("User updated");
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Student"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(),
                  child: TextFormField(
                    initialValue: "Karan",
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    onChanged: (value) {
                      
                    },
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
                  initialValue: "karan@gmail.com",
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  onChanged: (value) {
                    
                  },
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
                  onChanged: (value) {
                    
                  },
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
                            updateUser();
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 18),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
