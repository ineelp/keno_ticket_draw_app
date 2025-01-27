import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keno_ticket_draw_app/widgets/ball_draw_widget.dart';
import 'package:keno_ticket_draw_app/widgets/draw_and_reset_button.dart';
import 'package:keno_ticket_draw_app/widgets/ticket_numbers_widget.dart';
import '../cubit/keno_cubit.dart';

class KenoHomePage extends StatefulWidget {
  const KenoHomePage({super.key});

  @override
  State<KenoHomePage> createState() => KenoHomePageState();
}

class KenoHomePageState extends State<KenoHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KenoCubit, KenoState>(
      builder: (context, state) {
        final selectedNumbers = state is KenoNumberSelectedState ? state.selectedNumbers.length : 0;

        return Scaffold(
          appBar: AppBar(title: Text('Keno Ticket Draw')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedNumbers == 0
                      ? 'Pick your 10 numbers'
                      : '$selectedNumbers ${selectedNumbers == 1 ? 'number' : 'numbers'} picked',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Displays numbers between 1 and 80
                        TicketNumbersWidget(),
                        // Displays draw balls and reset buttons
                        DrawAndResetButtion(),
                        // Displays the drwan numbers
                        BallDrawWidget()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
