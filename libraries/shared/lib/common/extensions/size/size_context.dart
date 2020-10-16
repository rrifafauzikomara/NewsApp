import 'package:flutter/material.dart';

extension SizeContext on BuildContext {
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get _mq => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get size => _mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get width => size.width;

  /// Returns same as MediaQuery.of(context).height
  double get height => size.height;
}
