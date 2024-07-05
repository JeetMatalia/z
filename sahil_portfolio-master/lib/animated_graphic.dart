import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimatedGraphic extends StatefulWidget {
  @override
  _AnimatedGraphicState createState() => _AnimatedGraphicState();
}

class _AnimatedGraphicState extends State<AnimatedGraphic>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the duration as desired
    );

    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 200),
          from: Duration(seconds: 0),
          to: Duration(seconds: 2),
          tag: 'width',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 200),
          from: Duration(seconds: 2),
          to: Duration(seconds: 4),
          tag: 'height',
        )
        .animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          width: _sequenceAnimation['width'].value,
          height: _sequenceAnimation['height'].value,
          color: Colors.blue, // Customize the color as desired
        );
      },
    );
  }
}
