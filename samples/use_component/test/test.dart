library use_component.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:use_component/src/badges_controller.dart';
import 'package:use_component/src/pirate_module.dart';
import 'package:use_component/src/badge/badge_component.dart';

main() {
  setUp(setUpInjector);
  tearDown(tearDownInjector);

  group('pirate badge', () {
    TestBed tb;

    setUp(module((Module m) {
      m.install(new PirateModule());
      inject((TestBed testBed) => tb = testBed);
      inject((BadgesController _ctrl) => tb.rootScope.ctrl = _ctrl);
      inject((BadgeComponent _cmp) => tb.rootScope.cmp = _cmp);
    }));
  });
}