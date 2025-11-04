import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('Game loads with title and New Game button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tic Tac Toe'), findsOneWidget);
    expect(find.text('New Game'), findsOneWidget);
  });

  testWidgets('Initial status indicates X starts', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.textContaining("Player X's turn"), findsOneWidget);
  });

  testWidgets('Tap places X then O alternately', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Tap first cell -> X
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();
    expect(find.text('X'), findsWidgets);

    // Find next empty tile and tap -> O appears somewhere
    final tiles = find.byType(GestureDetector);
    await tester.tap(tiles.at(1));
    await tester.pump();
    expect(find.text('O'), findsWidgets);
  });
}
