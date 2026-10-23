import 'package:flutter/material.dart';

/// All profile content lives in this file — edit it and the page updates.
/// Source: LinkedIn timeline, CV (Nov 2024) and public GitHub repos.
/// Private details (address, birthday, phone) are left out on purpose.
const profile = Profile(
  name: 'Ho Thanh Binh',
  title: 'Senior Mobile Engineer · Native Android & Flutter · AI-assisted',
  location: 'Ho Chi Minh City, Vietnam',
  email: 'binhhoit@gmail.com',
  avatarAsset: 'assets/images/avatar.jpg',
  summary:
      'Senior mobile engineer with 9+ years in native Android (Kotlin, Java) and Flutter, taking apps from the first '
      'line of code to the App Store and Google Play. I currently build the Wumbo Digital Concierge app (iOS, Android) '
      'and web at WE Wumbo, Australia. Before that I shipped e-commerce, fintech, livestreaming, customer care and '
      'workforce apps for clients in Hong Kong, the UK, France, Australia and China.\n\n'
      'That deep native + Flutter foundation is what makes AI work for me. I know what solid architecture, smooth '
      'performance and good UX look like on a phone, so I let AI coding agents (Claude Code, MCP with Figma and '
      'Supabase) do the heavy lifting while I own the design decisions, code review and quality bar. The result: '
      'products delivered in weeks instead of months, with a smaller team and a lower budget, without the '
      'technical debt that usually comes with "fast".',
  services: [
    'MVP in weeks: mobile app, web admin, backend (Supabase / Firebase) and store release, end to end.',
    'Native or Flutter? Honest advice on the right stack, then building it, or migrating native apps to Flutter.',
    'Modernize legacy apps: Java to Kotlin, XML to Jetpack Compose, cleaner architecture and better performance.',
    'VoIP and video calls with Voximplant, SIP, WebRTC and CallKit / PushKit; plus livestreaming, chat and '
        'location tracking.',
    'Payments and subscriptions: Google Pay, Mangopay, Datatrans and in-app purchases.',
    'Store release and support: publish to Google Play and the App Store, handle review rejections, policy '
        'updates, signing and staged rollouts.',
    'AI-assisted workflow and CI/CD for your team, so a small team ships like a big one.',
  ],
  links: [
    ProfileLink(label: 'GitHub', url: 'https://github.com/binhhoit', icon: Icons.code),
    ProfileLink(
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/h%E1%BB%93-thanh-b%C3%ACnh-17b772116/',
      icon: Icons.business_center_outlined,
    ),
  ],
  skills: [
    SkillGroup(name: 'Languages', items: ['Kotlin', 'Java', 'Dart']),
    SkillGroup(
      name: 'AI-assisted Development',
      items: [
        'Claude Code',
        'AI coding agents',
        'MCP (Figma, Supabase)',
        'Figma-to-code',
        'Prompt engineering',
        'AI code review & testing',
      ],
    ),
    SkillGroup(name: 'Mobile', items: ['Flutter', 'Flutter Web', 'Android SDK', 'Jetpack Compose', 'iOS / SwiftUI']),
    SkillGroup(name: 'Architecture', items: ['MVVM', 'MVP', 'Clean Architecture', 'BLoC', 'Koin', 'Dagger']),
    SkillGroup(name: 'Async & Network', items: ['Coroutines', 'RxJava', 'Retrofit', 'REST API', 'Socket.IO']),
    SkillGroup(
      name: 'Realtime & Media',
      items: ['Voximplant SDK', 'VoIP / SIP', 'CallKit & PushKit', 'WebRTC', 'Livestream (RTMP)', 'Google Maps', 'Location tracking'],
    ),
    SkillGroup(
      name: 'Data & Cloud',
      items: ['Supabase', 'PostgreSQL', 'Firebase', 'Realtime Database', 'SQLite', 'MongoDB', 'AWS S3', 'Cloudinary'],
    ),
    SkillGroup(
      name: 'Store Release',
      items: [
        'Google Play Console',
        'App Store Connect',
        'TestFlight',
        'Signing & provisioning',
        'Store review & policy',
        'Staged rollout',
        'Crash monitoring',
      ],
    ),
    SkillGroup(name: 'Payments', items: ['Google Pay', 'Mangopay', 'Datatrans', 'Subscriptions']),
    SkillGroup(
      name: 'Quality & Delivery',
      items: ['Unit test', 'Espresso', 'Appium', 'GitHub Actions', 'Jenkins', 'GitLab CI', 'Cloudflare Pages'],
    ),
    SkillGroup(name: 'Tools & Process', items: ['Android Studio', 'VS Code', 'Git', 'Jira', 'Agile Scrum']),
  ],
  experiences: [
    Experience(
      role: 'Mobile Application Developer',
      company: 'WE Wumbo · Full-time · Remote (Melbourne, Australia)',
      period: 'Mar 2025 – Present',
      highlights: ['Flutter and Android development for the Wumbo mobile apps and web.'],
      projects: [
        WorkProject(
          name: 'Wumbo Digital Concierge',
          client: 'Australia',
          period: 'Mar 2025 – Present',
          description: 'Resident app for smart residential buildings: building news, facility bookings, parcel '
              'collection, neighbour groups, defect reporting, home documents, in-home services and rewards.',
          highlights: [
            'Build features for the iOS and Android apps with Flutter, plus the company web.',
            'Owners Corporation tools: resident polls, community space, invoice and quote voting.',
            'Light / dark themes, a unified Explore hub and streamlined issue reporting and tracking.',
          ],
          tags: ['Flutter', 'Dart', 'Android', 'iOS', 'Web'],
          links: [
            ProfileLink(
              label: 'Google Play',
              url: 'https://play.google.com/store/apps/details?id=io.wumbo.we',
              icon: Icons.shop_outlined,
            ),
            ProfileLink(
              label: 'App Store',
              url: 'https://apps.apple.com/vn/app/wumbo-digital-concierge/id1159641039',
              icon: Icons.phone_iphone,
            ),
          ],
        ),
      ],
    ),
    Experience(
      role: 'Freelance Flutter / Android Developer',
      company: 'Self-employed',
      period: 'Jan 2024 – Mar 2025',
      projects: [
        WorkProject(
          name: 'Reading App',
          client: 'Freelance',
          period: '2024',
          description: 'Mobile app for reading books, with a library and a comfortable reading experience.',
          tags: ['Flutter', 'Android'],
        ),
        WorkProject(
          name: 'Astro7 · Voice & Video Calling',
          client: 'Freelance',
          period: '2024 – 2025',
          description: 'VoIP calling app (Flutter) built on the Voximplant platform, with native incoming-call screens '
              'that ring even when the app is killed or the phone is locked.',
          highlights: [
            'Built the calling core on Voximplant: flutter_voximplant for login, SIP / VoIP calls and media, '
                'flutter_callkit_voximplant to bridge Voximplant calls into the native iOS CallKit UI.',
            'iOS: VoIP push handling with PushKit in AppDelegate, showing the native CallKit screen via '
                'flutter_callkit_incoming.',
            'Android: incoming calls via Firebase Cloud Messaging; answer from the lock screen (wake lock, '
                'show-when-locked, keyguard) through a Flutter MethodChannel.',
            'Incoming and outgoing call flows, ringtone and vibration, Crashlytics and Analytics.',
          ],
          tags: [
            'Voximplant',
            'flutter_voximplant',
            'flutter_callkit_voximplant',
            'CallKit',
            'PushKit',
            'SIP',
            'FCM',
            'Flutter',
            'BLoC',
          ],
        ),
      ],
    ),
    Experience(
      role: 'Android Developer',
      company: 'Saigon Technology · Full-time',
      period: 'May 2022 – Jan 2024',
      projects: [
        WorkProject(
          name: 'Milwaukee ONE-KEY',
          client: 'Hong Kong / EMEA',
          period: 'Apr 2023 – Jan 2024',
          team: '14 members',
          description: 'ONE-KEY, Milwaukee\'s digital platform for tools and equipment: warranty management, '
              'customer feedback, promotions, region-based content and a supply-chain store locator.',
          highlights: [
            'Structured the codebase and built UI from the client Figma designs.',
            'Wrote unit tests and UI tests for the Android project.',
            'Tested APIs and resolved issues together with the backend team.',
          ],
          tags: ['Kotlin', 'MVVM', 'Koin', 'Coroutines', 'Unit test'],
          links: [
            ProfileLink(
              label: 'Google Play',
              url: 'https://play.google.com/store/apps/details?id=com.milwaukeetool.onekey_emea&hl=en',
              icon: Icons.shop_outlined,
            ),
          ],
        ),
        WorkProject(
          name: 'Lowell',
          client: 'United Kingdom',
          period: 'Apr 2022 – Apr 2023',
          team: '13 members',
          description: 'Customer app of Lowell, a UK financial services company: view accounts and balances, check '
              'affordability, set up payment plans and automatic payments, pay by card, Google Pay or Apple Pay, '
              'payment history and biometric login.',
          highlights: [
            'Built animated UI components following the design.',
            'Proposed solutions for memory management and app lifecycle.',
            'Refactored the codebase to be clear and easy to extend.',
          ],
          tags: ['Kotlin', 'MVVM', 'Koin', 'Coroutines', 'Firebase'],
          links: [
            ProfileLink(
              label: 'Google Play',
              url: 'https://play.google.com/store/apps/details?id=com.lowell.app',
              icon: Icons.shop_outlined,
            ),
            ProfileLink(
              label: 'App Store',
              url: 'https://apps.apple.com/gb/app/lowell/id1561110150',
              icon: Icons.phone_iphone,
            ),
            ProfileLink(label: 'Website', url: 'https://www.lowell.co.uk/mobile-app/', icon: Icons.language),
          ],
        ),
      ],
    ),
    Experience(
      role: 'Mobile Application Developer',
      company: 'Dirox · Full-time',
      period: 'Oct 2019 – Jul 2022',
      highlights: ['Android development while picking up iOS (SwiftUI).'],
      projects: [
        WorkProject(
          name: 'Social Challenge App',
          client: 'France',
          period: 'Oct 2019 – Apr 2022',
          team: '8 members',
          description: 'Social platform where users challenge each other, livestream the challenge, chat with '
              'friends and donate to charities.',
          highlights: [
            'Built a multi-user livestreaming system (RTMP) and realtime chat.',
            'Designed the realtime database on Firebase.',
            'Integrated Mangopay and Google Pay; file transfer on AWS.',
            'Optimized memory and security; background services for performance and battery.',
          ],
          tags: ['Kotlin', 'MVVM', 'RTMP', 'RxJava', 'Dagger', 'Socket.IO', 'Firebase'],
        ),
      ],
    ),
    Experience(
      role: 'Android Developer, Research and Development',
      company: 'ComplyFlowSoft · Full-time',
      period: 'Nov 2018 – Oct 2019',
      highlights: ['Compliance apps: Live Access, Muster List live notifications, Comply Flow Inspection.'],
      projects: [
        WorkProject(
          name: 'Airport Staff & Process Manager',
          client: 'Australia',
          period: 'Jan 2019 – Oct 2019',
          team: '6 members',
          description: 'Workforce app for airport staff: auto check-in and a task/process manager integrated '
              'with Jira and reminders.',
          highlights: [
            'Implemented realtime location tracking with Google Maps (location, distance, area) '
                'together with the backend team in Australia.',
            'Optimized the feature for smooth interaction with the backend.',
          ],
          tags: ['Java', 'MVP', 'RxJava', 'Dagger', 'Retrofit', 'Google Maps'],
        ),
      ],
    ),
    Experience(
      role: 'Android Developer',
      company: 'BeeSightSoft',
      period: 'Jul 2017 – Dec 2018',
      // Store pages and websites of these apps are no longer online, so they are listed without links.
      highlights: ['Shipped apps including Kiddi Family, Multiply and SpoutInfo.'],
      projects: [
        WorkProject(
          name: 'Farm Food & Equipment Store',
          client: 'China',
          period: 'Jul 2017 – Dec 2018',
          team: '15 members',
          description: 'E-commerce platform for a multinational farm food and agricultural equipment store, '
              'with monthly / yearly subscriptions and customer surveys.',
          highlights: [
            'Built the payment and subscription flows.',
            'Security measures to protect user data; testing, debugging and maintenance.',
          ],
          tags: ['Java', 'MVP', 'RxJava', 'Dagger', 'Retrofit'],
        ),
        WorkProject(
          name: 'Kiddi Family',
          client: 'Vietnam',
          period: 'Jul 2017 – Jul 2018',
          team: '9 members',
          description: 'App for parents to monitor their child\'s health: dashboard, location on map, alerts, '
              'mini-games, appointment scheduling and health news.',
          highlights: [
            'Location features with Google Maps (tracking, distance, area).',
            'Reusable mini-game template with sound effects and animations.',
            'Optimized performance for location tracking and video playback.',
          ],
          tags: ['Java', 'MVP', 'Google Maps', 'Animation'],
        ),
      ],
    ),
  ],
  projects: [
    Project(
      name: 'WebRTC Flutter',
      description: 'Peer-to-peer video call app built with Flutter and WebRTC.',
      tags: ['Flutter', 'WebRTC'],
      url: 'https://github.com/binhhoit/WebRTC-Flutter',
    ),
    Project(
      name: 'Datatrans Plugin',
      description: 'Flutter plugin wrapping the native Datatrans payment SDK.',
      tags: ['Flutter', 'Plugin', 'Payment'],
      url: 'https://github.com/binhhoit/Datatrans_plugin',
    ),
    Project(
      name: 'Mobile Tracking Location',
      description: 'Background location tracking for mobile.',
      tags: ['Mobile', 'Location'],
      url: 'https://github.com/binhhoit/mobile-tracking-location',
    ),
    Project(
      name: 'Clean Architecture',
      description: 'Android sample following Clean Architecture layers.',
      tags: ['Kotlin', 'Clean Architecture'],
      url: 'https://github.com/binhhoit/Clean-Architecture-',
    ),
    Project(
      name: 'Demo Compose Android',
      description: 'Base Android project using Jetpack Compose and Compose APIs.',
      tags: ['Kotlin', 'Compose'],
      url: 'https://github.com/binhhoit/DemoComposeAndroid',
    ),
    Project(
      name: 'Twitter Auth Kotlin',
      description: 'Step-by-step Twitter sign-in implementation on Android.',
      tags: ['Kotlin', 'OAuth'],
      url: 'https://github.com/binhhoit/handle_twitter_auth_kotlin',
    ),
  ],
  education: [
    Education(
      school: 'University of Information Technology',
      detail: 'Vietnam National University, Ho Chi Minh City',
      period: 'Sep 2013 – Jul 2017',
      logoAsset: 'assets/images/uit_logo.jpg',
    ),
  ],
  languages: ['Vietnamese — native', 'English — working proficiency'],
);

class Profile {
  final String name;
  final String title;
  final String location;
  final String? email;
  final String? phone;
  final String? avatarAsset;
  final String summary;

  /// What I offer to clients, shown under the summary as "How I can help".
  final List<String> services;
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
    this.services = const [],
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
  final List<WorkProject> projects;

  const Experience({
    required this.role,
    required this.company,
    required this.period,
    this.highlights = const [],
    this.projects = const [],
  });
}

/// A client project delivered while working at a company.
class WorkProject {
  final String name;
  final String client;
  final String period;
  final String? team;
  final String description;
  final List<String> highlights;
  final List<String> tags;
  final List<ProfileLink> links;

  const WorkProject({
    required this.name,
    required this.client,
    required this.period,
    required this.description,
    this.team,
    this.highlights = const [],
    this.tags = const [],
    this.links = const [],
  });
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
  final String detail;
  final String period;
  final String? logoAsset;

  const Education({required this.school, required this.detail, required this.period, this.logoAsset});
}
