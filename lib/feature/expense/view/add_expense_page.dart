import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/expense_bloc.dart';
import '../bloc/expense_event.dart';
import '../model/expense_model.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                final expense = ExpenseModel(
                  id: '',
                  title: titleController.text,
                  amount: double.parse(amountController.text),
                  date: DateTime.now(),
                );

                context.read<ExpenseBloc>().add(AddExpense(expense));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
