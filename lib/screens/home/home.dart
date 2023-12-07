import'package:flutter/material.dart';
import 'package:new_berry/screens/services/auth.dart';
import 'package:new_berry/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_berry/screens/home/del_list.dart';
import 'package:new_berry/models/del.dart';
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
final AuthService _auth =  AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Del>?>.value(
        value: DataBaseService(uid: '').del,
        initialData:null,
    child:Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("BREW CREW"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions:<Widget> [
           TextButton(
          onPressed: () async {
             await _auth.signOut();
          },
               child: const Row(
              children: [
                Icon(Icons.logout,color: Colors.black,),
                Text("Log out")
              ],
               )
           )
        ],
      ),
      body: DelList(

      ),
    )
    );

  }
}
