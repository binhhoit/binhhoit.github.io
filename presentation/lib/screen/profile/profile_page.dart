import 'package:flutter/material.dart';
import 'package:presentation/screen/profile/profile_data.dart';
import 'package:presentation/screen/profile/widgets/profile_header.dart';
import 'package:presentation/screen/profile/widgets/profile_sections.dart';
import 'package:presentation/utils/open_url.dart';
import 'package:presentation/utils/view_counter.dart';
import 'package:ui_kit/ui_kit.dart';

/// Single-page profile.
/// - Phones: one column.
/// - Wide (>= [kWideBreakpoint]): info sidebar left, content right.
/// - Ultra wide (>= [kUltraWideBreakpoint]): contact | about & experience | skills & projects.
class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final contact = ContactSection(profile: profile);
    // Education sits right under Contact so it is visible without scrolling.
    final education = profile.education.isEmpty ? null : EducationSection(items: profile.education);
    final skills = profile.skills.isEmpty ? null : SkillsSection(groups: profile.skills);
    final languages = profile.languages.isEmpty ? null : LanguagesSection(languages: profile.languages);
    final about = AboutSection(summary: profile.summary, services: profile.services);
    final experience = profile.experiences.isEmpty ? null : ExperienceSection(items: profile.experiences);
    final projects = profile.projects.isEmpty ? null : ProjectsSection(items: profile.projects);

    final Widget body;
    if (isUltraWide(context)) {
      body = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 300, child: _Column([contact, education, languages])),
        const SizedBox(width: 20),
        Expanded(child: _Column([about, experience])),
        const SizedBox(width: 20),
        SizedBox(width: 340, child: _Column([skills, projects])),
      ]);
    } else if (isWide(context)) {
      body = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 340, child: _Column([contact, education, skills, languages])),
        const SizedBox(width: 20),
        Expanded(child: _Column([about, experience, projects])),
      ]);
    } else {
      body = _Column([about, contact, education, skills, languages, experience, projects]);
    }

    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(children: [
            ProfileHeader(profile: profile),
            const SizedBox(height: 24),
            ResponsiveCenter(child: body),
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
        // Low-key visitor count pinned to the bottom-right corner.
        const Positioned(right: 12, bottom: 10, child: ViewCounter()),
      ]),
    );
  }
}

/// Vertical stack of sections; null entries (empty sections) are skipped.
class _Column extends StatelessWidget {
  final List<Widget> children;

  _Column(List<Widget?> sections) : children = sections.whereType<Widget>().toList();

  @override
  Widget build(BuildContext context) => Column(children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(height: 16),
          children[i],
        ],
      ]);
}
