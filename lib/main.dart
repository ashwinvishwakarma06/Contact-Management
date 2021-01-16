import 'package:flutter/material.dart';
import 'package:contact/Data_Model/ContactProvider.dart';
import 'package:contact/Screens/HomeScreen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ContactProvider(),
      child: MaterialApp(
        title: 'Flutter Contact',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home_Screen()
      ),
    );
  }
}
