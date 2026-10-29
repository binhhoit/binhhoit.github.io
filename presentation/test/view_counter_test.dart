import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/utils/view_counter.dart';

void main() {
  Future<void> pump(WidgetTester tester, Future<String?> Function() load) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ViewCounter(load: load))));
    await tester.pumpAndSettle();
  }

  testWidgets('shows the total when available', (tester) async {
    await pump(tester, () async => '1,234');
    expect(find.text('1,234 views'), findsOneWidget);
  });

  testWidgets('renders nothing when the counter is unavailable', (tester) async {
    await pump(tester, () async => null);
    expect(find.textContaining('views'), findsNothing);
  });
}
