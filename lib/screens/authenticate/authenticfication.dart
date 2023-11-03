import'package:flutter/material.dart';
import 'package:new_berry/screens/authenticate/sign_in.dart';
class Authenticate extends StatefulWidget{
  @override
  AuthenticateState createState() => AuthenticateState();
}
class AuthenticateState extends State<Authenticate>{
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          child:SignIn()
      ),
    );
  }
}