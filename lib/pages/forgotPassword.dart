import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/on_hover_elevated_button.dart';
import 'package:nalezy/widget/custom_text_form_field.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {

  final TextEditingController emailController = TextEditingController();

  late String errorMessage = '';
  late bool correctCredentials = false;

  final _formKey = GlobalKey<FormState>();
  final _emailErrorNotifier = ValueNotifier<String?>(null);

  @override
  void dispose() {
    emailController.dispose();
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
            'assets/welcome_bg_i13_14.svg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: (MediaQuery.of(context).size.height - 80) *0.27),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6 > 500 ? 500 : MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "EMAIL VERIFICATION",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width > 525 ? 24 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Enter an email for the account you forgot your password on and we will send you a code",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width > 525 ? 16 : 10,
                            color: AppTheme.gray,
                          ),
                        ),
                        SizedBox(height: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 10 : 20,),
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
                                ],
                              ),
                            ),
                          ),
                        ],),
                        SizedBox(height: (MediaQuery.of(context).size.width < 350 || MediaQuery.of(context).size.height < 450) ? 5 : 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: calculateWidthButton(),
                              height: 30,
                              child: HoverElevatedButton(
                                onPressed: () {
                                  _formKey.currentState!.validate();
                                  if (correctCredentials) {
                                    // Navigate to the home page or another page after successful login
                                    //Navigator.pushNamedAndRemoveUntil(context, '/verification-code-input', (route) => false);
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
                                  'Send code',
                                  style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 350 && MediaQuery.of(context).size.height < 450) ? 14 : 16, 
                                  fontWeight: FontWeight.bold, color: AppTheme.textDefault),
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
            )
          ],
        )
        
      ),
    );
  }
}