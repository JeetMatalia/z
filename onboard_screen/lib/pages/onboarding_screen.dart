import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../otp_screens/phoneauth_screen.dart';
import '../widgets/onboarding_card.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  Widget _buildOnboardingCard({
    required String image,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0), // Adjust the margin as needed
      child: OnboardingCard(
        image: image,
        title: title,
        description: description,
        buttonText: buttonText,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _buildOnboardingCard(
                  image: "assets/images/onboarding_1.png",
                  title: 'Welcome to Zignuts Technolab!',
                  description:
                  'Don\'t hinder your product\'s growth by hiring a \'good enough\' software company. Choose Zignuts to elevate your development to the next level and ensure exceptional craftsmanship.',
                  buttonText: 'Next',
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
                _buildOnboardingCard(
                  image: "assets/images/onboarding_2.png",
                  title: 'Custom Software Development',
                  description:
                  'Zignuts Technolab is a globally leading custom software development company dedicated to delivering high-quality business-specific software solutions.',
                  buttonText: 'Next',
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
                _buildOnboardingCard(
                  image: "assets/images/onboarding_3.png",
                  title: 'Visit our application',
                  description: 'Login and See all about the company',
                  buttonText: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneAuth()),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                    dotColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
