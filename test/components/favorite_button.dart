import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karikore/components/favorite_button.dart';

void main() {
  testWidgets("Click favorite button", (WidgetTester tester) async {
    await tester.pumpWidget(FavoriteButton());
    final buttonFinder = find.byType(FavoriteButton);
    expect(buttonFinder, findsOneWidget);
    expect(find.descendant(of: buttonFinder, matching: find.byIcon(CupertinoIcons.heart)), findsOneWidget);
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(find.descendant(of: buttonFinder, matching: find.byIcon(CupertinoIcons.heart_fill)), findsOneWidget);
  });
}