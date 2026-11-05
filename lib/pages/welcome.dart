import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:nalezy/themes/main_theme.dart';

import 'package:nalezy/widget/on_hover_elevated_button.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: Svg(
            'assets/welcome_bg_i13_14.svg'),
            fit: BoxFit.cover,
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
              SizedBox(height: 150,),
              Container(
                width: MediaQuery.of(context).size.width * 0.6 > 300 ? 300 : MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: HoverElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-in');
                          },
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          transformHover: Matrix4.identity()..scaleByVector3((Vector3(1.05, 1.05, 1.0)))..translateByVector3(Vector3(-5.0, -5.0, -5.0)),
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textDefault),
                          ),
                        ),
                      ),
                    ],),
                    SizedBox(height: 20,),
                    Row(children: [
                      Expanded(
                        child: HoverElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          transformHover: Matrix4.identity()..scaleByVector3((Vector3(1.05, 1.05, 1.0)))..translateByVector3(Vector3(-5.0, -5.0, -5.0)),
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textDefault),
                          ),
                        ),
                      ),
                    ],)
                  ],
                ),
              )
            ],
        ),
        ),
      ),
    );
  }
}