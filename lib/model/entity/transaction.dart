import 'package:karikore/model/entity/user.dart';

class Transaction {
  final String id;
  final User owner;
  final User lender;
  final int duration;
  final int price;
  final TransactionStatus status;

  final DateTime createdAt;
  final DateTime? shippedAt;
  final DateTime? returnedAt;
  final DateTime? paidAt;

  Transaction(
      {required this.id,
      required this.owner,
      required this.lender,
      required this.duration,
      required this.price,
      required this.status,
      required this.createdAt,
      this.shippedAt,
      this.returnedAt,
      this.paidAt});
}

enum TransactionStatus { Created, Shipped, Returned, Paid, Cancelled, Error }
