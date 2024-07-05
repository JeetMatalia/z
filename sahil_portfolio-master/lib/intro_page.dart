import 'dart:async';
import 'package:app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/Method.dart';

// import 'google_fonts.dart';
class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<String> predefinedTexts = [
    'WELCOME TO MY PORTFOLIO!',
    'मेरे पोर्टफोलियो में आपका स्वागत है!',
    'મારા પોર્ટફોલિયોમાં આપનું સ્વાગત છે!',
    'Bienvenido a mi cartera!',
    '私のポートフォリオへようこそ!',
    '歡迎來到我的作品集!',
    'ДОБРО ПОЖАЛОВАТЬ В МОЁ ПОРТФОЛИО!',
    'BIENVENUE DANS MON PORTEFEUILLE!',
  ];
  String currentText = '';
  Timer? timer;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    // Start a new timer that changes the text every 2-3 seconds
    timer = Timer.periodic(Duration(milliseconds: 1500), (Timer timer) {
      setState(() {
        // Update the current text to the next predefined text
        currentText = predefinedTexts[currentIndex];
        // Increment the index to move to the next predefined text
        currentIndex = (currentIndex + 1) % predefinedTexts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Method method = new Method();
    String str = "Mobile Developer Who Exploring New Things In Dev World";
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        if (screenWidth < 600) {
          // Mobile layout
          return _buildMobileLayout(str);
        } else if (screenWidth < 1200) {
          // Tablet layout
          return _buildTabletLayout(str);
        } else {
          // Desktop layout
          return _buildDesktopLayout(str);
        }
      },
    );
  }

  Widget _buildMobileLayout(String str) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'Hi There! I am,',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              const SizedBox(height: 5.0),
              Text(
                style: GoogleFonts.dancingScript(
                  color: MyColors.clr2,
                  fontWeight: FontWeight.w700,
                  // fontSize: 140,
                  fontSize: MediaQuery.of(context).size.width < 300 ? 30 : 45,
                ),
                'Jeet Matalia',
                // style: TextStyle(
                //   color: MyColors.clr2,
                //   fontWeight: FontWeight.bold,
                //   // fontSize: 45.0,
                //   fontSize: MediaQuery.of(context).size.width < 300 ? 30 : 45,
                // ),
              ),
              const SizedBox(height: 5.0),
              Text(
                currentText,
                style: const TextStyle(
                    color: MyColors.clrwhite54,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 50,
                width: 150,
                // width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: MyColors.clr1,
                    //onPrimary: MyColors.clr2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(color: MyColors.clr2),
                    ),
                  ),
                  onPressed: () async {
                    await goToWebPage(
                        "https://www.linkedin.com/in/jeetmatalia");
                  },
                  child: const Text(
                    "Get In Touch",
                    style: TextStyle(
                      color: MyColors.clr2,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                str,
                style: const TextStyle(fontSize: 16.0, color: Colors.white60),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(String str) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              const Text(
                'Hi There! I am,',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                style: GoogleFonts.dancingScript(
                  color: MyColors.clr2,
                  fontWeight: FontWeight.w700,
                  fontSize: 65,
                ),
                'Jeet Matalia',
                // style: TextStyle(
                //     color: MyColors.clr2,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 65.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                currentText,
                style: const TextStyle(
                    color: MyColors.clrwhite54,
                    // fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: MyColors.clr1,
                        //onPrimary: MyColors.clr2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: BorderSide(color: MyColors.clr2),
                        ),
                      ),
                      onPressed: () async {
                        await goToWebPage(
                            "https://www.linkedin.com/in/jeetmatalia");
                      },
                      child: const Text(
                        "Get In Touch",
                        style: TextStyle(
                            color: MyColors.clr2,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28.0,
              ),
              Text(
                str,
                style: const TextStyle(fontSize: 20.0, color: Colors.white60),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(String str) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.fromLTRB(50.0, 100.0, 60.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              const Text(
                'Hi There! I am,',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0),
              ),
              const SizedBox(height: 5.0),
              Text(
                style: GoogleFonts.dancingScript(
                  color: MyColors.clr2,
                  fontWeight: FontWeight.w700,
                  fontSize: 140,
                ),
                'Jeet Matalia',

                // style: TextStyle(
                //     color: MyColors.clr2,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 95.0),
              ),
              const SizedBox(height: 5.0),
              Text(
                currentText,
                style: const TextStyle(
                    color: MyColors.clrwhite54,
                    // fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 65,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: MyColors.clr1,
                        //onPrimary: MyColors.clr2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(color: MyColors.clr2)),
                      ),
                      onPressed: () async {
                        await goToWebPage(
                            "https://www.linkedin.com/in/jeetmatalia");
                      },
                      child: const Text(
                        "Get In Touch",
                        style: TextStyle(
                            color: MyColors.clr2,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                  Text(
                    str,
                    style:
                        const TextStyle(fontSize: 20.0, color: Colors.white60),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
