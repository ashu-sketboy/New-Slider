import 'package:flutter/material.dart';
import 'package:scroll_app/screen/widgets/custom_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CustomSlider()));
  }
}
