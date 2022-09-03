import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/card.dart';
import 'package:my_app/detailPage.dart';
import 'package:my_app/home_button.dart';
import 'package:my_app/validerPage.dart';
import 'package:http/http.dart' as http;

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  String? cardNumber;

  String? cardType;
  String? securitycode;
  String? zipcode;
  String? address;
  final List<String?> errors = [];
  final TextEditingController reference = new TextEditingController();
  final TextEditingController cardTypecontroller = new TextEditingController();
  final TextEditingController montant = new TextEditingController();
  final TextEditingController phoneNumber = new TextEditingController();
  final TextEditingController _cardTypecontroller = new TextEditingController();
  final TextEditingController cardNumbercontroller =
      new TextEditingController();
  final TextEditingController date = new TextEditingController();
  final TextEditingController cardCodecontroller = new TextEditingController();

  var cardlist = [
    'carte bancaire',
    'carte postale',
  ];
  addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {});
    }
    (() {
      errors.add(error);
    });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  DateTime expirydate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: expirydate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null && picked != expirydate)
      setState(() {
        expirydate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(
            "Remplier ce formulaire :",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
            child: TextField(
              style: TextStyle(color: Colors.black, fontSize: 14.5),
              keyboardType: TextInputType.number,
              controller: _cardTypecontroller,
              decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(minWidth: 45),
                  prefixIcon: Icon(
                    Icons.card_membership_outlined,
                    color: Color.fromARGB(179, 14, 1, 1),
                    size: 22,
                  ),
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      _cardTypecontroller.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return cardlist
                          .map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(
                            child: new Text(value), value: value);
                      }).toList();
                    },
                  ),
                  border: InputBorder.none,
                  hintText: 'Mode de paiement',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
            child: TextField(
              style: TextStyle(color: Colors.black, fontSize: 14.5),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(minWidth: 45),
                  prefixIcon: Icon(
                    Icons.code,
                    color: Color.fromARGB(179, 14, 1, 1),
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'Reference de facture (9 nb)',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black, fontSize: 14.5),
              decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(minWidth: 45),
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Color.fromARGB(179, 14, 1, 1),
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'Montant de facture (dt)',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black, fontSize: 14.5),
              decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(minWidth: 45),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(179, 14, 1, 1),
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'Entre votre numero ',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14.5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(height: 15),
          Center(
            child: HomeButton(
              title: 'Valider',
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => DetailPage(
                          reference: this.reference,
                        )));
              },
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
