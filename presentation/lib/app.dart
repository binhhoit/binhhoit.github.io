import 'package:flutter/material.dart';
import 'package:presentation/screen/profile/profile_data.dart';
import 'package:presentation/screen/profile/profile_page.dart';
import 'package:ui_kit/ui_kit.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: '${profile.name} · ${profile.title}',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'packages/ui_kit/inter',
          scaffoldBackgroundColor: UIColor.page,
          colorScheme: ColorScheme.fromSeed(seedColor: UIColor.primary, primary: UIColor.primary),
        ),
        home: const ProfilePage(profile: profile),
      );
}
