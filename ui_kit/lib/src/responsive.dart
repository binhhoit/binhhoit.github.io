import 'package:flutter/material.dart';

/// From this width up: two-column layout (info sidebar on the left, content on the right).
const double kWideBreakpoint = 900;

/// Max content width on large screens.
const double kContentMaxWidth = 1080;

/// Horizontal gutter on phones.
const double kGutter = 16;

bool isWide(BuildContext context) => MediaQuery.sizeOf(context).width >= kWideBreakpoint;

/// Centers content in a column at most [maxWidth] wide, with a [kGutter] side padding.
class ResponsiveCenter extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry padding;

  const ResponsiveCenter({
    super.key,
    required this.child,
    this.maxWidth = kContentMaxWidth,
    this.padding = const EdgeInsets.symmetric(horizontal: kGutter),
  });

  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(padding: padding, child: child),
        ),
      );
}
