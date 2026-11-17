import 'package:examen3/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('La app muestra el registro de peso vacío', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Registro de Peso'), findsOneWidget);
    expect(find.text('No hay registros'), findsOneWidget);
  });

  testWidgets('Permite agregar un registro de peso', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Agregar peso'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), '17/11/2026');
    await tester.enterText(find.byType(TextFormField).at(1), '72.5');
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    expect(find.text('Fecha: 17/11/2026'), findsOneWidget);
    expect(find.text('Peso: 72.5 kg'), findsOneWidget);
  });

  testWidgets('No permite guardar un peso inválido', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Agregar peso'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), '17/11/2026');
    await tester.enterText(find.byType(TextFormField).at(1), '0');
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    expect(find.text('Ingresa un peso válido mayor a 0'), findsOneWidget);
    expect(find.text('No hay registros'), findsNothing);
  });
}
