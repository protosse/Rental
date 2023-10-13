import 'package:flutter/material.dart';

typedef Wrapper = Widget Function(Widget child);

class ConditionalWrap extends StatelessWidget {
  /// Creates a widget that conditionally wraps its [child].
  const ConditionalWrap({
    Key? key,
    required this.condition,
    required this.wrapper,
    this.fallback,
    required this.child,
  }) : super(key: key);

  /// Decides on which [Wrapper] to use.
  final bool condition;

  /// Wrapper to use when [condition] is true.
  final Wrapper wrapper;

  /// Wrapper to use when [condition] is false.
  ///
  /// If not specified, [child] is returned.
  final Wrapper? fallback;

  /// Widget to be conditionally wrapped.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return wrapper(child);
    } else if (fallback != null) {
      return fallback!(child);
    } else {
      return child;
    }
  }
}
