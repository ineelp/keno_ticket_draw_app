import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keno_ticket_draw_app/cubit/keno_cubit.dart';

void main() {
  group('KenoCubit', () {
    late KenoCubit kenoCubit;

    setUp(() {
      kenoCubit = KenoCubit();
    });

    group('default state', () {
      test('is KenoInitialState', () {
        expect(kenoCubit.state, isA<KenoInitialState>());
      });
    });

    blocTest<KenoCubit, KenoState>(
      'emits KenoNumberSelectedState',
      build: () => KenoCubit(),
      act: (cubit) => cubit.toggleNumberSelection(2),
      expect: () => [isA<KenoNumberSelectedState>().having((e) => e.selectedNumbers, 'selected numbers', contains(2))],
    );

    blocTest<KenoCubit, KenoState>(
      'emits KenoResetState',
      build: () => KenoCubit(),
      act: (cubit) => cubit.resetSelection(),
      expect: () => [isA<KenoResetState>()],
    );
  });
}
