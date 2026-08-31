import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anniversary_app/screens/game_screen.dart';

void main() {
  testWidgets('no se muestra el botón de silenciar y sí el de saltar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: GameScreen()));

    expect(find.byTooltip('Silenciar canción'), findsNothing);
    expect(find.byTooltip('Saltar a la siguiente parte'), findsOneWidget);
  });

  testWidgets('el botón de saltar puede accionarse sin romper la pantalla',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: GameScreen()));

    await tester.tap(find.byTooltip('Saltar a la siguiente parte'));
    await tester.pump();

    expect(find.byTooltip('Saltar a la siguiente parte'), findsOneWidget);
  });
}