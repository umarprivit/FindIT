import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  const ConditionalWidget(
      {super.key, required bool condition, required Widget widget})
      : _condition = condition,
        _widget = widget;
  final bool _condition;
  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    return _condition
        ? _widget
        : const SizedBox(
            width: 0,
            height: 0,
          );
  }
}
