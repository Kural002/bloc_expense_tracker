import 'package:bloc_expense_tracker/feature/expense/model/expense_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseRepository {
  final _collection = FirebaseFirestore.instance.collection('expenses');

  Future<void> addExpense(ExpenseModel expense) async {
    await _collection.add(expense.toMap());
  }

  Stream<List<ExpenseModel>> getExpenses() {
    return _collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ExpenseModel.fromMap(doc.id, doc.data());
      }).toList();
    });
  }

  Future<void> deleteExpense(String id) async {
    await _collection.doc(id).delete();
  }
}
