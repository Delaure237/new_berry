import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_berry/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_berry/models/user.dart';
import 'package:new_berry/screens/services/auth.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var init ;
    return StreamProvider<CurrentUser?>.value(
      catchError: (_,__) => null,
        value: AuthService().user,
        initialData:null,
        child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Wrapper(),
    )
    );
  }
}

