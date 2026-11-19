import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/on_hover_elevated_button.dart';
import 'package:nalezy/widget/hover_text.dart';
import 'package:nalezy/widget/custom_text_form_field.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController emailOrUsernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late String errorMessage = '';
  late bool correctCredentials = false;

  final _formKey = GlobalKey<FormState>();
  final _emailErrorNotifier = ValueNotifier<String?>(null);

  @override
  void dispose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    _emailErrorNotifier.dispose();
    super.dispose();
  }

  String? emailValidation(String? value){
    if (value == null || value.isEmpty){
      return "You have to enter an email!";
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Invalid email format!';
    }
  }

  String? passwordValidation(String? value){
    if (value == null || value.isEmpty){
      return "You have to enter a password!";
    }

    if (value.length < 8 || !value.contains(RegExp(r"[A-Z]"))){
      return "Wrong password!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: Svg(
            'assets/welcome_bg_i13_14.svg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 150,),
              Image(
                image: AssetImage("assets/default_pfp.png"),
                height: 120,
                width: 120,
              ),
              SizedBox(height: 120,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6 > 500 ? 500 : MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                height: 40,
                                style: TextStyle(fontSize: 12),
                                obscureText: false,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                decoration: InputDecoration(
                                  labelText: 'Email/Username',
                                  labelStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(fontSize: 12),
                                  errorStyle: TextStyle(fontSize: 0)
                                ),
                                errorSize: 10,
                                controller: emailOrUsernameController,
                                validator: emailValidation,
                              ),
                              SizedBox(height: 20,),
                              CustomTextFormField(
                                height: 40,
                                style: TextStyle(fontSize: 12),
                                obscureText: true,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                changeVisibility: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(fontSize: 12),
                                  errorStyle: TextStyle(fontSize: 0)
                                ),
                                errorSize: 10,
                                controller: passwordController,
                                validator: passwordValidation,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],),
                    MediaQuery.of(context).size.width > 500 ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                        Row(
                            children: [
                              Text(
                                "Don't have an account yet?",
                                style: TextStyle(color: AppTheme.gray, fontSize: 12),
                              ),
                              SizedBox(width: 5,),
                              HoverText(
                                text: 'Register',
                                decoration: TextDecoration.underline,
                                hoverDecoration: TextDecoration.underline,
                                hoverDecorationEnabled: true,
                                style: TextStyle(fontSize: 12),
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              ),
                            ]
                          ),
                        HoverText(
                            text: 'Forgot Password?',
                            textAlign: TextAlign.right,
                            decoration: TextDecoration.underline,
                            hoverDecoration: TextDecoration.underline,
                            hoverDecorationEnabled: true,
                            style: TextStyle(fontSize: 12),
                            onTap: () {
                              Navigator.pushNamed(context, '/forgot-password');
                            },
                          ),
                      ],
                    ) :   
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediaQuery.of(context).size.width > 350 ?
                            Row(
                              children: [
                                Text(
                                  "Don't have an account yet?",
                                  style: TextStyle(color: AppTheme.gray, fontSize: 12),
                                ),
                                SizedBox(width: 5,),
                                HoverText(
                                  text: 'Register',
                                  textAlign: TextAlign.left,
                                  decoration: TextDecoration.underline,
                                  hoverDecoration: TextDecoration.underline,
                                  hoverDecorationEnabled: true,
                                  style: TextStyle(fontSize: 12),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                ),
                              ]
                            ) : 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Don't have an account yet?",
                                  style: TextStyle(color: AppTheme.gray, fontSize: 12),
                                ),
                                SizedBox(height: 5,),
                                HoverText(
                                  text: 'Register',
                                  textAlign: TextAlign.left,
                                  decoration: TextDecoration.underline,
                                  hoverDecoration: TextDecoration.underline,
                                  hoverDecorationEnabled: true,
                                  style: TextStyle(fontSize: 12),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            HoverText(
                                text: 'Forgot Password?',
                                textAlign: TextAlign.left,
                                decoration: TextDecoration.underline,
                                hoverDecoration: TextDecoration.underline,
                                hoverDecorationEnabled: true,
                                style: TextStyle(fontSize: 12),
                                onTap: () {
                                  Navigator.pushNamed(context, '/forgot-password');
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6 > 500 ? 500 : MediaQuery.of(context).size.width * 0.6,
                          alignment: Alignment.center,
                          child: Text(
                            errorMessage,
                            style: TextStyle(color: AppTheme.error, fontSize: 0),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3 > 200 ? 200 : MediaQuery.of(context).size.width * 0.3,
                          child: HoverElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.validate();
                              checkLogin(emailOrUsernameController.text, passwordController.text);
                              if (correctCredentials) {
                                // Navigate to the home page or another page after successful login
                                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                              } else {
                                setState(() {}); // Update the UI to show the error message
                              }
                            },
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            transformHover: Matrix4.identity()..scaleByVector3((Vector3(1.05, 1.05, 1.0)))..translateByVector3(Vector3(-5.0, 0.0, -5.0)),
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textDefault),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
        ),
        ),
      ),
    );
  }

  void checkLogin(String email, String password) {
    correctCredentials = false;
    errorMessage = '';
    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'Email and password cannot be empty!';
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      errorMessage = 'Invalid email format!';
      return;
    }
    // Implement your login logic here
    // For example, you can check the email and password against a database or an API
    if (email == 'user@example.com' && password == 'password') {
      errorMessage = '';
      correctCredentials = true;
      print('Login successful');
    } else {
      errorMessage = 'Invalid email or password!';
      print('Invalid email or password');
    }
  }
}