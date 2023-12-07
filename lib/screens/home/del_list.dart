
   import 'package:flutter/material.dart';
   import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_berry/models/del.dart';
import 'package:new_berry/screens/home/brew_tile.dart';
   import 'package:provider/provider.dart';
   class DelList extends StatefulWidget {
     const DelList({Key? key}) : super(key: key);
   
     @override
     State<DelList> createState() => _DelListState();
   }
   
   class _DelListState extends State<DelList> {
     @override
     Widget build(BuildContext context) {
       final del = Provider.of<List<Del>>(context);

       return  ListView.builder(
         itemCount: del.length,
         itemBuilder: (context,index){
           return  DelTile(
             del:del[index]
           );

         },

       );
     }
   }
   