import 'dart:ui';

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/screens/signin/signin_screen.dart';
import 'package:digital_dragon_v1/screens/start/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: Splash());
        } else {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.start,
            routes: <String, WidgetBuilder>{
              Routes.start: (context) => const Start(),
              Routes.signIn: (context) => const SignIn()
            },
            home: const Scaffold(
              body: Start(
                key: Key("startScreen"),
              ),
            ),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: ColorsApp.kPrimaryColor,
      fontSize: 48,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w700,
    );

    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
        backgroundColor:
            lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (lightMode) ...[
              Image.asset('assets/images/splash_icon.png')
            ] else ...[
              Image.asset('assets/images/splash_icon.png')
            ],
            const Text(
              'DD\nDigital Dragon',
              style: textStyle,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
