// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int x = 0;
  int y = 0;
  num z = 0;

  bool isnewvalue = false;

  final ControllerX = TextEditingController();
  final ControllerY = TextEditingController();
  final ControllerZ = TextEditingController();

  @override
  void initState() {
    super.initState();
    ControllerX.text = x.toString();
    ControllerY.text = y.toString();
  }

  void updateCurrentValue() {
    setState(() {
      isnewvalue = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SafeArea(
        // maintainBottomViewPadding: false,
        // minimum: EdgeInsets.all(50),
        // top: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Textfield(hint: "Enter a first number", controller: ControllerX),
              SizedBox(height: 20),
              Textfield(
                hint: "Enter a Second number",
                controller: ControllerY,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isnewvalue ? "New value" : "current value",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            z.toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                // color: Colors.black.withOpacity(0.1),
                child: FloatingActionButton(
                  backgroundColor: Colors.red.withOpacity(0.4),
                  onPressed: () {
                    setState(() {
                      z = 0;
                      x = 0;
                      y = 0;
                      isnewvalue = false;
                      ControllerX.clear();
                      ControllerY.clear();
                    });
                  },
                  child: Text(
                    "clear",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      // z = x + y;
                      z = num.tryParse(ControllerX.text)! +
                          num.tryParse(ControllerY.text)!;
                      setState(() {
                        print(z);
                        updateCurrentValue();
                      });
                    },
                    child: Icon(Icons.add_circle_rounded),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      z = num.tryParse(ControllerX.text)! -
                          num.tryParse(ControllerY.text)!;
                      setState(() {
                        print(z);
                        updateCurrentValue();
                      });
                    },
                    child: Icon(Icons.minimize_rounded),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      z = num.tryParse(ControllerX.text)! *
                          num.tryParse(ControllerY.text)!;
                      setState(() {
                        print(z);
                        updateCurrentValue();
                      });
                    },
                    child: Icon(Icons.close_rounded),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      z = num.tryParse(ControllerX.text)! /
                          num.tryParse(ControllerY.text)!;
                      setState(() {
                        print(z);
                        updateCurrentValue();
                      });
                    },
                    child: Icon(Icons.percent_rounded),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      keyboardType: TextInputType.number,
      keyboardAppearance: debugBrightnessOverride,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.all(15),
      ),
    );
  }
}
