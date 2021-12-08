import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap_makinesi/constant/app_constans.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var numberOne = 0;

  var numberTwo = 0;

  var result = 0;
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTextFormFieldNumberOne(),
                _buildTextFormFieldNumberTwo(),
                _buildButton(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Result: ${result.toString()}",
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

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          bool _validate = _formKey.currentState!.validate();
          if (_validate) {
            _formKey.currentState!.save();
          }

          result = numberOne + numberTwo;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Result",
            style: TextStyle(color: Colors.white, fontSize: 25),
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

  Widget _buildTextFormFieldNumberOne() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: (deger) {
          numberTwo = int.parse(deger!);
        },
        validator: (s) {
          if (s!.length <= 0) {
            return "Sayıyı Giriniz";
          } else
            return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Enter number two",
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

  Widget _buildTextFormFieldNumberTwo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: (deger) {
          setState(() {
            numberOne = int.parse(deger!);
          });
        },
        validator: (s) {
          if (s!.length <= 0) {
            return "Sayıyı Giriniz";
          } else
            return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Enter number two",
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
