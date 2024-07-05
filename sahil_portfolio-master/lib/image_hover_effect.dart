import 'package:flutter/material.dart';

class ImageHoverEffect extends StatefulWidget {
  final String image1;
  final String image2;

  ImageHoverEffect({super.key, required this.image1, required this.image2});

  @override
  _ImageHoverEffectState createState() => _ImageHoverEffectState();
}

class _ImageHoverEffectState extends State<ImageHoverEffect> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      onHover: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        width: screenWidth >= 600
            ? 90
            : screenWidth >= 460
                ? 70
                : 60,
        height: screenWidth >= 600
            ? 90
            : screenWidth >= 460
                ? 70
                : 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: isHovered
                ? AssetImage(widget.image2)
                : AssetImage(widget.image1),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
