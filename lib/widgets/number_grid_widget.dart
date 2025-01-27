import 'package:flutter/material.dart';

class NumberGridWidget extends StatelessWidget {
  // Numbers to display in the grid
  final List<int> numbers;
  // Logic for matched numbers
  final bool Function(int) isMatched;
  // Logic for selected numbers
  final bool Function(int) isSelected;
  // Optional tap handler
  final void Function(int)? onTap;

  const NumberGridWidget({
    super.key,
    required this.numbers,
    required this.isMatched,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        final number = numbers[index];

        // Determine the background color and border based on conditions
        Color backgroundColor;
        Color textColor;
        Border? border;

        // If the number is both selected and matched, it gets a green background and a red outline border
        if (isMatched(number) && isSelected(number)) {
          backgroundColor = Colors.green;
          textColor = Colors.white;
          border = Border.all(color: Colors.red, width: 2);
        }
        // If the number is only matched (not selected), it gets a green background and no border
        else if (isMatched(number)) {
          backgroundColor = Colors.green;
          textColor = Colors.white;
          border = null;
        }
        // If the number is selected but not matched, it gets a blue background and no border
        else if (isSelected(number)) {
          backgroundColor = Colors.blue;
          textColor = Colors.white;
          border = null;
        }
        // If the number is neither selected nor matched, it gets a grey background and no border
        else {
          backgroundColor = Colors.grey[300]!;
          textColor = Colors.black;
          border = null;
        }

        return GestureDetector(
          onTap: onTap != null ? () => onTap!(number) : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              // Add the border based on the condition
              border: border,
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
