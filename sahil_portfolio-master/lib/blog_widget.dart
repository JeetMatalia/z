import 'package:app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogGrid extends StatefulWidget {
  final String title, urltopage, desc;

  BlogGrid(this.title, this.urltopage, this.desc);
  @override
  State<BlogGrid> createState() => _BlogGridState();
}

class _BlogGridState extends State<BlogGrid> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: InkWell(
        onTap: () async {
          await goToWebPage(widget.urltopage);
        },
        child: Container(
          height: screenWidth > 850
              ? 200
              : screenWidth > 700
                  ? 170
                  : screenWidth > 570
                      ? 150
                      : 80,
          width: screenWidth > 850
              ? 200
              : screenWidth > 700
                  ? 170
                  : screenWidth > 570
                      ? 150
                      : 80,
          decoration: const BoxDecoration(
            color: MyColors.clr3,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              BoxShadow(
                color: MyColors.clr2,
                offset: Offset(-6, 6),
                blurRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: screenWidth > 600
                    ? const EdgeInsets.all(18.0)
                    : const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.ebGaramond(
                          fontSize: screenWidth > 850
                              ? 33
                              : screenWidth > 700
                                  ? 25
                                  : screenWidth > 570
                                      ? 20
                                      : 14,
                          color: MyColors.clrwhite,
                          height: 1.05),
                    ),
                    if (screenWidth > 700)
                      const SizedBox(
                        height: 5,
                      )
                    else
                      const SizedBox(
                        height: 1,
                      ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.desc,
                        style: TextStyle(
                          fontSize: screenWidth > 850
                              ? 17
                              : screenWidth > 700
                                  ? 15
                                  : screenWidth > 570
                                      ? 13
                                      : 8,
                          color: MyColors.clr2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
