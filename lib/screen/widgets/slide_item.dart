import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  const SlideItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        imageUrl,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) {
          return const Icon(Icons.image);
        },
        loadingBuilder: (context, child, chunk) {
          if (chunk == null) return child;
          return SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
