import 'package:flutter/material.dart';
import 'package:presentation/screen/profile/profile_data.dart';
import 'package:presentation/utils/open_url.dart';
import 'package:ui_kit/ui_kit.dart';

class AboutSection extends StatelessWidget {
  final String summary;
  final List<String> services;

  const AboutSection({super.key, required this.summary, this.services = const []});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'About',
        icon: Icons.person_outline,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(summary, style: AppTextStyle.body),
          if (services.isNotEmpty) ...[
            const SizedBox(height: 18),
            Text('How I can help', style: AppTextStyle.t1),
            const SizedBox(height: 8),
            AppBulletList(services),
          ],
        ]),
      );
}

class ContactSection extends StatelessWidget {
  final Profile profile;

  const ContactSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'Contact',
        icon: Icons.alternate_email,
        child: Column(children: [
          AppInfoRow(icon: Icons.place_outlined, text: profile.location),
          if (profile.email != null)
            AppInfoRow(
              icon: Icons.mail_outline,
              text: profile.email!,
              color: UIColor.primary,
              onTap: () => openUrl('mailto:${profile.email}'),
            ),
          if (profile.phone != null)
            AppInfoRow(
              icon: Icons.phone_outlined,
              text: profile.phone!,
              color: UIColor.primary,
              onTap: () => openUrl('tel:${profile.phone}'),
            ),
          for (final link in profile.links)
            AppInfoRow(
              icon: link.icon,
              text: Uri.decodeFull(link.url).replaceFirst(RegExp(r'^https?://(www\.)?'), ''),
              color: UIColor.primary,
              onTap: () => openUrl(link.url),
            ),
        ]),
      );
}

class SkillsSection extends StatelessWidget {
  final List<SkillGroup> groups;

  const SkillsSection({super.key, required this.groups});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'Skills',
        icon: Icons.bolt_outlined,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < groups.length; i++) ...[
            if (i > 0) const SizedBox(height: 14),
            Text(groups[i].name, style: AppTextStyle.t2),
            const SizedBox(height: 8),
            AppChipWrap(groups[i].items, highlighted: i == 0),
          ],
        ]),
      );
}

class LanguagesSection extends StatelessWidget {
  final List<String> languages;

  const LanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'Languages',
        icon: Icons.translate,
        child: AppBulletList(languages),
      );
}

class ExperienceSection extends StatelessWidget {
  final List<Experience> items;

  const ExperienceSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'Experience',
        icon: Icons.work_outline,
        child: Column(children: [
          for (var i = 0; i < items.length; i++)
            AppTimelineItem(
              title: items[i].role,
              subtitle: items[i].company,
              period: items[i].period,
              isLast: i == items.length - 1,
              body: _experienceBody(items[i]),
            ),
        ]),
      );

  Widget? _experienceBody(Experience e) {
    if (e.highlights.isEmpty && e.projects.isEmpty) return null;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (e.highlights.isNotEmpty) AppBulletList(e.highlights),
      for (final p in e.projects) ...[const SizedBox(height: 8), _WorkProjectCard(project: p)],
    ]);
  }
}

/// Client project block nested under a company in the experience timeline.
class _WorkProjectCard extends StatelessWidget {
  final WorkProject project;

  const _WorkProjectCard({required this.project});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: UIColor.page, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${project.name} · ${project.client}', style: AppTextStyle.t1),
          const SizedBox(height: 2),
          Text(
            [project.period, if (project.team != null) project.team!].join(' · '),
            style: AppTextStyle.small,
          ),
          const SizedBox(height: 8),
          Text(project.description, style: AppTextStyle.body.copyWith(fontSize: 13)),
          if (project.highlights.isNotEmpty) ...[const SizedBox(height: 8), AppBulletList(project.highlights)],
          if (project.tags.isNotEmpty) ...[const SizedBox(height: 8), AppChipWrap(project.tags)],
          if (project.links.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final link in project.links)
                AppButton(
                  label: link.label,
                  icon: link.icon,
                  filled: false,
                  color: UIColor.primary,
                  onPressed: () => openUrl(link.url),
                ),
            ]),
          ],
        ]),
      );
}

class EducationSection extends StatelessWidget {
  final List<Education> items;

  const EducationSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'Education',
        icon: Icons.school_outlined,
        child: Column(children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(height: 14),
            _EducationRow(item: items[i]),
          ],
        ]),
      );
}

class _EducationRow extends StatelessWidget {
  final Education item;

  const _EducationRow({required this.item});

  @override
  Widget build(BuildContext context) => Row(children: [
        if (item.logoAsset != null) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(item.logoAsset!, width: 52, height: 52, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),
        ],
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item.school, style: AppTextStyle.t1),
            const SizedBox(height: 2),
            Text(item.detail, style: AppTextStyle.t2.copyWith(color: UIColor.primary)),
            Text(item.period, style: AppTextStyle.small),
          ]),
        ),
      ]);
}

class ProjectsSection extends StatelessWidget {
  final List<Project> items;

  const ProjectsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) => AppSection(
        title: 'Projects',
        icon: Icons.folder_open_outlined,
        child: LayoutBuilder(builder: (context, c) {
          // Two tiles per row when there is enough room.
          final cols = c.maxWidth >= 560 ? 2 : 1;
          final w = (c.maxWidth - (cols - 1) * 12) / cols;
          return Wrap(spacing: 12, runSpacing: 12, children: [
            for (final p in items) SizedBox(width: w, child: _ProjectTile(project: p)),
          ]);
        }),
      );
}

class _ProjectTile extends StatelessWidget {
  final Project project;

  const _ProjectTile({required this.project});

  @override
  Widget build(BuildContext context) => Material(
        color: UIColor.page,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: project.url == null ? null : () => openUrl(project.url!),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(child: Text(project.name, style: AppTextStyle.t1)),
                if (project.url != null) const Icon(Icons.north_east, size: 16, color: UIColor.primary),
              ]),
              const SizedBox(height: 4),
              Text(project.description, style: AppTextStyle.body.copyWith(fontSize: 13)),
              if (project.tags.isNotEmpty) ...[const SizedBox(height: 10), AppChipWrap(project.tags)],
            ]),
          ),
        ),
      );
}
