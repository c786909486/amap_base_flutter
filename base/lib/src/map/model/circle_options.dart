import 'dart:convert';
import 'package:amap_base/amap_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CirclePolyOptions {
  static const CIRCLE_FILL_COLOR = Color(0x606699ff);
  static const CIRCLE_STROKE_COLOR = Colors.transparent;

  final LatLng center;

  final double radius;

  final Color fillColor;

  final Color strokeColor;

  final double strokeWidth;

  final bool visible;

  CirclePolyOptions({@required this.center,
    @required this.radius,
    this.fillColor = CIRCLE_FILL_COLOR,
    this.strokeColor = CIRCLE_STROKE_COLOR,
    this.strokeWidth = 0,
    this.visible = true});

  Map<String, Object> toJson() {
    return {
      'center': center,
      'radius': radius,
      'fillColor': fillColor.value.toRadixString(16),
      'strokeColor': strokeColor.value.toRadixString(16),
      'strokeWidth': strokeWidth,
      'visible': visible,
    };
  }

  String toJsonString() => jsonEncode(toJson());
  
  @override
  String toString() {
    return 'CircleOptions{center: $center, radius: $radius, fillColor: $fillColor, strokeColor: $strokeColor, strokeWidth: $strokeWidth, visible: $visible}';
  }


}
