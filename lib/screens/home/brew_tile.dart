import 'package:flutter/material.dart';
import 'package:new_berry/models/del.dart';

  class DelTile extends StatelessWidget {
    final Del del;
    const DelTile({ required this.del}) ;

    @override
    Widget build(BuildContext context) {
      return Padding(
          padding: EdgeInsets.only(top:8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[del.strength],
            ),
            title: Text(del.name),
            subtitle: Text(del.sugars),
          ),
        ),
      );
    }
  }
