import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/authenticationpage.dart';
import 'package:food_delivery_app/screens/bottomNavBar.dart';
import 'package:food_delivery_app/screens/cart.dart';
import 'package:food_delivery_app/screens/details_page.dart';
import 'package:food_delivery_app/screens/drawer.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        canvasColor: Color(0xffF5F5F8),

        fontFamily: 'SF Pro Rounded',
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error:" + snapshot.error.toString());
            return Text("something went wrong!");
          } else if (snapshot.hasData) {
            return Onboarding();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ), //HomePage(), //Onboarding(), //Onboarding(),
    );
  }
}
