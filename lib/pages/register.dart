import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/on_hover_elevated_button.dart';
import 'package:nalezy/widget/hover_text.dart';
import 'package:nalezy/widget/custom_text_form_field.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  late String errorMessage = '';
  late bool correctCredentials = false;

  final _formKey = GlobalKey<FormState>();
  final _emailErrorNotifier = ValueNotifier<String?>(null);

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
      return "Invalid password format!";
    }
  }

  String? confirmPasswordValidation(String? value){
    if (value == null || value.isEmpty){
      return "You have to enter your password again for confirmation";
    }

    if (passwordController.text != value){
      return "You have to enter a matching password!";
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
              SizedBox(height: 100,),
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
                                  labelText: 'Email',
                                  labelStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(fontSize: 12),
                                  errorStyle: TextStyle(fontSize: 0)
                                ),
                                errorSize: 10,
                                controller: emailController,
                                validator: emailValidation,
                              ),

                              SizedBox(height: 5,),

                              CustomTextFormField(
                                height: 40,
                                style: TextStyle(fontSize: 12),
                                obscureText: false,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(fontSize: 12),
                                  errorStyle: TextStyle(fontSize: 0)
                                ),
                                errorSize: 10,
                                controller: usernameController,
                              ),

                              SizedBox(height: 5,),

                              CustomTextFormField(
                                height: 40,
                                fontSize: 12,
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

                              SizedBox(height: 5,),

                              CustomTextFormField(
                                height: 40,
                                style: TextStyle(fontSize: 12),
                                obscureText: true,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                changeVisibility: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirm password',
                                  labelStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(fontSize: 12),
                                  errorStyle: TextStyle(fontSize: 0)
                                ),
                                errorSize: 10,
                                controller: confirmPasswordController,
                                validator: confirmPasswordValidation,
                              ),

                              SizedBox(height: 5,),
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
                              "Already have an account?",
                              style: TextStyle(color: AppTheme.gray, fontSize: 12),
                            ),
                            SizedBox(width: 5,),
                            HoverText(
                              text: 'Sign In',
                              decoration: TextDecoration.underline,
                              hoverDecoration: TextDecoration.underline,
                              hoverDecorationEnabled: true,
                              style: TextStyle(fontSize: 12),
                              onTap: () {
                                Navigator.pushNamed(context, '/sign-in');
                              },
                            ),
                          ]
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
                                  "Already have an account?",
                                  style: TextStyle(color: AppTheme.gray, fontSize: 12),
                                ),
                                SizedBox(width: 5,),
                                HoverText(
                                  text: 'Sign In',
                                  textAlign: TextAlign.left,
                                  decoration: TextDecoration.underline,
                                  hoverDecoration: TextDecoration.underline,
                                  hoverDecorationEnabled: true,
                                  style: TextStyle(fontSize: 12),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/sign-in');
                                  },
                                ),
                              ]
                            ) : 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(color: AppTheme.gray, fontSize: 12),
                                ),
                                SizedBox(height: 5,),
                                HoverText(
                                  text: 'Sign In',
                                  textAlign: TextAlign.left,
                                  decoration: TextDecoration.underline,
                                  hoverDecoration: TextDecoration.underline,
                                  hoverDecorationEnabled: true,
                                  style: TextStyle(fontSize: 12),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/sign-in');
                                  },
                                ),
                              ],
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
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3 > 200 ? 200 : MediaQuery.of(context).size.width * 0.3,
                          child: HoverElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.validate();
                              checkRegister(emailController.text, passwordController.text);
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
                              'Register',
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

  void checkRegister(String email, String password) {
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
    
    errorMessage = '';
    correctCredentials = true;
    print("Registration successful!");
  }
}