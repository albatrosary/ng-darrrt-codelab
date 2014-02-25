library controller.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:controller/src/pirate_module.dart' show PirateModule;
import 'package:controller/src/badges_controller.dart' show BadgesController;

main() {
  setUp(setUpInjector);
  tearDown(tearDownInjector);

  group('pirate badge', () {
    var name = 'misko';

    setUp(module((Module m) {
      m.install(new PirateModule());
    }));

    test('should load recipes', inject((BadgesController ctrl) {
      expect(ctrl.inputIsNotEmpty, isFalse);
      expect(ctrl.label, 'Aye! Gimme a name!');
    }));

    test('should generate name', inject((BadgesController ctrl) {
      expect(ctrl.name, isEmpty);
      ctrl.generateName();
      expect(ctrl.name, BadgesController.DEFAULT_NAME);
    }));
  });
}