import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment2/home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
  "pk_test_51LZUGyGLTJ53nGTLvvhk63yYjifQGHmnvxwf8VHvYZj0RW03EKY0Pr2mFOKVNzAsSrJ6K4lp359z9vvKKa0gF7vS00iyxDuFy3";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}

