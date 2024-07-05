import 'package:flutter/cupertino.dart';
import 'package:mainapp_assets/gen/assets.gen.dart';

class ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainAppAssets.images.yourImage.image(        height: 450.0, // Adjust height as needed
    width: double.infinity, // Make the image take full width
    fit: BoxFit.fitWidth
        // Cover the entire space
    );
  }
}