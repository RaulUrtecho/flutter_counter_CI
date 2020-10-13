import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final counterTextFinder = find.byValueKey('counter');
    final buttonIncrementFinder =
        find.byValueKey('counterView_increment_floatingActionButton');
    final buttonDecrementFinder =
        find.byValueKey('counterView_decrement_floatingActionButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      await driver.tap(buttonIncrementFinder);
      Future.delayed(Duration(seconds: 2));
      // verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });

    test('decrements the counter', () async {
      Future.delayed(Duration(seconds: 2));
      await driver.tap(buttonDecrementFinder);
      Future.delayed(Duration(seconds: 2));
      // verify the counter text is decremented by 0.
      expect(await driver.getText(counterTextFinder), "0");
    });
  });
}
