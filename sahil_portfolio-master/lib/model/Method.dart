import 'package:url_launcher/url_launcher.dart';

class Method {
  launchURL(Uri link) async {
    // String url = link;
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
