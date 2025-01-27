import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keno_ticket_draw_app/cubit/keno_cubit.dart';
import 'package:keno_ticket_draw_app/screens/keno_home_page.dart';
import 'package:keno_ticket_draw_app/widgets/ball_draw_widget.dart';
import 'package:keno_ticket_draw_app/widgets/draw_and_reset_button.dart';
import 'package:keno_ticket_draw_app/widgets/ticket_numbers_widget.dart';
import 'package:mocktail/mocktail.dart';

class MockKenoCubit extends MockCubit<KenoState> implements KenoCubit {}

void main() {
  group('KenoHomePage renders', () {
    late KenoCubit kenoCubit;

    setUp(() {
      kenoCubit = MockKenoCubit();
      when(() => kenoCubit.ticketNumbers).thenReturn([1, 2, 3, 4]);
      when(() => kenoCubit.state).thenReturn(KenoNumberDrawnState([1, 5, 6, 10, 55], [1, 7, 8, 11, 45]));
    });

    Widget createWidget() {
      return BlocProvider.value(
        value: kenoCubit,
        child: MaterialApp(
          home: KenoHomePage(),
        ),
      );
    }

    testWidgets('TicketNumbersWidget', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(TicketNumbersWidget), findsOneWidget);
    });

    testWidgets('DrawAndResetButton', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(DrawAndResetButtion), findsOneWidget);
    });

    testWidgets('should display the BallDrawWidget', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(BallDrawWidget), findsOneWidget);
    });
  });
}
