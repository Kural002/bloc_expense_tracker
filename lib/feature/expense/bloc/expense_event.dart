import '../model/expense_model.dart';

abstract class ExpenseEvent {}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final ExpenseModel expense;
  AddExpense(this.expense);
}

class DeleteExpense extends ExpenseEvent {
  final String id;
  DeleteExpense(this.id);
}
