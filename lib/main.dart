import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/firstPage.dart';
import 'package:my_app/homePage.dart';
import 'package:path/path.dart';
import 'package:my_app/validerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my_app",
      home: StartPage(),
      routes: {
        'homePage': (context) {
          return homePage();
        }
      },
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 45, right: 5, left: 5),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Image.asset('assets/img.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25, right: 15, left: 25),
              child: Text(
                "ادفع فاتورة الكهرباء و الغاز الخاصة بك الآن و بكل سهولة",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "  باستعمال هذا البرنامج يمكنك دفع فاتورة  الكهرباء و الغاز\n    بضغطة زر واحدة , بامكانك البدأ الأن  إجراءات \n الدفع انقر على زر ابدأ الآن",
              style:
                  GoogleFonts.poppins(color: Color(0xffBBBBBB), fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 110),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => homePage()));
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Container(
                    height: 56,
                    width: 315,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Text("أبدأ الان",
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
