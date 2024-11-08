import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';

class Testimony {
  String assetPhoto;
  String name;
  String profession;
  String company;
  String message;

  Testimony({
    required this.assetPhoto,
    required this.name,
    required this.profession,
    required this.company,
    required this.message,
  });
}

List<Testimony> myTestimonies(BuildContext context) {
  return [
    Testimony(
      assetPhoto: MyAssets.michaelPhoto,
      name: 'Michaël Fournier',
      profession: 'Android Team Leader',
      company: 'Lydia Solutions',
      message: Languages.of(context).testimonyMichael,
    ),
    Testimony(
      assetPhoto: MyAssets.renePhoto,
      name: 'René Mouille',
      profession: 'Product Owner Senior',
      company: 'Airbus',
      message: Languages.of(context).testimonyRene,
    )
  ];
}
