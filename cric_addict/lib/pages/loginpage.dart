import 'dart:convert';

import 'package:cric_addict/components/inputField.dart';
import 'package:cric_addict/main.dart';
import 'package:cric_addict/pages/splashScreen.dart';
import 'package:cric_addict/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'registerpage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final passwordController = new TextEditingController();
  final emailController = new TextEditingController();

  Future<void> loginUser(String email, String password) async {
    try {
      Dio dio = new Dio();
      var res = await dio.post(SERVER_URL + '/api/fan/signIn',
          data: {"email": email, "password": password});
      if (res.statusCode == 200) {
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
      print(resErr);
      switch (resErr["errors"][0]["message"]) {
        case "Invalid Password":
          errMessage = "Invalid Password";
          break;
        case "Invalid Credentials":
          errMessage = "Invalid Email ID";
          break;
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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: 50),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 150,
                margin: EdgeInsets.only(bottom: 50),
                child: SvgPicture.asset('assets/logo1.svg'),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Login",
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
                  "Please sign in to continue",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: secondaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    loginUser(emailController.text, passwordController.text);
                  },
                  child: Text("LOGIN"),
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
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                  style: TextButton.styleFrom(
                    primary: textColor,
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
                      "Don't have an account?",
                      style: TextStyle(color: secondaryText),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text("Sign Up"),
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
