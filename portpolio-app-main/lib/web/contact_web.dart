import 'package:flutter/material.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({Key? key}) : super(key: key);

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
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
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/Chathu_circle.png"),
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
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 800.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 25.0,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: "Home", route: '/'),
                  Spacer(),
                  TabsWeb(title: "Works", route: "/works"),
                  Spacer(),
                  TabsWeb(title: "Blog", route: "/blog"),
                  Spacer(),
                  TabsWeb(title: "About", route: "/about"),
                  Spacer(),
                  TabsWeb(title: "Contact", route: "/contact"),
                  Spacer()
                ],
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              SansBold("Contact Me", 40.0),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                          heading: "First Name",
                          width: 350.0,
                          hintText: "Please enter first name",
                          maxLine: 1),
                      SizedBox(height: 15.0),
                      TextForm(
                          heading: "Email",
                          width: 350.0,
                          hintText: "Please enter email address",
                          maxLine: 1),
                      SizedBox(
                        height: 15.0,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextForm(
                          heading: "Last Name",
                          width: 350.0,
                          hintText: "Please enter last name",
                          maxLine: 1),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextForm(
                          heading: "Telephone Number",
                          width: 350.0,
                          hintText: "Please enter telephone no",
                          maxLine: 1),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              TextForm(
                  heading: "Message",
                  width: widthDevice / 1.5,
                  hintText: "Enter your message",
                  maxLine: 5),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () {},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: 60.0,
                minWidth: 200.0,
                color: Colors.tealAccent,
                child: SansBold("Submit", 20.0),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
