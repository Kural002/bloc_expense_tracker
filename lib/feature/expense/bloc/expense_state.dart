abstract class ExpenseState {}

class ExpenseLaoding extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List expenses;
  ExpenseLoaded(this.expenses);
}

class ExpenseError extends ExpenseState {
  final String message;
  ExpenseError(this.message);
}
