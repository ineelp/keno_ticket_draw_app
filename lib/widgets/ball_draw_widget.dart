import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/keno_cubit.dart';
import 'number_grid_widget.dart';

class BallDrawWidget extends StatelessWidget {
  const BallDrawWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KenoCubit, KenoState>(
      builder: (context, state) {
        if (state is KenoNumberDrawnState) {
          return Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Drawn Numbers', style: TextStyle(fontSize: 18)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: NumberGridWidget(
                  numbers: state.drawnNumbers,
                  isMatched: (number) => state.drawnNumbers.contains(number),
                  // No selection in this widget
                  isSelected: (_) => false,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
