import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget padHor(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Widget padVer(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget padAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget padSym({double hor = 0, double ver = 0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
        child: this,
      );

  Widget padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  // Margins
  Widget marHor(double margin) => Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: this,
      );

  Widget marVer(double margin) => Container(
        margin: EdgeInsets.symmetric(vertical: margin),
        child: this,
      );

  Widget marAll(double margin) => Container(
        margin: EdgeInsets.all(margin),
        child: this,
      );

  Widget marSym({double hor = 0, double ver = 0}) => Container(
        margin: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
        child: this,
      );

  Widget center() => Center(child: this);

  Widget decorated({
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape,
        ),
        child: this,
      );
}
