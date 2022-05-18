import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/add.dart';
import 'package:project/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
const primaryColor = Colors.greenAccent;
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        () async {
      await Firebase.initializeApp();

    };

  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.greenAccent,

          )),

      debugShowCheckedModeBanner: false,

      home: const home(),
    );
  }
}
