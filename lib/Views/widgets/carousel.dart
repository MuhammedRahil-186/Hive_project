import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project_hive/constant/imageconstants.dart';
import 'package:flutter/material.dart';

class Myslider extends StatelessWidget {
  const Myslider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
      ),
      items:
          [
            ImageConstants.carauselone,
            ImageConstants.carauseltwo,
            ImageConstants.carauselthree,
          ].map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
