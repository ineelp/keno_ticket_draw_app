import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/keno_cubit.dart';
import 'screens/keno_home_page.dart';

void main() {
  runApp(KenoApp());
}

class KenoApp extends StatelessWidget {
  const KenoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keno Ticket Draw',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Provide the KenoBloc to the widget tree using BlocProvider
      home: BlocProvider(
        create: (context) => KenoCubit(),
        child: KenoHomePage(),
      ),
    );
  }
}
