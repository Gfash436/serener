import 'package:flutter/material.dart';
import 'package:serener/widgets/myColor.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 43,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'LoginSignup');
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardingContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 34, bottom: 78),
                  child: Text(
                    selectedIndex == 0
                        ? '1/3'
                        : selectedIndex == 1
                            ? '2/3'
                            : '3/3 ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 34.0, bottom: 40),
                  child: SizedBox(
                    height: 94,
                    width: 94,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);

                        if (selectedIndex == 2) {
                          Navigator.pushReplacementNamed(
                              context, 'LoginSignup');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Palette.kBackgroundColor,
                          shape: const CircleBorder()),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Palette.kColorWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: "assets/images/eur.png",
      title: "Take hold of \n your finances",
      description: "Running your finances is easier with xyz"),
  OnBoard(
      image: "assets/images/eur.png",
      title: "See where your  \n money is going",
      description:
          "Stay on top by efforteasily tracking your\n your subscription & bills"),
  OnBoard(
      image: "assets/images/eur.png",
      title: "Reach your \n goals with ease",
      description:
          "Use the smart saving features to\nmanage your future goals and needs"),
];

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          image,
          // height:279,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 44, color: Color(0xff151940)),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
