import 'package:flutter/material.dart';
import 'dart:js' as js;

class ScrollToTopButton extends StatefulWidget {
  @override
  _ScrollToTopButtonState createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _addScrollListener();
  }

  void _addScrollListener() {
    js.context.callMethod('addEventListener', [
      'scroll',
      () {
        final scrollTop = js.context['document'].callMethod(
            'getElementById', ['scroll-container']).callMethod('scrollTop');
        setState(() {
          _showButton = scrollTop > 200;
        });
      }
    ]);
  }

  void _scrollToTop() {
    js.context['document'].callMethod(
        'getElementById', ['scroll-container']).callMethod('scrollTo', [0, 0]);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _showButton,
      child: FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
