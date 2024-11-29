// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:api/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home_screen> {
  List  users=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  void fetchUsers() async {
    final response= await http.get(Uri.parse('https://jsonplaceholder.org/users')
    );
    final List<dynamic> jsonData = json.decode(response.body);
    print(jsonData);

    setState(() {
      users = jsonData.map((data) =>User(id: data['id'],
     firstname: data['firstname'],
      lastname: data['lastname'],
       email: data['email'],
     phone: data['phone']) ,)
     .toList();
    });

  }
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user=users[index];
          return ListTile(
            title: Text(
              '${user.firstname} ${user.lastname}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("${user.email}"),
            leading: CircleAvatar(child: Text(user.firstname[0]),)
          );
        },
      ),
    );
  }
}
