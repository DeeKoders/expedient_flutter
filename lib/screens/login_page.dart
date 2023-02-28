// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:expedient_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  const LoginPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;
  late ResponseBody responseBody;
  bool apiCalled = false;
  bool loading = false;
  bool _passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeSharedPref();
  }

  initializeSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: Image.asset('images/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onChanged: (value) => setState(() {
        apiCalled = false;
      }),
      controller: emailController,
      // initialValue: 'expedientvms@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      // initialValue: 'some password',
      obscureText: !_passwordVisible,
      controller: passwordController,
      onChanged: (value) => setState(() {
        apiCalled = false;
      }),

      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    addStringToSF() async {
      setState(() {
        loading = true;
      });
      final response = await http.post(
          Uri.parse('http://staging.expedientvms.com/api/clients/signIn'),
          body: {
            "email": emailController.text,
            "password": passwordController.text
          });
      setState(() {
        apiCalled = true;
        loading = false;
      });
      if (response.statusCode == 200) {
        responseBody = ResponseBody.fromJson(jsonDecode(response.body));

        await prefs.setString('token', responseBody.idToken);
        await prefs.setInt('user_id', responseBody.id);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        return responseBody.success;
      }
    }

    final loginButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.greenAccent,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(90, 50), //////// HERE
      ),
      onPressed: () async {
        addStringToSF();
      },
      child: const Text('Login'),
    );
    // final loginButton = Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 16.0),
    //   child: ElevatedButton(
    //     onPressed: () {
    //       // Navigator.of(context).pushNamed(HomePage.tag);
    //     },
    //     child: const Text('Log In', style: TextStyle(color: Colors.white)),
    //   ),
    // );
    const welcomeLabel = Align(
      alignment: Alignment.center,
      child: Text("Welcome to Expedient VMS",
          style: TextStyle(
              color: Color(0xff4f4f4f),
              fontWeight: FontWeight.bold,
              fontSize: 22)),
    );
    final forgotLabel = Align(
        alignment: Alignment.center,
        child: InkWell(onTap: () {}, child: const Text("Forgot Password?")));

    return Scaffold(
      backgroundColor: Colors.white,
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  logo,
                  const SizedBox(height: 48.0),
                  welcomeLabel,
                  const SizedBox(height: 48.0),
                  email,
                  const SizedBox(height: 8.0),
                  password,
                  const SizedBox(height: 34.0),
                  loginButton,
                  const SizedBox(height: 5.0),
                  apiCalled
                      ? const Center(
                          child: Text(
                          "*Incorrect Credentials",
                          style: TextStyle(color: Colors.red),
                        ))
                      : const Text(""),
                  const SizedBox(height: 12.0),
                  forgotLabel,
                ],
              ),
            ),
    );
  }
}

class ResponseBody {
  ResponseBody({required this.success, required this.message, this.idToken});
  bool? success;
  String? message;
  dynamic idToken;
  dynamic id;
  ResponseBody.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    idToken = json['id_token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['id_token'] = idToken;
    data['id'] = id;
    return data;
  }
}
