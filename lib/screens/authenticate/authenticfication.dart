import'package:flutter/material.dart';
import 'package:new_berry/screens/authenticate/register.dart';
import 'package:new_berry/screens/authenticate/sign_in.dart';
class Authenticate extends StatefulWidget{
  @override
  AuthenticateState createState() => AuthenticateState();
}
class AuthenticateState extends State<Authenticate>{
  bool showSignIn = true;
  void toogleView() {
    setState(() => showSignIn =! showSignIn);
  }
  @override
  Widget build(BuildContext context){
   if(showSignIn){
     return SignIn(toggleView: toogleView);
   }else{
     return Register(toggleView: toogleView );
   }

  }
}