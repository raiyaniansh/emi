import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double selectedvalue = 0;
  double interestrate = 0;
  double loantenure = 0;
  double answer = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff19235C),
          elevation: 0,
          title: Text("EMI Calculator", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: Icon(
            Icons.widgets_outlined,
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(165),
                  colors: [
                    Color(0xff19236A),
                    Color(0xff0f2027),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      "Your Loan EMI is",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${answer.toInt()} \$",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          TextSpan(
                            text: "month",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 8),
                      child: Text(
                        "Loan Amount",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff484848)),
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("Loan Amount",
                              style: TextStyle(
                                  color: Color(0xffE5E6E3), fontSize: 40)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${selectedvalue.toInt()} \$",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                    Slider(
                        value: selectedvalue,
                        max: 200000,
                        divisions: 20,
                        activeColor: Color(0xff0f2027),
                        inactiveColor: Color(0xff192995),
                        onChanged: (value) {
                          setState(() {
                            selectedvalue = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 8),
                      child: Text(
                        "Interest Rate",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff484848)),
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("Interest Rate",
                              style: TextStyle(
                                  color: Color(0xffE5E6E3), fontSize: 40)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${interestrate.toInt()} %",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                    Slider(
                        value: interestrate,
                        max: 16,
                        divisions: 16,
                        activeColor: Color(0xff0f2027),
                        inactiveColor: Color(0xff192995),
                        onChanged: (value) {
                          setState(() {
                            interestrate = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 8),
                      child: Text(
                        "Loan Tenure ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff484848)),
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("Loan Tenure ",
                              style: TextStyle(
                                  color: Color(0xffE5E6E3), fontSize: 40)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${loantenure.toInt()} Months",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                    Slider(
                        value: loantenure,
                        max: 60,
                        divisions: 5,
                        activeColor: Color(0xff0f2027),
                        inactiveColor: Color(0xff192995),
                        onChanged: (value) {
                          setState(() {
                            loantenure = value;
                          });
                        }),
                    InkWell(
                      onTap: () {
                        setState(() {
                          answer = selectedvalue *
                              interestrate *
                              (loantenure / 12) /
                              100;
                        });
                      },
                      child: Container(
                        height: 65,
                        width: 175,
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            border: Border.all(color: Color(0xff20295C))),
                        alignment: Alignment.center,
                        child: Text("Calculate",
                            style: TextStyle(
                                color: Color(0xff2C3568), fontSize: 30)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
