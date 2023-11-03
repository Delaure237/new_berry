import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Sign in anon
  Future sigInAnon() async {
    try{
      UserCredential result  = await  _auth.signInAnonymously();
      User? user = result.user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
// Sign with email & password
//register with email & p ssword
// Sign out
}