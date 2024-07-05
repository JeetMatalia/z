import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: Image.asset(imgPath, width: 35.0),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.tealAccent, style: BorderStyle.solid, width: 2.0),
          borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black)),
                child: Image.asset("assets/Chathu_circle.png"),
              ),
            ),
            TabsMobile(text: "Home", route: "/"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Works", route: "/works"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Blog", route: "/blog"),
            SizedBox(height: 20.0),
            TabsMobile(text: "About", route: "/about"),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("assets/linkedin.png",
                    "https://www.linkedin.com/in/chathuranga97/"),
                urlLauncher(
                    "assets/twitter.png", "https://twitter.com/chathu97lj"),
                urlLauncher(
                    "assets/github.png", "https://github.com/Chathuranga97lj")
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // Intro, First Section
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/Chathu_circle.png"),
                  ),
                ),
                SizedBox(height: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SansBold("Chathuranga", 40.0),
                    SansBold("Fullstack Developer", 20.0)
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin)
                      ],
                    ),
                    SizedBox(width: 40.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans("chathuit97@gmail.com", 15.0),
                        Sans("+94 76 8711 780", 15.0),
                        Sans("Ibbagamuwa, Kurunegala", 15.0),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 90.0),
          // About me, Second Section

          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold("About Me", 35.0),
                Sans(
                    "Hello! I'm Chathuranga Lakmal I specialize in Mobile and Web Development",
                    15.0),
                Sans(
                    "I am a hardworking and ambitious individual with a great passion for Information Technology ",
                    15.0),
                Sans(
                    "I am currently working at Efito Solutions as a trainee Software Engineer",
                    15.0),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: [
                    tealContainer("Flutter"),
                    tealContainer("React"),
                    tealContainer("React-Native"),
                    tealContainer("MySQL"),
                    tealContainer("MongoDB"),
                    tealContainer("Python"),
                    tealContainer("Java"),
                    tealContainer("Node.js")
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 60.0),
          // Third Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I Do?", 35.0),
              AnimationCardWeb(
                imagePath: "assets/webL.png",
                text: "Web Development",
                width: 300.0,
                // fit: BoxFit.contain,
                // reverse: true,
              ),
              SizedBox(height: 35.0),
              AnimationCardWeb(
                imagePath: "assets/app.png",
                text: "Mobile Development",
                width: 300.0,
                // fit: BoxFit.contain,
                reverse: true,
              ),
              SizedBox(height: 35.0),
              AnimationCardWeb(
                imagePath: "assets/mongo.jpg",
                text: "Back-End Development",
                width: 300.0,
                // fit: BoxFit.contain,
                // reverse: true,
              ),
              SizedBox(height: 60.0),

              // Contact Forth section
              Wrap(
                runSpacing: 20.0,
                spacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  SansBold("Contact Me", 35.0),
                  TextForm(
                      heading: "First Name",
                      width: widthDevice / 1.4,
                      hintText: "Please type first name",
                      maxLine: 1),
                  TextForm(
                      heading: "Last Name",
                      width: widthDevice / 1.4,
                      hintText: "Please enter your last name",
                      maxLine: 1),
                  TextForm(
                      heading: "Email",
                      width: widthDevice / 1.4,
                      hintText: "Please enter your email",
                      maxLine: 1),
                  TextForm(
                      heading: "Phone Number",
                      width: widthDevice / 1.4,
                      hintText: "Please enter your phone no",
                      maxLine: 1),
                  TextForm(
                      heading: "Message",
                      width: widthDevice / 1.4,
                      hintText: "Type message",
                      maxLine: 3),
                  MaterialButton(
                    onPressed: () {},
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    minWidth: widthDevice / 2.2,
                    color: Colors.tealAccent,
                    child: SansBold("Submit", 20.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0)
            ],
          )
        ],
      ),
    );
  }
}
