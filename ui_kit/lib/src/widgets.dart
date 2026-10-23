import 'package:flutter/material.dart';
import 'package:ui_kit/src/colors.dart';
import 'package:ui_kit/src/text_style.dart';

/// Shared button height.
const double kButtonHeight = 44;

/// White rounded card with a thin border.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppCard({super.key, required this.child, this.padding = const EdgeInsets.all(20)});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: UIColor.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: UIColor.line.withValues(alpha: 0.6)),
        ),
        child: child,
      );
}

/// A titled section inside an [AppCard].
class AppSection extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget child;

  const AppSection({super.key, required this.title, required this.child, this.icon});

  @override
  Widget build(BuildContext context) => AppCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            if (icon != null) ...[Icon(icon, size: 20, color: UIColor.primary), const SizedBox(width: 8)],
            Expanded(child: Text(title, style: AppTextStyle.h2)),
          ]),
          const SizedBox(height: 16),
          child,
        ]),
      );
}

/// Small pill label (skill, technology).
class AppChip extends StatelessWidget {
  final String label;
  final bool highlighted;

  const AppChip(this.label, {super.key, this.highlighted = false});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: highlighted ? UIColor.primaryLight : UIColor.chip,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(label, style: AppTextStyle.chip.copyWith(color: highlighted ? UIColor.primary : null)),
      );
}

/// Wrapping list of [AppChip]s.
class AppChipWrap extends StatelessWidget {
  final List<String> labels;
  final bool highlighted;

  const AppChipWrap(this.labels, {super.key, this.highlighted = false});

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [for (final l in labels) AppChip(l, highlighted: highlighted)],
      );
}

/// Button with an optional icon. [filled] = solid background, otherwise outlined.
class AppButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool filled;

  /// Background color (filled) or text/border color (outlined).
  final Color color;
  final Color onColor;

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.filled = true,
    this.color = UIColor.primary,
    this.onColor = UIColor.white,
  });

  @override
  Widget build(BuildContext context) {
    final fg = filled ? onColor : color;
    return SizedBox(
      height: kButtonHeight,
      child: Material(
        color: filled ? color : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: filled ? BorderSide.none : BorderSide(color: color.withValues(alpha: 0.5)),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              if (icon != null) ...[Icon(icon, size: 18, color: fg), const SizedBox(width: 8)],
              Text(label, style: AppTextStyle.button.copyWith(color: fg)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// Icon + text info row (email, address…). Tappable when [onTap] is set.
class AppInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Color color;

  const AppInfoRow({super.key, required this.icon, required this.text, this.onTap, this.color = UIColor.text2});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, size: 18, color: color.withValues(alpha: 0.8)),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: AppTextStyle.body.copyWith(color: color, height: 1.35))),
          ]),
        ),
      );
}

/// Timeline entry (experience, education): dot + vertical line on the left.
class AppTimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;
  final Widget? body;
  final bool isLast;

  const AppTimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
    this.body,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            width: 20,
            child: Column(children: [
              const SizedBox(height: 5),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: UIColor.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: UIColor.primary, width: 3),
                ),
              ),
              if (!isLast) Expanded(child: Container(width: 2, color: UIColor.primaryLight)),
            ]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: AppTextStyle.t1),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyle.t2.copyWith(color: UIColor.primary)),
                Text(period, style: AppTextStyle.small),
                if (body != null) ...[const SizedBox(height: 8), body!],
              ]),
            ),
          ),
        ]),
      );
}

/// Bulleted list.
class AppBulletList extends StatelessWidget {
  final List<String> items;

  const AppBulletList(this.items, {super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, right: 10),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(color: UIColor.primary, shape: BoxShape.circle),
                  ),
                ),
                Expanded(child: Text(item, style: AppTextStyle.body)),
              ]),
            ),
        ],
      );
}

/// Round avatar: asset image if given, otherwise initials.
class AppAvatar extends StatelessWidget {
  final String name;
  final String? asset;
  final double size;

  const AppAvatar({super.key, required this.name, this.asset, this.size = 112});

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: UIColor.accent,
          border: Border.all(color: UIColor.white, width: 4),
          image: asset == null ? null : DecorationImage(image: AssetImage(asset!), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: asset == null
            ? Text(_initials,
                style: AppTextStyle.display.copyWith(color: UIColor.accentText, fontSize: size * 0.34))
            : null,
      );
}
