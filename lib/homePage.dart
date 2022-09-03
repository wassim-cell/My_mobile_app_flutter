import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/form.dart';
import 'package:my_app/widgets/top_container.dart';
import 'package:my_app/widgets/back_button.dart';
import 'package:intl/intl.dart';
import 'package:my_app/validerPage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'detailPage.dart';
import 'home_button.dart';

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homePageState();
  }
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    queryData.size.width;
    queryData.size.height;

    return new AspectRatio(
      aspectRatio: 100 / 100,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopContainer(
                      height: 120,
                      width: 600,
                      child: Center(
                        child: Text(
                          "Bonjour cher client",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: PaymentForm(),
                  ),
                ],
              ),
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
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => validerPage()));
          },
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 25),
            child: Container(
              height: 56,
              width: 205,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 51, 155, 240),
                borderRadius: BorderRadius.circular(34),
              ),
              child: Text("envoyer",
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
            ),
          ),
        ),
      ),
    ],
  );
}
