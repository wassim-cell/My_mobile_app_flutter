import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/detailPage.dart';
import 'package:my_app/homePage.dart';
import 'package:my_app/home_button.dart';
import 'package:my_app/widgets/top_container.dart';
import 'package:path/path.dart';
import 'package:my_app/validerPage.dart';
import 'package:http/http.dart' as http;

void sendData(
  context,
  TextEditingController reference,
  TextEditingController cardTypecontroller,
  TextEditingController montant,
) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': reference.toString(),
      'title': cardTypecontroller.toString(),
      'body': montant.toString(),
    }),
  );
  print(response.statusCode);

  if (response.statusCode == 201) {
  } else {
    CircularProgressIndicator();
  }
}

class DetailPage extends StatelessWidget {
  final TextEditingController reference;
  DetailPage({required this.reference});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopContainer(
                    height: 100,
                    width: 600,
                    child: Center(
                      child: Text(
                        "Page de validation",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 0)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            "STEG | 0701",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.green,
                                fontSize: 28),
                          ),
                        ),
                        SizedBox(height: 40),
                        RichText(
                            text: TextSpan(
                                text: 'Référence de facture :  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                text: '   554825418  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[600]),
                              )
                            ])),
                        SizedBox(height: 20),
                        RichText(
                            text: TextSpan(
                                text: 'Montant de facture :  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                text: "   100.000 " + "dt",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[600]),
                              )
                            ])),
                        SizedBox(height: 20),
                        Text(
                          "Frais poste :   1.000 dt",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.red),
                        ),
                        SizedBox(height: 20),
                        RichText(
                            text: TextSpan(
                                text: 'Montant à payer :  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                text: "   101.000 " + "dt",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[600]),
                              )
                            ])),
                        SizedBox(height: 20),
                        RichText(
                            text: TextSpan(
                                text: 'Numéro de téléphone :  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                text: "   53466390",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[600]),
                              )
                            ])),
                        SizedBox(height: 40),
                        Center(child: buildSubmit(context)),
                        SizedBox(height: 10),
                        Center(child: buildRetour(context))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSubmit(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => validerPage()));
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Container(
              height: 45,
              width: 195,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(color: Colors.black38, offset: Offset(0, 3))
                  ]),
              child: Text("passer au paiement",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildRetour(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => homePage()));
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Container(
              height: 45,
              width: 195,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(color: Colors.black38, offset: Offset(0, 3))
                  ]),
              child: Text("retour",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ),
      ),
    ],
  );
}
