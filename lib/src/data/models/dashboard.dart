import 'package:flutter/cupertino.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:tuple/tuple.dart';

class Dashboard {
  final String title;
  final String subtitle;
  final String folder;
  final String outlineIcon;
  final PuzzleType puzzleType;
  final double opacity;
  final Tuple2<Color, Color> colorTuple;
  Color fillIconColor;
  Color outlineIconColor;
  Color bgColor;
  Color gridColor;
  Color backgroundColor;
  Color primaryColor;
  int position;

  Dashboard({
    required this.puzzleType,
    required this.colorTuple,
    required this.opacity,
    required this.outlineIcon,
    required this.subtitle,
    required this.bgColor,
    required this.gridColor,
    required this.position,
    required this.title,
    required this.folder,
    required this.fillIconColor,
    required this.primaryColor,
    required this.outlineIconColor,
    required this.backgroundColor,
  });

  Dashboard copyWith({
    String? title,
    String? subtitle,
    String? folder,
    String? outlineIcon,
    PuzzleType? puzzleType,
    double? opacity,
    Tuple2<Color, Color>? colorTuple,
    Color? fillIconColor,
    Color? outlineIconColor,
    Color? bgColor,
    Color? gridColor,
    Color? backgroundColor,
    Color? primaryColor,
    int? position,
  }) {
    return Dashboard(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      folder: folder ?? this.folder,
      outlineIcon: outlineIcon ?? this.outlineIcon,
      puzzleType: puzzleType ?? this.puzzleType,
      opacity: opacity ?? this.opacity,
      colorTuple: colorTuple ?? this.colorTuple,
      fillIconColor: fillIconColor ?? this.fillIconColor,
      outlineIconColor: outlineIconColor ?? this.outlineIconColor,
      bgColor: bgColor ?? this.bgColor,
      gridColor: gridColor ?? this.gridColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      position: position ?? this.position,
    );
  }
}
