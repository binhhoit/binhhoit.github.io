import 'package:flutter/material.dart';

/// All profile content lives in this file — edit it and the page updates.
/// TODO(profile): replace the sample data with real information.
const profile = Profile(
  name: 'Binh Ho',
  title: 'Mobile Developer · Flutter / Android / iOS',
  location: 'Viet Nam',
  email: null,
  phone: null,
  avatarAsset: null, // e.g. 'assets/images/avatar.jpg' (put the file in presentation/assets/images/)
  summary:
      'Mobile developer building cross-platform apps with Flutter, plus native Android (Kotlin, Jetpack Compose) '
      'and iOS (Swift). Focused on clean architecture, maintainable UI kits and shipping to Android, iOS, web and desktop.',
  links: [
    ProfileLink(label: 'GitHub', url: 'https://github.com/binhhoit', icon: Icons.code),
  ],
  skills: [
    SkillGroup(name: 'Mobile', items: ['Flutter', 'Dart', 'Android', 'Kotlin', 'Jetpack Compose', 'iOS', 'Swift']),
    SkillGroup(name: 'Architecture', items: ['Clean Architecture', 'BLoC / Cubit', 'MVVM', 'Dependency Injection']),
    SkillGroup(name: 'Backend & Tools', items: ['REST API', 'Supabase', 'WebRTC', 'Git', 'CI/CD']),
  ],
  experiences: [
    Experience(
      role: 'Mobile Developer',
      company: 'Updating',
      period: '20xx – present',
      highlights: ['Updating'],
    ),
  ],
  projects: [
    Project(
      name: 'WebRTC Flutter',
      description: 'Video call demo built with Flutter and WebRTC.',
      tags: ['Flutter', 'WebRTC'],
      url: 'https://github.com/binhhoit/WebRTC-Flutter',
    ),
    Project(
      name: 'Mobile Tracking Location',
      description: 'Location tracking app for mobile.',
      tags: ['Mobile', 'Location'],
      url: 'https://github.com/binhhoit/mobile-tracking-location',
    ),
    Project(
      name: 'Datatrans Plugin',
      description: 'Flutter plugin integrating the Datatrans payment SDK.',
      tags: ['Flutter', 'Plugin', 'Payment'],
      url: 'https://github.com/binhhoit/Datatrans_plugin',
    ),
    Project(
      name: 'Demo Compose Android',
      description: 'Base Android project using Jetpack Compose.',
      tags: ['Android', 'Compose'],
      url: 'https://github.com/binhhoit/DemoComposeAndroid',
    ),
  ],
  education: [],
  languages: [],
);

class Profile {
  final String name;
  final String title;
  final String location;
  final String? email;
  final String? phone;
  final String? avatarAsset;
  final String summary;
  final List<ProfileLink> links;
  final List<SkillGroup> skills;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Education> education;
  final List<String> languages;

  const Profile({
    required this.name,
    required this.title,
    required this.location,
    required this.summary,
    this.email,
    this.phone,
    this.avatarAsset,
    this.links = const [],
    this.skills = const [],
    this.experiences = const [],
    this.projects = const [],
    this.education = const [],
    this.languages = const [],
  });
}

class ProfileLink {
  final String label;
  final String url;
  final IconData icon;

  const ProfileLink({required this.label, required this.url, required this.icon});
}

class SkillGroup {
  final String name;
  final List<String> items;

  const SkillGroup({required this.name, required this.items});
}

class Experience {
  final String role;
  final String company;
  final String period;
  final List<String> highlights;

  const Experience({required this.role, required this.company, required this.period, this.highlights = const []});
}

class Project {
  final String name;
  final String description;
  final List<String> tags;
  final String? url;

  const Project({required this.name, required this.description, this.tags = const [], this.url});
}

class Education {
  final String school;
  final String degree;
  final String period;

  const Education({required this.school, required this.degree, required this.period});
}
