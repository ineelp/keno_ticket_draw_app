import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/keno_cubit.dart';
import 'number_grid_widget.dart';

class TicketNumbersWidget extends StatelessWidget {
  const TicketNumbersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KenoCubit, KenoState>(
      builder: (context, state) {
        final cubit = context.read<KenoCubit>();
        final List<int> ticketNumbers = cubit.ticketNumbers;
        final List<int> selectedNumbers =
            state is KenoNumberSelectedState || state is KenoNumberDrawnState ? state.selectedNumbers : [];
        final List<int> drawnNumbers = state is KenoNumberDrawnState ? state.drawnNumbers : [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: NumberGridWidget(
                numbers: ticketNumbers,
                isMatched: (number) => drawnNumbers.contains(number),
                isSelected: (number) => selectedNumbers.contains(number),
                onTap: (number) => cubit.toggleNumberSelection(number),
              ),
            ),
          ],
        );
      },
    );
  }
}
