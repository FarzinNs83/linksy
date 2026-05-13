import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/gen/fonts.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Bobbers',

              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Linksy',
                    speed: Duration(milliseconds: 400),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
