part of 'keno_cubit.dart';

abstract class KenoState {
  final List<int> selectedNumbers;

  const KenoState({this.selectedNumbers = const []});
}

class KenoInitialState extends KenoState {}

class KenoNumberSelectedState extends KenoState {
  const KenoNumberSelectedState(List<int> selectedNumbers) : super(selectedNumbers: selectedNumbers);
}

class KenoNumberDrawnState extends KenoState {
  final List<int> drawnNumbers;

  const KenoNumberDrawnState(
    List<int> selectedNumbers,
    this.drawnNumbers,
  ) : super(selectedNumbers: selectedNumbers);
}

class KenoResetState extends KenoState {
  KenoResetState();
}
