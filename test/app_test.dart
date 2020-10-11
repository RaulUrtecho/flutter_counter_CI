// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('is a MaterialApp', (tester) async {
      expect(App(), isA<MaterialApp>());
    });

    testWidgets('home is CounterPage', (tester) async {
      expect(App().home, isA<CounterPage>());
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
