import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_berry/screens/authenticate/authenticfication.dart';
import 'package:new_berry/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return home or authenticate widget
  final user = Provider.of<CurrentUser?>(context);
  if(user == null){
    return Authenticate();
  } else{
    return Home();
  }

  }
}
