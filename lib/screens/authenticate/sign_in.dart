import 'package:flutter/material.dart';
import 'package:new_berry/screens/services/auth.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth =  AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In in to debrandtech"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: ElevatedButton(
            onPressed:() async {
              dynamic result =  await _auth.sigInAnon();
              if(result == null){
                print("error sign in");
              } else {
                print("Signed in");
                print(result);
              }
            } ,
            child:Text("Sign in Anon")
        ),
      ),
    );
  }
}
