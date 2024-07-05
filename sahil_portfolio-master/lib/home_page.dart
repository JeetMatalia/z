import 'package:app/blog_page.dart';
import 'package:app/project_page.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_page.dart';
import 'appbar_button.dart';
import 'footer_page.dart';
import 'intro_page.dart';
import 'model/Method.dart';
import 'my_colors.dart';

class HomePage extends StatefulWidget {
  final AutoScrollController _scrollController = AutoScrollController();

  Future<void> _scrollToTop() async {
    await _scrollController.scrollToIndex(0,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = new Method();

  List<String> sectionTitles = ['Home', 'About', 'Experience', 'Contact'];
  final itemKeyHome = GlobalKey();
  final itemKeyAbout = GlobalKey();
  final itemKeyPro = GlobalKey();
  final itemKeyContact = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final bool _isHovered = false;

  @override
  Future scrollToHome() async {
    final context = itemKeyHome.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
    );
  }

  Future scrollToAbout() async {
    final context = itemKeyAbout.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
    );
  }

  Future scrollToPro() async {
    final context = itemKeyPro.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
    );
  }

  Future scrollToContact() async {
    final context = itemKeyContact.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
    );
  }

  Future scrollToTop() async {
    final context = itemKeyHome.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.clr1,
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Container(
                      height: screenWidth >= 1100
                          ? MediaQuery.of(context).size.height * 0.13
                          : screenWidth > 850
                              ? MediaQuery.of(context).size.height * 0.12
                              : screenWidth > 600
                                  ? MediaQuery.of(context).size.height * 0.11
                                  : MediaQuery.of(context).size.height * 0.10,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth < 750) {
                            // Display buttons in a PopupMenuButton
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Image(
                                    width:
                                        MediaQuery.of(context).size.width < 200
                                            ? 20
                                            : 40,
                                    height:
                                        MediaQuery.of(context).size.width < 200
                                            ? 20
                                            : 40,
                                    image: AssetImage("assets/dpiconround.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Spacer(),
                                PopupMenuButton<String>(
                                  color: const Color.fromARGB(255, 19, 38, 67),
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: MyColors.clr2,
                                  ),
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 'home',
                                      child: Text('Home',
                                          style: TextStyle(
                                            color: MyColors.clrwhite,
                                            fontSize: 18,
                                          )),
                                    ),
                                    const PopupMenuItem(
                                      value: 'about',
                                      child: Text('About',
                                          style: TextStyle(
                                            color: MyColors.clrwhite,
                                            fontSize: 18,
                                          )),
                                    ),
                                    const PopupMenuItem(
                                      value: 'projects',
                                      child: Text('Projects',
                                          style: TextStyle(
                                            color: MyColors.clrwhite,
                                            fontSize: 18,
                                          )),
                                    ),
                                    const PopupMenuItem(
                                      value: 'contact',
                                      child: Text('Contact',
                                          style: TextStyle(
                                            color: MyColors.clrwhite,
                                            fontSize: 18,
                                          )),
                                    ),
                                    PopupMenuItem(
                                      value: 'Resume',
                                      child: SizedBox(
                                        height: 35,
                                        width: 100,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            // primary: MyColors.clrwhite,
                                            backgroundColor: MyColors.clr2,
                                            // onSurface: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              side: BorderSide(
                                                  color: MyColors.clr2),
                                            ),
                                          ),
                                          onPressed: () async {
                                            await goToWebPage(
                                                "https://www.linkedin.com/in/jeematalia");
                                          },
                                          child: const Text(
                                            "Resume",
                                            style: TextStyle(
                                              color: MyColors.clr1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  onSelected: (value) {
                                    switch (value) {
                                      case 'home':
                                        scrollToHome();
                                        break;
                                      case 'about':
                                        scrollToAbout();
                                        break;
                                      case 'projects':
                                        scrollToPro();
                                        break;
                                      case 'contact':
                                        scrollToContact();
                                        break;
                                    }
                                  },
                                ),
                                const SizedBox(width: 20),
                              ],
                            );
                          } else {
                            // Display buttons in the row
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Image(
                                    width: 50,
                                    height: 50,
                                    image: AssetImage("assets/dpiconround.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Spacer(),
                                HoverTextButton(
                                  onPressed: () => scrollToHome(),
                                  text: 'Home',
                                ),
                                HoverTextButton(
                                  onPressed: () => scrollToAbout(),
                                  text: 'About',
                                ),
                                HoverTextButton(
                                  onPressed: () => scrollToPro(),
                                  text: 'Projects',
                                ),
                                HoverTextButton(
                                  onPressed: () => scrollToContact(),
                                  text: 'Contact',
                                ),
                                const SizedBox(width: 40.0),
                                SizedBox(
                                  height: 45,
                                  width: 120,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: MyColors.clr2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        side: BorderSide(color: MyColors.clr2),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await goToWebPage(
                                          "https://www.linkedin.com/in/jeetmatalia");
                                    },
                                    child: const Text(
                                      "Resume",
                                      style: TextStyle(
                                        color: MyColors.clr1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 1 -
                          MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            child: Container(
                                child: Column(
                              children: [
                                Container(
                                  key: itemKeyHome,
                                  child: IntroPage(),
                                ),
                                Container(
                                  key: itemKeyAbout,
                                  child: AboutPage(),
                                ),
                                Container(
                                  key: itemKeyPro,
                                  child: ProjectPage(),
                                ),
                                Container(
                                  child: BlogPage(),
                                ),
                                // Container(
                                //   padding: EdgeInsets.fromLTRB(
                                //       50.0, 100.0, 50.0, 0.0),
                                //   child: const Text(
                                //     'Other Projects',
                                //     style: TextStyle(
                                //         color: MyColors.clr2,
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 45.0),
                                //   ),
                                // ),
                                // Container(
                                //   padding: EdgeInsets.fromLTRB(
                                //       50.0, 100.0, 50.0, 0.0),
                                //   child: Image(
                                //     width:
                                //         MediaQuery.of(context).size.width * 0.8,
                                //     image: AssetImage("assets/banner.png"),
                                //     fit: BoxFit.cover,
                                //   ),
                                // ),
                                Container(
                                  key: itemKeyContact,
                                  child: FooterPage(),
                                ),
                              ],
                            )),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 30.0, bottom: 40.0),
        child: SizedBox(
          width: screenWidth >= 1200
              ? 70
              : screenWidth >= 850
                  ? 60
                  : 50,
          height: screenWidth >= 1200
              ? 70
              : screenWidth >= 850
                  ? 60
                  : 50,
          child: FloatingActionButton(
            onPressed: () => scrollToTop(),
            hoverColor: Color.fromARGB(255, 28, 151, 196),
            backgroundColor: MyColors.clr2,
            child: Icon(Icons.arrow_upward),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
