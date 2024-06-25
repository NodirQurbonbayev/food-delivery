import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:my_flutter/compenets/my_buttons.dart';
import 'package:my_flutter/pages/delivery_progres_page.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formkey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text("Confirm payment"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card number: $cardNumber"),
                      Text("Expiry Date: $expiryDate"),
                      Text("Card Holder name: $cardHolderName"),
                      Text("CVV: $cvvCode"),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryProgresPage()));
                      },
                      child: const Text("Yes")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("No"))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formkey),
          const Spacer(),
          MyButtons(text: "Pay now", onTap: userTappedPay),
          const SizedBox(
            height: 23,
          )
          // CreditCardForm(
          //   cardNumber: cardNumber,
          //   expiryDate: expiryDate,
          //   cardHolderName: cardHolderName,
          //   cvvCode: cvvCode,
          //   onCreditCardModelChange: (CreditCardModel data) {
          //     setState(() {
          //       cardNumber = data.cardNumber;
          //       expiryDate = data.expiryDate;
          //       cardHolderName = data.cardHolderName;
          //       cvvCode = data.cvvCode;
          //       showBackView = data.isCvvFocused;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
