import 'package:digital_dragon_v1/ui/screens/create-campaign/create-campaign.screen.dart';
import 'package:digital_dragon_v1/ui/screens/create-character/create-character.screen.dart';
import 'package:digital_dragon_v1/ui/screens/home/home.screen.dart';
import 'package:digital_dragon_v1/ui/screens/sign-up/sign-up.screen.dart';
import 'package:digital_dragon_v1/ui/screens/signin/signin.screen.dart';
import 'package:digital_dragon_v1/ui/screens/start/start.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';

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
              fontFamily: 'Ubuntu',
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.start,
            routes: <String, WidgetBuilder>{
              Routes.start: (context) => const Start(),
              Routes.signIn: (context) => const SignIn(),
              Routes.signUp: (context) => const SignUp(),
              Routes.home: (context) => const Home(),
              Routes.createCampaign: (context) => const CreateCampaign(),
              Routes.createCharacter: (context) => const CreateCharacter(),
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
