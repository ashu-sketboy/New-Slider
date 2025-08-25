import 'package:flutter/material.dart';

class CustomScrollBar extends StatefulWidget {
  const CustomScrollBar({
    super.key,
    required this.pageNo,
    required this.maxItems,
  });
  final int pageNo;
  final int maxItems;

  @override
  State<CustomScrollBar> createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {
  final double scrollWidth = 150;
  late double thumbSize;
  @override
  void initState() {
    thumbSize = scrollWidth / widget.maxItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: scrollWidth,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(left: (thumbSize) * widget.pageNo),
        child: Align(
          alignment: Alignment(-1, 0),
          child: CustomThumb(width: thumbSize),
        ),
      ),
    );
  }
}

class CustomThumb extends StatelessWidget {
  const CustomThumb({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
