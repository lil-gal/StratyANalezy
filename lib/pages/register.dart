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

  double? calculateWidthButton(){
    if (MediaQuery.of(context).size.width * 0.6 > 500){
      return 500.0;
    }
    else{
      return MediaQuery.of(context).size.width * 0.6;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: Svg(
            'assets/register.svg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "REGISTER", 
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
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
                                    height: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 30 : 40,
                                    fontSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 10 : 12,
                                    obscureText: false,
                                    autovalidateMode: AutovalidateMode.onUnfocus,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      errorStyle: TextStyle(fontSize: 0)
                                    ),
                                    errorSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 8 : 10,
                                    controller: emailController,
                                    validator: emailValidation,
                                  ),

                                  SizedBox(height: 5,),

                                  CustomTextFormField(
                                    height: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 30 : 40,
                                    fontSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 10 : 12,
                                    obscureText: false,
                                    autovalidateMode: AutovalidateMode.onUnfocus,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      errorStyle: TextStyle(fontSize: 0)
                                    ),
                                    errorSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 8 : 10,
                                    controller: usernameController,
                                  ),

                                  SizedBox(height: 5,),

                                  CustomTextFormField(
                                    height: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 30 : 40,
                                    fontSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 10 : 12,
                                    obscureText: true,
                                    autovalidateMode: AutovalidateMode.onUnfocus,
                                    changeVisibility: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      errorStyle: TextStyle(fontSize: 0)
                                    ),
                                    errorSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 8 : 10,
                                    controller: passwordController,
                                    validator: passwordValidation,
                                  ),

                                  SizedBox(height: 5,),

                                  CustomTextFormField(
                                    height: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 30 : 40,
                                    fontSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 10 : 12,
                                    obscureText: true,
                                    autovalidateMode: AutovalidateMode.onUnfocus,
                                    changeVisibility: true,
                                    decoration: InputDecoration(
                                      labelText: 'Confirm password',
                                      errorStyle: TextStyle(fontSize: 0)
                                    ),
                                    errorSize: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 8 : 10,
                                    controller: confirmPasswordController,
                                    validator: confirmPasswordValidation,
                                  ),

                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: calculateWidthButton(),
                              height: (MediaQuery.of(context).size.width < 350 && MediaQuery.of(context).size.height < 450) ? 24 : 30,
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: (MediaQuery.of(context).size.width < 350 && MediaQuery.of(context).size.height < 450) ? 10 : 20, 
                                  vertical: (MediaQuery.of(context).size.width < 350 && MediaQuery.of(context).size.height < 450) ? 0 : 5
                                ),
                                transformHover: Matrix4.identity()..scaleByVector3((Vector3(1.05, 1.05, 1.0)))..translateByVector3(Vector3(-5.0, 0.0, -5.0)),
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 350 && MediaQuery.of(context).size.height < 450) ? 14 : 16,
                                  fontWeight: FontWeight.bold, color: AppTheme.textDefault),
                                ),
                              ),
                            ),
                          ],
                        ),
                        MediaQuery.of(context).size.width > 500 ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            Row(
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(color: AppTheme.gray, fontSize: MediaQuery.of(context).size.width > 425 ? 10 : 8),
                                ),
                                SizedBox(width: 5,),
                                HoverText(
                                  text: 'Sign In',
                                  decoration: TextDecoration.underline,
                                  hoverDecoration: TextDecoration.underline,
                                  hoverDecorationEnabled: true,
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width > 425 ? 10 : 8),
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
                                      style: TextStyle(color: AppTheme.gray, fontSize: MediaQuery.of(context).size.width > 425 ? 10 : 8),
                                    ),
                                    HoverText(
                                      text: 'Sign In',
                                      textAlign: TextAlign.left,
                                      decoration: TextDecoration.underline,
                                      hoverDecoration: TextDecoration.underline,
                                      hoverDecorationEnabled: true,
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width > 425 ? 10 : 8),
                                      onTap: () {
                                        Navigator.pushNamed(context, '/sign-in');
                                      },
                                    ),
                                  ]
                                ) : 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: Expanded(
                                        child: Text(
                                          "Don't have an account yet?",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(color: AppTheme.gray, fontSize: MediaQuery.of(context).size.width > 425 ? 10 : 8),
                                        ),
                                      ),
                                    ),
                                    HoverText(
                                      text: 'Sign In',
                                      textAlign: TextAlign.left,
                                      decoration: TextDecoration.underline,
                                      hoverDecoration: TextDecoration.underline,
                                      hoverDecorationEnabled: true,
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width > 425 ? 10 : 8),
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
                      ],
                    ),
                  )
                ],
              ),
            ),
            
          ] 
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