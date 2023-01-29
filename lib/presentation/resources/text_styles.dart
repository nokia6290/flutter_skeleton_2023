// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

// small < 14, body 14-19, heading 20+ title 40+
// small_9_r_white -> name, fontSize, fontWeight, color, height
// to add  -> style: TextStyles.body_14_m_black.font,
// thin = w100, ultralight = w200, l light = w300, r regular = w400,
// m medium = w500, sb semi-bold = w600, b bold = w700, eb extra-bold = w800, h black = w900

class TextStyles {
  final TextStyle font;

  const TextStyles._font(this.font);

  ///small
  static const TextStyles small_10_m_black = TextStyles._font(
    TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  ///body
  static const TextStyles body_14_m_black = TextStyles._font(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static const TextStyles body_14_m_white = TextStyles._font(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  ///heading
  static const TextStyles heading_20_m_black = TextStyles._font(
    TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  ///title
  static const TextStyles title_30_m_black = TextStyles._font(
    TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );
}
