import 'package:app/blog_widget.dart';
import 'package:app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // padding: const EdgeInsets.fromLTRB(50.0, 50.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blogs',
                style: TextStyle(
                    color: MyColors.clr2,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (screenWidth > 750)
                const SizedBox(height: 40.0)
              else
                const SizedBox(height: 25),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlogGrid(
                        "DSA visulization",
                        "https://link.springer.com/book/10.1007/978-981-97-1313-4",
                        "Research Paper",
                      ),
                      if (screenWidth > 600)
                        const SizedBox(width: 40.0)
                      else
                        const SizedBox(width: 20),
                      BlogGrid(
                        "DSA visulization",
                        "https://link.springer.com/book/10.1007/978-981-97-1313-4",
                        "Research Paper",
                      ),
                      if (screenWidth > 600)
                        const SizedBox(width: 40.0)
                      else
                        const SizedBox(width: 20),
                      BlogGrid(
                        "DSA visulization",
                        "https://link.springer.com/book/10.1007/978-981-97-1313-4",
                        "Research Paper",
                      ),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            width: 175,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.clr3,
                // primary: MyColors.clr1,
                // onPrimary: MyColors.clr2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              // color: MyColors.clr1,
              onPressed: () async {
                await goToWebPage(
                    "https://dev.to/");
              },
              child: const Text(
                "Read More",
                style: TextStyle(
                    color: MyColors.clr2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
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
