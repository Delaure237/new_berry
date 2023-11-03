import 'package:flutter/material.dart';
import 'package:new_berry/screens/authenticate/authenticfication.dart';
import 'package:new_berry/screens/home/home.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return home or authenticate widget

    return Authenticate();
  }
}
