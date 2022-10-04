import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payment2/controller/payment_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var obj = PaymentController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: ElevatedButton(
          onPressed: (){

 obj.makepayment(amount: '5', currency: 'USD') ;
          },
          
         
          child: Text("Make A Payment")
          ),
      ),
    );
    
  }
}