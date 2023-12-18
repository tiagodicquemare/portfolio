import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle textXSRegular(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 12, FontWeight.w400, underline);
  }

  static TextStyle textSRegular(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 14, FontWeight.w400, underline);
  }

  static TextStyle textMRegular(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 16, FontWeight.w400, underline);
  }

  static TextStyle textLRegular(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 18, FontWeight.w400, underline);
  }

  static TextStyle textXLRegular(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 20, FontWeight.w400, underline);
  }

  static TextStyle textXXLRegular(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 22, FontWeight.w400, underline);
  }

  static TextStyle textXSSemiBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 12, FontWeight.w600, underline);
  }

  static TextStyle textSSemiBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 14, FontWeight.w600, underline);
  }

  static TextStyle textMSemiBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 16, FontWeight.w600, underline);
  }

  static TextStyle textLSemiBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 18, FontWeight.w600, underline);
  }

  static TextStyle textXLSemiBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 20, FontWeight.w600, underline);
  }

  static TextStyle textXXLSemiBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 22, FontWeight.w600, underline);
  }

  static TextStyle textXSBold({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 12, FontWeight.w700, underline);
  }

  static TextStyle textSBold({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 14, FontWeight.w700, underline);
  }

  static TextStyle textMBold({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 16, FontWeight.w700, underline);
  }

  static TextStyle textLBold({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 18, FontWeight.w700, underline);
  }

  static TextStyle textXLBold({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 20, FontWeight.w700, underline);
  }

  static TextStyle textXXLBold({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 22, FontWeight.w700, underline);
  }

  static TextStyle textXXXLBold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 24, FontWeight.w700, underline);
  }

  static TextStyle textTitle26({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 26, FontWeight.w400, underline);
  }

  static TextStyle textTitle26Bold(
      {required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 26, FontWeight.w900, underline);
  }

  static TextStyle textTitle32({required Color color, bool underline = false}) {
    return _textStyle('ProximaNova', color, 32, FontWeight.w700, underline);
  }

  static TextStyle _textStyle(String fontFamily, Color color, double size,
      FontWeight weight, bool underline) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        height: 1.6,
        fontSize: size,
        decoration: underline ? TextDecoration.underline : null,
        fontWeight: weight);
  }
}
