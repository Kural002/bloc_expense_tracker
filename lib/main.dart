import 'package:bloc_expense_tracker/feature/expense/bloc/expense_bloc.dart';
import 'package:bloc_expense_tracker/feature/expense/repository/expense_repository.dart';
import 'package:bloc_expense_tracker/feature/expense/view/expense_list_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ExpenseBloc(ExpenseRepository()),
        child: const ExpenseListPage(),
      ),
    );
  }
}
