import 'package:flutter/material.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({Key? key}) : super(key: key);

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: Image.asset(imgPath, width: 35.0),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Chathuranga", 30.0),
            SizedBox(height: 15.0),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0, // default 4.0
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: Row(
          children: [
            Spacer(
              flex: 3,
            ),
            TabsWeb(
              title: "Home",
              route: '/',
            ),
            Spacer(),
            TabsWeb(
              title: "Works",
              route: '/works',
            ),
            Spacer(),
            TabsWeb(
              title: "Blog",
              route: '/blog',
            ),
            Spacer(),
            TabsWeb(
              title: "About",
              route: '/about',
            ),
            Spacer(),
            TabsWeb(
              title: "Contact",
              route: '/contact',
            ),
            Spacer(),
          ],
        ),
      ),
      body: ListView(children: [
        // First Page
        Container(
          height: heightDevice - 56, // default app bar size = 56
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: SansBold("Hello I'm", 15.0),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SansBold("Chathuranga Lakmal", 55.0),
                  Sans("Fullstack Developer", 30.0),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("chathuit97@gmail.com", 15.0),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.call),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("+94 76 8711 780", 15.0),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(
                        width: 20,
                      ),
                      Sans("Palipana Mawatha, Wadupola, Ibbagamuwa", 15.0),
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                radius: 147.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 143.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 140.0,
                    backgroundImage: AssetImage("assets/Chathu_circle.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Second Page
        Container(
          height: heightDevice / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/web.jpg",
                height: widthDevice / 1.9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About Me", 40.0),
                  SizedBox(
                    height: 15.0,
                  ),
                  Sans(
                      "Hello! I'm Chathuranga Lakmal I specialize in Mobile and Web Development",
                      15.0),
                  Sans(
                      "I am a hardworking and ambitious individual with a great passion for Information Technology ",
                      15.0),
                  Sans(
                      "I am currently working at Efito Solutions as a trainee Software Engineer",
                      15.0),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    // Skills
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("Flutter", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("React", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("React-Native", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("MongoDB", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("MySQL", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("Python", 15.0),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("Java", 15.0),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        // Third Section
        Container(
          height: heightDevice / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SansBold("What I Do ?", 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimationCardWeb(
                    imagePath: "assets/webL.png",
                    text: "Web Development",
                    fit: BoxFit.contain,
                    reverse: true,
                  ),
                  AnimationCardWeb(
                    imagePath: "assets/app.png",
                    text: "Mobile Development",
                    fit: BoxFit.contain,
                    reverse: false,
                  ),
                  AnimationCardWeb(
                    imagePath: "assets/mongo.jpg",
                    text: "Back-End Development",
                    fit: BoxFit.contain,
                    reverse: true,
                  ),
                ],
              )
            ],
          ),
        ),
        // Forth section
        Container(
          height: heightDevice,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SansBold("Contact Me", 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                          heading: "First Name",
                          width: 350.0,
                          hintText: "Please type your first name",
                          maxLine: 1),
                      SizedBox(height: 15.0),
                      TextForm(
                          heading: "Email",
                          width: 350.0,
                          hintText: "Please enter your email address",
                          maxLine: 1)
                    ],
                  ),
                  Column(
                    children: [
                      TextForm(
                          heading: "Last Name",
                          width: 350.0,
                          hintText: "Please enter your last name",
                          maxLine: 1),
                      SizedBox(height: 15.0),
                      TextForm(
                          heading: "Phone Number",
                          width: 350.0,
                          hintText: "Please enter your phone no",
                          maxLine: 1)
                    ],
                  )
                ],
              ),
              TextForm(
                  heading: "Message",
                  width: widthDevice / 1.5,
                  hintText: "Please enter your message",
                  maxLine: 10),
              MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                  onPressed: () {})
            ],
          ),
        ),
        SizedBox(height: 20.0),
      ]),
    );
  }
}
