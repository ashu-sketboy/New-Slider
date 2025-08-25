import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scroll_app/screen/widgets/slide_item.dart';
import 'package:scroll_app/utils/constants/image_constants.dart';

import 'custom_scroll_bar.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselSliderController controller = CarouselSliderController();
  int maxPages = 10;
  ValueNotifier<int> pageNo = ValueNotifier(0);
  bool autoPlay = true;
  late Timer _debounce;

  @override
  void initState() {
    _debounce = Timer(const Duration(seconds: 2), moveNextPage);

    super.initState();
  }

  _resetTimer() {
    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(const Duration(seconds: 2), moveNextPage);
  }

  void moveNextPage() {
    if (!autoPlay) {
      _debounce.cancel();
      return;
    }

    controller.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: 200,
            initialPage: 0,
            viewportFraction: 0.9,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: false,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (page, reason) {
              if (autoPlay) _resetTimer();

              pageNo.value = page;
              if (page == maxPages - 1) {
                _debounce.cancel();
                autoPlay = false;
              }
            },
          ),
          itemCount: maxPages,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  SlideItem(imageUrl: ImageConstants.images[itemIndex]),
        ),
        ValueListenableBuilder(
          valueListenable: pageNo,
          builder: (BuildContext context, int value, Widget? child) {
            return CustomScrollBar(pageNo: value, maxItems: maxPages);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }
}
