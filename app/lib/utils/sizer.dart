import 'package:flutter/material.dart';

class Sizer {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double bh;
  static late double bv;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double sbh;
  static late double sbv;
  static late double fss;
  static late double fssm;
  static late double fsm;
  static late double fsml;
  static late double fsl;
  static late double fssl;
  static late double size_30;
  static late double bottomPadding;
  static late double wsh;

  Sizer._();

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    bh = screenWidth / 100;
    bv = screenHeight / 100;

    bottomPadding = _safeAreaHorizontal = _mediaQueryData.padding.bottom;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    sbh = (screenWidth - _safeAreaHorizontal) / 100;
    sbv = (screenHeight - _safeAreaVertical) / 100;
    wsh = sbh * 90;

    size_30 = sbh * 7.7;
    fss = sbh * 3.6;
    fssm = sbh * 4.0;
    fsm = sbh * 4.5;
    fsml = sbh * 5.5;
    fsl = sbh * 8.0;
    fssl = sbh * 12.0;
  }
}
