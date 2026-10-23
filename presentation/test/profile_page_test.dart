import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/app.dart';
import 'package:presentation/screen/profile/profile_data.dart';

void main() {
  Future<void> pumpAt(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const ProfileApp());
    await tester.pumpAndSettle();
  }

  for (final (label, size) in [('phone', Size(390, 844)), ('desktop', Size(1440, 900))]) {
    testWidgets('renders profile on $label without overflow', (tester) async {
      await pumpAt(tester, size);
      expect(find.text(profile.name), findsWidgets);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
