import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
part 'keno_state.dart';

class KenoCubit extends Cubit<KenoState> {
  KenoCubit() : super(KenoInitialState()) {
    // Generate a list of numbers from 1 to 80
    ticketNumbers = List<int>.generate(80, (index) => index + 1);
    _selectedNumbers = [];
    _drawnNumbers = [];
  }

  // Track selected numbers
  late List<int> _selectedNumbers;
  // Track drawn numbers
  late List<int> _drawnNumbers;
  // Ticket numbers
  late final List<int> ticketNumbers;

  // Add or remove selected number
  void toggleNumberSelection(int number) {
    if (_selectedNumbers.contains(number)) {
      _selectedNumbers.remove(number);
    } else {
      if (_selectedNumbers.length < 10) {
        _selectedNumbers.add(number);
      }
    }

    emit(KenoNumberSelectedState(List<int>.from(_selectedNumbers)));
  }

  // Trigger the ball draw
  Future<void> drawBalls() async {
    final random = Random();
    Set<int> drawnNumbersSet = {};

    // Generate 20 unique random numbers between 1 and 80
    while (drawnNumbersSet.length < 20) {
      drawnNumbersSet.add(random.nextInt(80) + 1); // Random number between 1 and 80
    }

    // Convert the set to a list and sort in ascending order
    _drawnNumbers = drawnNumbersSet.toList()..sort();

    // Sequentially emit numbers every 2 seconds
    for (var i = 0; i < _drawnNumbers.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      // Ensure that the sublist index does not exceed the list length
      emit(
        KenoNumberDrawnState(
          _selectedNumbers,
          _drawnNumbers.sublist(0, i + 1 < _drawnNumbers.length ? i + 1 : _drawnNumbers.length),
        ),
      );
    }
  }

// Reset selected numbers and drawn numbers for a fresh start
  void resetSelection() {
    _selectedNumbers.clear();
    _drawnNumbers.clear();
    emit(KenoResetState());
  }
}
