import 'dart:convert';

import 'package:cric_addict/components/inputField.dart';
import 'package:cric_addict/main.dart';
import 'package:cric_addict/pages/loginpage.dart';
import 'package:cric_addict/pages/splashScreen.dart';
import 'package:cric_addict/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = new TextEditingController();
  final phoneController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();
  final emailController = new TextEditingController();

  Future<void> registerUser(
      String name, String password, String phone, String email) async {
    try {
      Dio dio = new Dio();
      var res = await dio.post(SERVER_URL + '/api/fan/signUp', data: {
        "name": name,
        "password": password,
        "email": email,
        "phone": phone
      });
      if (res.data["success"]) {
        String jwt = res.headers["x-auth-token"]
            .toString()
            .substring(1, res.headers["x-auth-token"].toString().length - 1);
        await storage.write(key: "jwt", value: jwt);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SplashScreen(message: "Auth done")),
        );
      }
    } on DioError catch (e) {
      var resErr = jsonDecode(e.response.toString());
      String errMessage = "";
      if (!jsonDecode(e.response.toString())["success"]) {
        errMessage = jsonDecode(e.response.toString())["message"];
      } else {
        switch (resErr["errors"][0]["param"].toString()) {
          case "password":
            errMessage = resErr["errors"][0]["msg"];
            break;
          case "email":
            errMessage = resErr["errors"][0]["msg"];
            break;
        }
      }
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SplashScreen(message: "Auth failure: " + errMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: textWhite,
            size: 28,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Create Account",
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    color: textWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Please fill in your details below",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: secondaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              inputFields(
                  "Full name",
                  Icon(
                    Icons.person,
                    color: textWhite,
                  ),
                  false,
                  nameController),
              inputFields(
                  "Phone",
                  Icon(
                    Icons.phone_android,
                    color: textWhite,
                  ),
                  false,
                  phoneController),
              inputFields(
                  "Email",
                  Icon(
                    Icons.mail_outline,
                    color: textWhite,
                  ),
                  false,
                  emailController),
              inputFields(
                  "Password",
                  Icon(
                    Icons.lock,
                    color: textWhite,
                  ),
                  true,
                  passwordController),
              inputFields(
                  "Confirm Password",
                  Icon(
                    Icons.lock,
                    color: textWhite,
                  ),
                  true,
                  confirmPasswordController),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    registerUser(nameController.text, passwordController.text,
                        phoneController.text, emailController.text);
                  },
                  child: Text("Register"),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    primary: primaryBg,
                    backgroundColor: textColor,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 60, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: secondaryText),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text("Login"),
                        style: TextButton.styleFrom(
                          primary: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
