import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_berry/models/user.dart';
import 'package:new_berry/screens/services/database.dart';
class AuthService {
  //create a new obj based on FirebaseUser
  CurrentUser?  _userFromFirebaseUser(User user){
    return  CurrentUser (uid: user.uid ) ;
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // auth change user stream
  Stream<CurrentUser?> get user {

    return _auth.authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user)); //  .map((User user) =>    _userFromFirebaseUser(user));
        .map((User ? user) => _userFromFirebaseUser(user!)!);
  }

  // Sign in anon
  Future signInAnon() async {
    try{
      UserCredential result  = await  _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
// Sign with email & password
  Future sigInWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
//register with email & password
  Future RegisterWithEmailAndPassword(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid
      await DataBaseService(uid: user!.uid).updateUserDatas('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
// Sign out
Future signOut() async {
    try{
      return await _auth.signOut();

    } catch(e){
      print(e.toString());
      return null;
    }
}
}