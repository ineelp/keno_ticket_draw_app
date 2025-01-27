import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keno_ticket_draw_app/cubit/keno_cubit.dart';
import 'package:keno_ticket_draw_app/widgets/ball_draw_widget.dart';
import 'package:keno_ticket_draw_app/widgets/number_grid_widget.dart';
import 'package:mocktail/mocktail.dart';

class MockKenoCubit extends MockCubit<KenoState> implements KenoCubit {}

void main() {
  group('Ball Draw Widget renders', () {
    late KenoCubit kenoCubit;

    setUp(() {
      kenoCubit = MockKenoCubit();
    });

    Widget createWidget() {
      return BlocProvider.value(
        value: kenoCubit,
        child: MaterialApp(
          home: BallDrawWidget(),
        ),
      );
    }

    testWidgets('all its elements when state is KenoNumberDrawnState', (tester) async {
      when(() => kenoCubit.state).thenReturn(KenoNumberDrawnState([2, 4, 9], [2, 5, 10]));
      await tester.pumpWidget(createWidget());

      expect(find.byType(Column), findsOneWidget);

      expect(find.text('Drawn Numbers'), findsOneWidget);

      final widgetFinder = find.byType(NumberGridWidget);
      expect(widgetFinder, findsOneWidget);

      final drawnNumbers = (widgetFinder.evaluate().elementAt(0).widget as NumberGridWidget).numbers;

      // drawn numbers are matched with values passed into the KenoDrawnState
      expect(drawnNumbers, equals([2, 5, 10]));
    });

    testWidgets('an empty sizedbox when the state is KenoIntialState', (tester) async {
      when(() => kenoCubit.state).thenReturn(KenoInitialState());
      await tester.pumpWidget(createWidget());

      expect(find.byType(NumberGridWidget), findsNothing);

      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}
