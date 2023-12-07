import 'package:flutter/material.dart';
import 'package:new_berry/shared/constants.dart';
import 'package:new_berry/shared/loading.dart';

import '../services/auth.dart';
class Register extends StatefulWidget {

   final Function toggleView;
   const Register ({ required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth =  AuthService();
  final _formKey =  GlobalKey<FormState>();
  bool  loading = false;
  String email ="";
  String password ="";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("Sign up in to debrandtech"),
        actions: [

          TextButton(onPressed: () {
            widget.toggleView();
          },
              child:const  Row(
                children: [
                  Icon(Icons.person,color:Colors.black,),
                  Text("Sign in",style: TextStyle(
                    color: Colors.black,
                  ),)
                ],
              )
          )
        ],
      ),
      body: Container(
          padding:const  EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
                children: <Widget> [
                 const  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val)=> val!.isEmpty ? "Enter and email" : null,
                    onChanged: (val){
                      setState(() => email =val);
                    },
                  ),
                 const  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'password'),
                    validator: (val) => val!.length<8 ? "Enter a password 8+ chars long" : null,
                    obscureText: true,
                    onChanged: (val){
                      setState(() => password = val);
                    },
                  ),
                 const  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                loading = true;
                              });
                             dynamic result = await _auth.RegisterWithEmailAndPassword(
                               email,password);
                             if(result == null){
                                     setState(() {
                                       loading = true;
                                     });
                             }
                            }
                            },
                       child: Container(
                    color: Colors.pink[400],
                    child:const  Text("Register",
                      style: TextStyle(
                        color:Colors.white,
                      ),
                    ),

                  )

                  ),
                 const  SizedBox(height: 20,),
                  Text(
                    error,
                    style:const  TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  )

                ]
            ),
          )
        /*  ElevatedButton(
            onPressed:() async {
              dynamic result =  await _auth.sigInAnon();
              if(result == null){

                  print("error sign in");

              } else {
                print("Signed in");
                print(result.uid);
              }

            } ,
            child:Text("Sign in Anon")
        ),*/
      ),
    );
  }
}
