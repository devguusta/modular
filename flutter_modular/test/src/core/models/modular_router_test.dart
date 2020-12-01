import 'package:flutter/material.dart';
import 'package:flutter_modular/src/core/models/modular_router.dart';
import 'package:flutter_test/flutter_test.dart';

import '../modules/child_module_test.dart';

main() {
  test('should initializa in incorrect form', () {
    expect(
        () => ModularRouter('/',
            child: (context, args) => Container(), module: ModuleMock()),
        throwsAssertionError);

    expect(
        () => ModularRouter('/',
            transition: TransitionType.custom, module: ModuleMock()),
        throwsAssertionError);

    expect(
        () => ModularRouter('/',
            children: [ModularRouter('/')], module: ModuleMock()),
        throwsAssertionError);
  });

  test('should make copy with implementation', () {
    final model = ModularRouter('/', module: ModuleMock());
    final copy = model.copyWith();
    expect(copy.module, isA<ModuleMock>());
    final copy2 = model.copyWith(path: '/home');
    expect(copy2.module, isA<ModuleMock>());
    expect(copy2.path, '/home');
    expect(copy.hashCode, equals(copy2.hashCode));
    expect(copy == copy2, true);
  });

  test('should normal instance custom transition', () {
    final model = ModularRouter('/',
        transition: TransitionType.custom, module: ModuleMock(),
        customTransition: CustomTransition(transitionBuilder: (c, a1, a2, w) {
      return FadeTransition(
        opacity: a1,
      );
    }));
    expect(model.transition, TransitionType.custom);
  });
}
