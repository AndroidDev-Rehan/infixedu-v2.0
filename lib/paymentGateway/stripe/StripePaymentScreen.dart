// // Dart imports:
// import 'dart:convert';
//
// // Flutter imports:
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:flutter_credit_card/credit_card_brand.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:http/http.dart' as http;
//
// // Project imports:
// import 'package:infixedu/config/app_config.dart';
// import 'package:infixedu/utils/CustomAppBarWidget.dart';
// import 'package:infixedu/utils/Utils.dart';
// import 'package:infixedu/utils/apis/Apis.dart';
// import 'package:infixedu/utils/model/Fee.dart';
// import 'package:infixedu/utils/model/UserDetails.dart';
// import 'package:stripe_payment/stripe_payment.dart';
//
// class StripeScreen extends StatefulWidget {
//   final String id;
//   final String paidBy;
//   final FeeElement fee;
//   final String email;
//   final String method;
//   final String amount;
//   final UserDetails userDetails;
//
//   StripeScreen(
//       {this.id,
//       this.paidBy,
//       this.fee,
//       this.email,
//       this.method,
//       this.amount,
//       this.userDetails});
//
//   @override
//   State<StatefulWidget> createState() {
//     return StripeScreenState();
//   }
// }
//
// class StripeScreenState extends State<StripeScreen> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   bool useGlassMorphism = false;
//   bool useBackgroundImage = false;
//   OutlineInputBorder border;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   bool loading = false;
//   var _token;
//
//   var loadingText = "";
//
//   var referenceId = "";
//
//   Token _paymentToken;
//   PaymentMethod _paymentMethod;
//   PaymentIntentResult paymentIntent;
//   String _currentSecret = "";
//   Map<String, dynamic> paymentIntentData;
//
//   @override
//   void initState() {
//     border = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey.withOpacity(0.7),
//         width: 2.0,
//       ),
//     );
//     Utils.getStringValue('token').then((value) {
//       _token = value;
//     });
//     StripePayment.setOptions(StripeOptions(
//       publishableKey: stripePublishableKey,
//       merchantId: stripeMerchantID,
//       androidPayMode: 'test',
//     ));
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }
//
//   CreditCard testCard;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         resizeToAvoidBottomInset: true,
//         appBar: CustomAppBarWidget(
//           title: widget.method,
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             color: Colors.black,
//           ),
//           child: Column(
//             children: <Widget>[
//               CreditCardWidget(
//                 glassmorphismConfig:
//                     useGlassMorphism ? Glassmorphism.defaultConfig() : null,
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 showBackView: isCvvFocused,
//                 obscureCardNumber: true,
//                 obscureCardCvv: true,
//                 isHolderNameVisible: true,
//                 cardBgColor: Colors.deepPurpleAccent,
//                 isSwipeGestureEnabled: true,
//                 onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       CreditCardForm(
//                         formKey: formKey,
//                         obscureCvv: true,
//                         obscureNumber: true,
//                         cardNumber: cardNumber,
//                         cvvCode: cvvCode,
//                         isHolderNameVisible: true,
//                         isCardNumberVisible: true,
//                         isExpiryDateVisible: true,
//                         cardHolderName: cardHolderName,
//                         expiryDate: expiryDate,
//                         themeColor: Colors.blue,
//                         textColor: Colors.white,
//                         cardNumberDecoration: InputDecoration(
//                           labelText: 'Number',
//                           hintText: 'XXXX XXXX XXXX XXXX',
//                           hintStyle: const TextStyle(color: Colors.white),
//                           labelStyle: const TextStyle(color: Colors.white),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                         ),
//                         expiryDateDecoration: InputDecoration(
//                           hintStyle: const TextStyle(color: Colors.white),
//                           labelStyle: const TextStyle(color: Colors.white),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                           labelText: 'Expired Date',
//                           hintText: 'XX/XX',
//                         ),
//                         cvvCodeDecoration: InputDecoration(
//                           hintStyle: const TextStyle(color: Colors.white),
//                           labelStyle: const TextStyle(color: Colors.white),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                           labelText: 'CVV',
//                           hintText: 'XXX',
//                         ),
//                         cardHolderDecoration: InputDecoration(
//                           hintStyle: const TextStyle(color: Colors.white),
//                           labelStyle: const TextStyle(color: Colors.white),
//                           focusedBorder: border,
//                           enabledBorder: border,
//                           labelText: 'Card Holder',
//                         ),
//                         onCreditCardModelChange: onCreditCardModelChange,
//                       ),
//                       loading
//                           ? Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     CircularProgressIndicator(
//                                       color: Colors.deepPurpleAccent,
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       '$loadingText',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .subtitle2
//                                           .copyWith(color: Colors.white),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           : ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 primary: const Color(0xff1b447b),
//                               ),
//                               child: Container(
//                                 margin: const EdgeInsets.all(12),
//                                 child: const Text(
//                                   'Continue',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () async {
//                                 if (formKey.currentState.validate()) {
//                                   var fullDate = expiryDate.split("/");
//                                   await paymentDataSave("Stripe")
//                                       .then((value) async {
//                                     setState(() {
//                                       referenceId = value.toString();
//                                     });
//                                     await payWithStripe(fullDate);
//                                   });
//                                 } else {
//                                   print('invalid!');
//                                 }
//                               },
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<dynamic> paymentDataSave(String method) async {
//     setState(() {
//       loading = true;
//       loadingText = "Payment Data created..";
//     });
//     ///Step 0
//     Map data = {
//       'student_id': widget.id,
//       'fees_type_id': widget.fee.feesTypeId,
//       'amount': widget.amount,
//       'method': method,
//       'school_id': widget.userDetails.schoolId,
//     };
//     final response = await http.post(
//       Uri.parse(InfixApi.paymentDataSave),
//       body: jsonEncode(data),
//       headers: {
//         "Accept": "application/json",
//         "Authorization": _token.toString(),
//       },
//     );
//     print("paymentDataSave ${response.body}");
//     print("paymentDataSave ${response.statusCode}");
//
//     var jsonString = jsonDecode(response.body);
//
//     return jsonString['payment_ref'];
//   }
//
//   Future payWithStripe(fullDate) async {
//     /// STEP 1
//     setState(() {
//       testCard = CreditCard(
//         number: '${cardNumber.replaceAll(" ", "").toString()}',
//         expMonth: int.parse(fullDate[0]).toInt(),
//         expYear: int.parse(fullDate[1]).toInt(),
//         name: '$cardHolderName',
//         cvc: '$cvvCode',
//       );
//     });
//
//     StripePayment.createTokenWithCard(
//       testCard,
//     ).then((token) async {
//       setState(() {
//         loadingText = "Payment Token Created";
//       });
//       setState(() {
//         _paymentToken = token;
//       });
//       await createPaymentMethodWithToken();
//     }).catchError(setError);
//   }
//
//   Future createPaymentMethodWithToken() async {
//     /// STEP 2
//     StripePayment.createPaymentMethod(
//       PaymentMethodRequest(
//         card: CreditCard(
//           token: _paymentToken.tokenId,
//         ),
//       ),
//     ).then((paymentMethod) async {
//       setState(() {
//         loadingText = "Token Verified";
//       });
//       setState(() {
//         _paymentMethod = paymentMethod;
//       });
//       await createPaymentIntent();
//     }).catchError(setError);
//   }
//
//   Future<void> createPaymentIntent() async {
//     ///STEP 3
//     final url = Uri.parse(
//         '$stripeServerURL/create-payment-intent?amount=${int.parse(widget.amount) * 100}');
//
//     print(url);
//
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//     ).catchError((error) {
//       print('EROROR ${error.toString()}');
//     });
//
//     print(response.body);
//
//     paymentIntentData = json.decode(response.body);
//     setState(() {
//       _currentSecret = paymentIntentData['clientSecret'];
//       loadingText = "Verifying your payment..";
//     });
//
//     await confirmIntent();
//     print('payment intent $paymentIntentData');
//   }
//
//   Future confirmIntent() async {
//     ///STEP 4 - Final
//     StripePayment.confirmPaymentIntent(
//       PaymentIntent(
//         clientSecret: _currentSecret,
//         paymentMethodId: _paymentMethod.id,
//       ),
//     ).then((paymentIntent) async {
//       setState(() {
//         paymentIntent = paymentIntent;
//         loadingText = "Payment verified. Please wait...";
//       });
//       await paymentCallBack(status: true, reference: referenceId);
//     }).catchError(setError);
//   }
//
//   String error;
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//
//   void setError(dynamic error) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
//     setState(() {
//       error = error.toString();
//       loading = false;
//     });
//   }
//
//   Future paymentCallBack({dynamic reference, dynamic status}) async {
//     final response = await http.post(
//       Uri.parse(
//           InfixApi.paymentSuccessCallback(status, reference, widget.amount)),
//       headers: {
//         "Accept": "application/json",
//         "Authorization": _token.toString(),
//       },
//     );
//     print("paymentCallBack ===> ${response.body}");
//     print("paymentCallBack ===> ${response.statusCode}");
//     await studentPayment();
//   }
//
//   Future studentPayment() async {
//     try {
//       final response = await http.get(
//           Uri.parse(InfixApi.studentFeePayment(
//               widget.id.toString(),
//               int.parse(widget.fee.feesTypeId.toString()),
//               widget.amount,
//               widget.paidBy,
//               'C')),
//           headers: {
//             "Accept": "application/json",
//             "Authorization": _token.toString(),
//           });
//       print('Response Status => ${response.statusCode}');
//       print('Response Body => ${response.body}');
//       if (response.statusCode == 200) {
//         setState(() {
//           loading = false;
//         });
//         print(response.body);
//         var data = json.decode(response.body.toString());
//         print(data['success']);
//
//         print(data);
//         if (data['success'] == true) {
//           Utils.showToast('Payment Added');
//           Navigator.of(context).pop();
//         } else {
//           Utils.showToast('Some error occurred');
//         }
//       } else {
//         setState(() {
//           loading = true;
//         });
//       }
//     } catch (e) {
//       Exception('${e.toString()}');
//     }
//   }
//
//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }
