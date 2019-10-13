import 'dart:convert';
import 'dart:ui';

import 'package:amap_base/amap_base.dart';
import 'package:flutter/widgets.dart';

class RectangleOptions{
  static const FILL_COLOR = Color(0x606699ff);
  static const STROKE_COLOR = Color(0x906699ff);

  final List<LatLng> latLngs;

  final double strokeWidth;

  final Color fillColor;

  final Color strokeColor;

  final bool visible;

  RectangleOptions({@required this.latLngs, this.strokeWidth = 1, this.fillColor = FILL_COLOR,
    this.strokeColor = STROKE_COLOR,this.visible = true});

  Map<String, Object> toJson() {
    return {
      'latLngs': latLngs,
      'fillColor': fillColor.value.toRadixString(16),
      'strokeColor': strokeColor.value.toRadixString(16),
      'strokeWidth': strokeWidth,
      'visible': visible,
    };
  }

  String toJsonString() => jsonEncode(toJson());

  @override
  String toString() {
    return 'RectangleOptions{latLgs: $latLngs, strokeWidth: $strokeWidth, fillColor: $fillColor, strokeColor: $strokeColor}';
  }


}