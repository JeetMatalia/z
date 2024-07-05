import 'package:flutter/material.dart';
import 'package:silverappbar/widgets/silver_box_widget.dart';


import 'widgets/appbar_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],
      body: CustomScrollView(
        slivers: [
          // sliver app bar
          SilverAppBarWidget(),

          // sliver items 1
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),
          ContainerWidget(),

        ],
      ),
    );
  }
}
