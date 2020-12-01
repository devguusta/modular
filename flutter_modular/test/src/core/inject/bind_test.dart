import 'package:flutter_modular/src/core/inject/bind.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('singleton can\'t be false if \'lazy\' is also false', () {
    expect(() => Bind((i) => String, lazy: false, singleton: false),
        throwsAssertionError);
  });

  test('factories', () {
    expect(Bind.instance('string'), isA<Bind<String>>());
    expect(Bind.factory((i) => 'string'), isA<Bind<String>>());
    expect(Bind.lazySingleton((i) => 'string'), isA<Bind<String>>());
    expect(Bind.singleton((i) => 'string'), isA<Bind<String>>());
    expect(BindInject((i) => 'string'), isA<Bind<String>>());
  });
}
