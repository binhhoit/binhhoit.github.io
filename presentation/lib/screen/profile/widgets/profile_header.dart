import 'package:flutter/material.dart';
import 'package:presentation/screen/profile/profile_data.dart';
import 'package:presentation/utils/open_url.dart';
import 'package:ui_kit/ui_kit.dart';

/// Brand-colored header band: avatar, name, title and link buttons.
class ProfileHeader extends StatelessWidget {
  final Profile profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final wide = isWide(context);
    final avatar = AppAvatar(name: profile.name, asset: profile.avatarAsset, size: wide ? 132 : 108);
    final info = Column(
      crossAxisAlignment: wide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(profile.name, style: AppTextStyle.display, textAlign: wide ? TextAlign.start : TextAlign.center),
        const SizedBox(height: 6),
        Text(profile.title, style: AppTextStyle.headline, textAlign: wide ? TextAlign.start : TextAlign.center),
        const SizedBox(height: 4),
        Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.place_outlined, size: 16, color: UIColor.textOnPrimary),
          const SizedBox(width: 4),
          Text(profile.location, style: AppTextStyle.t2.copyWith(color: UIColor.textOnPrimary)),
        ]),
        if (profile.links.isNotEmpty || profile.email != null) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: wide ? WrapAlignment.start : WrapAlignment.center,
            children: [
              if (profile.email != null)
                AppButton(
                  label: 'Contact',
                  icon: Icons.mail_outline,
                  color: UIColor.accent,
                  onColor: UIColor.accentText,
                  onPressed: () => openUrl('mailto:${profile.email}'),
                ),
              for (final link in profile.links)
                AppButton(
                  label: link.label,
                  icon: link.icon,
                  filled: false,
                  color: UIColor.white,
                  onPressed: () => openUrl(link.url),
                ),
            ],
          ),
        ],
      ],
    );

    return Container(
      width: double.infinity,
      color: UIColor.primary,
      padding: EdgeInsets.symmetric(vertical: wide ? 48 : 32),
      child: ResponsiveCenter(
        child: wide
            ? Row(children: [avatar, const SizedBox(width: 32), Expanded(child: info)])
            : Column(children: [avatar, const SizedBox(height: 16), info]),
      ),
    );
  }
}
