import 'package:flutter/material.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myText.dart';
import 'package:serener/widgets/size_config.dart';

// Precious worked on this page
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'OnBoardingScreen');
    });
  }

  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/truck.png'),
              SizedBox(
                height: getProportionateScreenHeight(11),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText(
                    data: 'Sere',
                    color: Palette.kColorGold,
                    fontWeight: FontWeight.w800,
                    fontSize: 60,
                  ),
                  myText(
                    data: 'ner',
                    color: Palette.kColorWhite,
                    fontWeight: FontWeight.w800,
                    fontSize: 60,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
