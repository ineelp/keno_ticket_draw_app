import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/keno_cubit.dart';

class DrawAndResetButtion extends StatelessWidget {
  const DrawAndResetButtion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KenoCubit, KenoState>(
      builder: (context, state) {
        final selectedNumbers = state is KenoNumberSelectedState ? state.selectedNumbers.length : 0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Draw Balls Button
            ElevatedButton(
              onPressed: selectedNumbers >= 10 ? () => context.read<KenoCubit>().drawBalls() : null,
              child: Text('Draw Balls'),
            ),
            // Reset Button
            ElevatedButton(
              onPressed: () => context.read<KenoCubit>().resetSelection(),
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }
}
