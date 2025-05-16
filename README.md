# keno_ticket_draw_app

Keno Ticket Draw is a Flutter app designed to provide a minimal version of a Keno live ball draw and ticket matching system.

To understand the color combination used for highlighing the selected numbers and matched (drawn) numbers -
- If the number is both selected and matched, it gets a green background and a red outline border.
- If the number is only matched (not selected), it gets a green background and no border.
- If the number is selected but not matched, it gets a blue background and no border.
- If the number is neither selected nor matched, it gets a grey background and no border (aka as-is).

## Preview

https://github.com/user-attachments/assets/4cc73a71-ea68-4d43-a7e6-3297f48af484

## Flutter Requirements

- Flutter stable version `3.27.3` required.

## Ecosystem

This is a list of major libraries we use:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): We use it for state management.
- [bloc_test](https://pub.dev/packages/bloc_test): We use it for cubit testing.
- [mocktail](https://pub.dev/packages/mocktail): We use it with cubit testing for stubbing and verifying behavior.

## Software Installation Prerequisites

Please install the following prerequisites:

- [Xcode](https://developer.apple.com/xcode/)
- [Android Studio](https://developer.android.com/studio)
- [Flutter](https://docs.flutter.dev/get-started/install)

## Run the App

To run the app, execute the following command:

```bash
flutter run -t lib/main.dart
```

## Run the test with coverage

To run the test, execute the following command:

```bash
# Generate `coverage/lcov.info` file
flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
open coverage/html/index.html
```


## File Structure
- **`lib/`**  
  The source code folder for the app.
  - **`cubit/`**  
    Contains the business logic of the app.  
    - `keno_cubit.dart`: Contains the Cubit that manages the state of the app.
    - `keno_state.dart`: Defines the states used by the Cubit.
  - **`screens/`**  
    Contains the UI screens of the app.  
    - `keno_home_page.dart`: The main screen of the app.
  - **`widgets/`**  
    Contains reusable widgets.  
    - `ball_draw_widget.dart`: Widget for the ball draw UI.
    - `draw_and_reset_button.dart`: Widget for the button to start/reset the ball draw.
    - `number_grid_widget.dart`: Widget for displaying the grid of numbers.
    - `ticket_numbers_widget.dart`: Widget for displaying selected ticket numbers.
  - **`main.dart`**  
    The entry point of the app.

- **`test/`**  
  Contains unit tests for the app.
  - **`cubit/`**  
    Tests for the Cubit logic.  
    - `keno_cubit_test.dart`: Contains the test cases for the Cubit logic.
  - **`widgets/`**  
    Tests for the widgets.  
    - `ball_draw_widget_test.dart`: Contains tests for the ball draw widget.
  - **`screens/`**  
    Tests for the screens.  
    - `keno_home_page_test.dart`: Contains tests for the home page screen.



## Challenges Covered

### Minimum Features:
- **Ticket Creation**: Provide a way for the user to create a ticket. ✅
- **Ball Draw**: Provide the ball draw that can be triggered by a button to start, showing 20 numbers on the screen in ascending order. ✅
- **Ticket Matching**: Highlight the numbers on the ticket that match the numbers drawn from the 
ball draw. ✅  
  Example:  
  - Ball Draw: `1, 5, 8, 17, 21, 23, 34, 37, 38, 40, 45, 47, 59, 61, 62, 64, 69, 72, 78, 79`  
  - Ticket: `5, 13, 14, 27, 34, 41, 44, 48, 59, 73`
- **Basic Testing**: Implemented minimum testing to ensure functionality. ✅

### Advanced Features:
- Add a time factor to the ball draw.  
  - The ball draw sequentially draws each number every 2 seconds. ✅
  - Highlight the numbers on the ticket only when a number is drawn (real-time matching). ✅
