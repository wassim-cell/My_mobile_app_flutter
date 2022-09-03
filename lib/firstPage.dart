// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon/icon.dart';
import 'package:my_app/firstPage.dart';
import 'package:my_app/homePage.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class firstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();
}

Future createAlbum(int id) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
      'id': 2,
    }),
  );
  if (response.statusCode == 201) {
    var res = jsonDecode(response.body);
    print(res);
  } else {
    print("non");
  }
}

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class _firstPageState extends State<firstPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xff319DF7)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, left: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 80),
                          Text(
                            " مرحباً بك ",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 80),
                          buildInput(_formKey, _controller),
                          SizedBox(height: 5),
                          buildSubmit(context, _controller),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildInput(_formKey, _controller) {
  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(": أدخل رقم بطاقة التعريف هنا",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerRight,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(color: Colors.black38, offset: Offset(0, 2))
              ]),
          child: TextFormField(
            controller: _controller,
            validator: (value) {
              if (value == null) {
                return "You have to add Value here !";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.card_membership,
                ),
                contentPadding: EdgeInsets.only(right: 15, top: 10),
                hintText: "رقم بطاقة التعريف الوطنية ",
                hintStyle: TextStyle(color: Colors.black38, fontSize: 16)),
          ),
        )
      ],
    ),
  );
}

Widget buildSubmit(BuildContext context, _controller) {

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
            padding: EdgeInsets.only(top: 30, bottom: 25),
            child: Container(
              height: 56,
              width: 205,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xff0A6FF9),
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(color: Colors.black38, offset: Offset(0, 3))
                  ]),
              child: Text(" إرسال",
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
            ),
          ),
        ),
      ),
    ],
  );
}
