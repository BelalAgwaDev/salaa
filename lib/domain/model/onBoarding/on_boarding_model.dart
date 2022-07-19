import 'package:flutter/material.dart';

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(
      {required this.title, required this.image, required this.subTitle});
}

//on boarding data variables
class SliderViewObject {
  int numberOfSlides;
  bool first;
  bool last;
  List<SliderObject> list;
  PageController pageController;
  SliderViewObject(
      {required this.numberOfSlides,
        required this.list,
        required this.first,
        required this.last,
        required this.pageController});
}
