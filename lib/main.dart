import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap_makinesi/constant/app_constans.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<double> allNumbers = [];
  double result = 0;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Calculator',
            ),
          ),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextFormFieldNumberOne("one"),
                _buildTextFormFieldNumberOne("two"),
                _buildTextFormFieldNumberOne("three"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton("Addition", "+"),
                    _buildButton("Subtraction", "-"),
                    _buildButton("Division", "/"),
                    _buildButton("Multiplication", "*"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Result: ${result.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String operation, String operationMark) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          bool _validate = _formKey.currentState!.validate();
          if (_validate) {
            _formKey.currentState!.save();
          }
          setState(() {});
          switch (operation) {
            case "Addition":
              allNumbers.forEach((element) {
                result += element;
              });
              break;
            case "Subtraction":
              for (int i = 0; i < allNumbers.length; i++) {
                if (i == 0) {
                  result += allNumbers[0];
                } else {
                  result -= allNumbers[i];
                }
              }
              break;
            case "Division":
              for (int i = 0; i < allNumbers.length; i++) {
                if (i == 0) {
                  result += allNumbers[0];
                } else {
                  result /= allNumbers[i];
                }
              }
              break;
            case "Multiplication":
              for (int i = 0; i < allNumbers.length; i++) {
                result *= allNumbers[i];
              }
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "$operationMark",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          elevation: 8,
          shadowColor: Colors.black,
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildTextFormFieldNumberOne(String numberOrder) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        onSaved: (deger) {
          allNumbers.add(double.parse(deger!));
        },
        validator: (s) {
          if (s!.length <= 0) {
            return "Sayıyı Giriniz";
          } else
            return null;
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Enter number $numberOrder",
          hintStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Sabitler.textInputFillColor,
        ),
      ),
    );
  }
}
