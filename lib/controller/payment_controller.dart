import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http ;

class PaymentController {
  Map<String, dynamic>?PaymentIntentData;


  Future <void> makepayment({required String amount, required String currency})async{
    try {
      PaymentIntentData = await createPaymentIntent(amount, currency);
      if (PaymentIntentData != null) {
       await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
           applePay: PaymentSheetApplePay(
          merchantCountryCode: "US"
        ),
        googlePay: PaymentSheetGooglePay(
          merchantCountryCode: "US",
          
        ),
        style: ThemeMode.dark,
        merchantDisplayName: "PARVEJ",
        customerId: PaymentIntentData!['customer'],
        paymentIntentClientSecret: PaymentIntentData!['client_secret'],
        customerEphemeralKeySecret: PaymentIntentData!['ephemeralkey']
      )
      );
      displayPaymentSheet();
      }
    } catch (e) {
      
    }
  }


  displayPaymentSheet()async{
    try {
      await Stripe.instance.presentPaymentSheet();
      print('Payment Successful');
    }on Exception catch (e) {
     if (e is StripeException) {
       print('Error from Stripe: ${e.error.localizedMessage}');
     } else {
       print('Unforeseen error:${e}');
     }  
    }catch (e){
      print('exception: $e');
    }
  }




 createPaymentIntent(String amount,String currency)async{
 try {
   Map<String, dynamic>body = {
    "amount":calculateAmount(amount),
    "currency":currency,
    "payment_method_types[]":"card"
   };


   var response = await http.post(Uri.parse("https://api.stripe.com/v1/payment_intents"),
   body: body,
   headers: {
   'authorization':
      'Bearer 	sk_test_51LZUGyGLTJ53nGTLbfUpwrzlhz1PWluwbIuisEVV0uk5QJ9hO0bFefqgfRzhol4e8ntKKoOQXdshW6mLTQoXXpwh00JqwPGCkB',
    'Content-Type': 'application/x-www-form-unlencoded'
   }
   );
   return jsonDecode(response.body.toString());




 } catch (e) {
   print(e);
 }
  }
  calculateAmount(String amount){
    final a = (int.parse(amount)) *100 ;
    return a.toString();
  }








}