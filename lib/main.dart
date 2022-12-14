import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serener/post/authprovider.dart';
import 'package:serener/views/SplashScreen.dart';
import 'package:serener/views/homePage.dart';
import 'package:serener/views/login.dart';
import 'package:serener/views/loginSignup.dart';
import 'package:serener/views/onboardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          'LoginSignup': (context) => const LoginSignup(),
          'OnBoardingScreen': (context) => OnBoardingScreen(),
          'Login': (context) => const Login(),
          'Homepage': (context) => const Homepage(),
        },
      ),
    );
  }
}
