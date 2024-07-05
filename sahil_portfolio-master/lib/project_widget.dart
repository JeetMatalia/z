import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_colors.dart';

class ProjectWidget extends StatefulWidget {
  final String imageurl, tech, desc, title, apklink, linktext;

  var projecturl;
  ProjectWidget(this.desc, this.imageurl, this.tech, this.title,
      this.projecturl, this.apklink, this.linktext);

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1000) {
      // Render as the original code for screen width >= 1000
      return Column(
        children: [
          // const SizedBox(height: 50),
          Container(
            // height: 1000,
            width: screenWidth - screenWidth * 0.1,
            height: (screenWidth / 2) / 1.2,
            // height: screenWidth >= 1300
            //     ? 750
            //     : screenWidth >= 1100
            //         ? 550
            //         : 450,
            child: Stack(
              children: [
                Positioned(
                    // right: 40.0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        await goToWebPage(widget.projecturl);
                      },
                      child: Image(
                        width: screenWidth - screenWidth * 0.5,
                        // height: screenWidth >= 1300
                        //     ? 550
                        //     : screenWidth >= 1100
                        //         ? 400
                        //         : 300,
                        image: AssetImage("assets/${widget.imageurl}"),
                        fit: BoxFit.cover,
                      ),
                    )

                    // Image(
                    //   height: screenWidth >= 1300
                    //       ? 550
                    //       : screenWidth >= 1100
                    //           ? 400
                    //           : 300,
                    //   image: AssetImage("assets/${widget.imageurl}"),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                Positioned(
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: widget.title,
                            style: const TextStyle(
                              color: MyColors.clrwhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0,
                            ),
                            recognizer: TapGestureRecognizer()
                              // ..onTap = () {
                              //   // Add the action you want to perform when the link is tapped.
                              //   // For example, you can navigate to a specific screen or open a URL.
                              // },
                              ..onTap = () async {
                                await goToWebPage(widget.projecturl);
                              },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Positioned(
                      //   top: 70,
                      //   left: 0,
                      //   child:
                      Container(
                        width: screenWidth * 0.36,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: MyColors.clr3,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.desc,
                                  style: const TextStyle(
                                    color: MyColors.clrwhite,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              if (widget.apklink != "##") ...[
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: widget.linktext,
                                        style: const TextStyle(
                                          color: MyColors.clr2,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          // ..onTap = () {
                                          //   // Add the action you want to perform when the link is tapped.
                                          //   // For example, you can navigate to a specific screen or open a URL.
                                          // },
                                          ..onTap = () async {
                                            await goToWebPage(widget.apklink);
                                          },
                                      ),
                                    ),
                                    //  )
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Positioned(
                      //   top: 100,
                      //   left: 0,
                      //   child:
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: MyColors.clr3,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            widget.tech,
                            style: const TextStyle(
                              color: MyColors.clr2,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      // Render as a card for screen width < 1000
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.clr2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.2,
            child: Card(
              color: MyColors.clr1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: InkWell(
                    onTap: () async {
                      await goToWebPage(widget.projecturl);
                    },
                    child: Image(
                      width: screenWidth - screenWidth * 0.2,
                      // height: screenWidth >= 1300
                      //     ? 550
                      //     : screenWidth >= 1100
                      //         ? 400
                      //         : 300,
                      image: AssetImage("assets/${widget.imageurl}"),
                      fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: widget.title,
                      style: const TextStyle(
                        color: MyColors.clrwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        // ..onTap = () {
                        //   // Add the action you want to perform when the link is tapped.
                        //   // For example, you can navigate to a specific screen or open a URL.
                        // },
                        ..onTap = () async {
                          await goToWebPage(widget.projecturl);
                        },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.tech,
                    style: TextStyle(
                      color: MyColors.clr2,
                      fontSize: MediaQuery.of(context).size.width >= 770
                          ? 20
                          : MediaQuery.of(context).size.width >= 530
                              ? 18
                              : 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        widget.desc,
                        style: TextStyle(
                          color: MyColors.clrwhite,
                          fontSize: MediaQuery.of(context).size.width >= 770
                              ? 20
                              : MediaQuery.of(context).size.width >= 530
                                  ? 18
                                  : 16,
                        ),
                      ),
                      if (widget.apklink != "##") ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 4.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: widget.linktext,
                                style: TextStyle(
                                  color: MyColors.clr2,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width >=
                                          770
                                      ? 20
                                      : MediaQuery.of(context).size.width >= 530
                                          ? 18
                                          : 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  // ..onTap = () {
                                  //   // Add the action you want to perform when the link is tapped.
                                  //   // For example, you can navigate to a specific screen or open a URL.
                                  // },
                                  ..onTap = () async {
                                    await goToWebPage(widget.apklink);
                                  },
                              ),
                            ),
                            //  )
                          ),
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      );
    }
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}

class ProjectWidget2 extends StatefulWidget {
  final String imageurl, tech, desc, title, projecturl, apklink, linktext;

  ProjectWidget2(this.desc, this.imageurl, this.tech, this.title,
      this.projecturl, this.apklink, this.linktext);
  @override
  _ProjectWidget2State createState() => _ProjectWidget2State();
}

class _ProjectWidget2State extends State<ProjectWidget2> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1000) {
      return Column(
        children: [
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     widget.title,
          //     style: const TextStyle(
          //       color: MyColors.clrwhite,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 45.0,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 50),
          Container(
            // height: MediaQuery.of(context).size.height * 0.8,
            // height: 1000,
            width: screenWidth - screenWidth * 0.1,
            height: (screenWidth / 2) / 1.2,
            // height: screenWidth >= 1300
            //     ? 750
            //     : screenWidth >= 1100
            //         ? 550
            //         : 450,
            child: Stack(
              children: [
                Positioned(
                    // left: 40.0,
                    left: 0,
                    child: InkWell(
                      onTap: () async {
                        await goToWebPage(widget.projecturl);
                      },
                      child: Image(
                        width: screenWidth - screenWidth * 0.5,
                        // height: screenWidth >= 1300
                        //     ? 550
                        //     : screenWidth >= 1100
                        //         ? 400
                        //         : 300,
                        image: AssetImage("assets/${widget.imageurl}"),
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                  right: 0.0,
                  // top: 40.0,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: widget.title,
                              style: const TextStyle(
                                color: MyColors.clrwhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                // ..onTap = () {
                                //   // Add the action you want to perform when the link is tapped.
                                //   // For example, you can navigate to a specific screen or open a URL.
                                // },
                                ..onTap = () async {
                                  await goToWebPage(widget.projecturl);
                                },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Positioned(
                        //   top: 70,
                        //   right: 0,
                        //   child:
                        Container(
                          width: MediaQuery.of(context).size.width * 0.36,
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5.0,
                              ),
                            ],
                            color: MyColors.clr3,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.desc,
                                      style: const TextStyle(
                                        color: MyColors.clrwhite,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  if (widget.apklink != "##") ...[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: RichText(
                                          text: TextSpan(
                                            text: widget.linktext,
                                            style: const TextStyle(
                                              color: MyColors.clr2,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              // ..onTap = () {
                                              //   // Add the action you want to perform when the link is tapped.
                                              //   // For example, you can navigate to a specific screen or open a URL.
                                              // },
                                              ..onTap = () async {
                                                await goToWebPage(
                                                    widget.apklink);
                                              },
                                          ),
                                        ),
                                        //  )
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // Positioned(
                        //   top: 100,
                        //   right: 0,
                        //   child:
                        Container(
                          // padding: EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5.0,
                              ),
                            ],
                            color: MyColors.clr3,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                widget.tech,
                                style: const TextStyle(
                                  color: MyColors.clr2,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              // boxShadow: [
              //   // BoxShadow(
              //   //   color: Colors.black54,
              //   //   blurRadius: 30.0,
              //   // ),
              // ],
              // color: MyColors.clr3,
              border: Border.all(color: MyColors.clr2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.2,
            child: Card(
              color: MyColors.clr1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: InkWell(
                    onTap: () async {
                      await goToWebPage(widget.projecturl);
                    },
                    child: Image(
                      width: screenWidth - screenWidth * 0.2,
                      // height: screenWidth >= 1300
                      //     ? 550
                      //     : screenWidth >= 1100
                      //         ? 400
                      //         : 300,
                      image: AssetImage("assets/${widget.imageurl}"),
                      fit: BoxFit.cover,
                    ),
                  )),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: widget.title,
                      style: const TextStyle(
                        color: MyColors.clrwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        // ..onTap = () {
                        //   // Add the action you want to perform when the link is tapped.
                        //   // For example, you can navigate to a specific screen or open a URL.
                        // },
                        ..onTap = () async {
                          await goToWebPage(widget.projecturl);
                        },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.tech,
                    style: TextStyle(
                      color: MyColors.clr2,
                      fontSize: MediaQuery.of(context).size.width >= 770
                          ? 20
                          : MediaQuery.of(context).size.width >= 530
                              ? 18
                              : 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        widget.desc,
                        style: TextStyle(
                          color: MyColors.clrwhite,
                          fontSize: MediaQuery.of(context).size.width >= 770
                              ? 20
                              : MediaQuery.of(context).size.width >= 530
                                  ? 18
                                  : 16,
                        ),
                      ),
                      if (widget.apklink != "##") ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 4.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: widget.linktext,
                                style: TextStyle(
                                  color: MyColors.clr2,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width >=
                                          770
                                      ? 20
                                      : MediaQuery.of(context).size.width >= 530
                                          ? 18
                                          : 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  // ..onTap = () {
                                  //   // Add the action you want to perform when the link is tapped.
                                  //   // For example, you can navigate to a specific screen or open a URL.
                                  // },
                                  ..onTap = () async {
                                    await goToWebPage(widget.apklink);
                                  },
                              ),
                            ),
                            //  )
                          ),
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
        ],
      );
    }
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
