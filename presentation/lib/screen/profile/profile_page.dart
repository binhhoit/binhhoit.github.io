import 'package:flutter/material.dart';
import 'package:presentation/screen/profile/profile_data.dart';
import 'package:presentation/screen/profile/widgets/profile_header.dart';
import 'package:presentation/screen/profile/widgets/profile_sections.dart';
import 'package:presentation/utils/open_url.dart';
import 'package:ui_kit/ui_kit.dart';

/// Single-page profile. Phones: one column. Wide screens (>= [kWideBreakpoint]): info sidebar left, content right.
class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final wide = isWide(context);
    final side = [
      ContactSection(profile: profile),
      // Education sits right under Contact so it is visible without scrolling.
      if (profile.education.isNotEmpty) EducationSection(items: profile.education),
      if (profile.skills.isNotEmpty) SkillsSection(groups: profile.skills),
      if (profile.languages.isNotEmpty) LanguagesSection(languages: profile.languages),
    ];
    final main = [
      AboutSection(summary: profile.summary),
      if (profile.experiences.isNotEmpty) ExperienceSection(items: profile.experiences),
      if (profile.projects.isNotEmpty) ProjectsSection(items: profile.projects),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ProfileHeader(profile: profile),
          const SizedBox(height: 24),
          ResponsiveCenter(
            child: wide
                ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(width: 340, child: _Column(side)),
                    const SizedBox(width: 20),
                    Expanded(child: _Column(main)),
                  ])
                : _Column([main.first, ...side, ...main.skip(1)]),
          ),
          const SizedBox(height: 32),
          Text('© ${DateTime.now().year} ${profile.name}', style: AppTextStyle.small),
          const SizedBox(height: 4),
          // Attribution required by the Flaticon free license for the site icon.
          InkWell(
            onTap: () => openUrl('https://www.flaticon.com/free-icon/app-development_5738077'),
            child: Text('Site icon by Freepik – Flaticon', style: AppTextStyle.small),
          ),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }
}

class _Column extends StatelessWidget {
  final List<Widget> children;

  const _Column(this.children);

  @override
  Widget build(BuildContext context) => Column(children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(height: 16),
          children[i],
        ],
      ]);
}
