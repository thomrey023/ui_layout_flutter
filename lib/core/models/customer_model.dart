// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerModel {
  final String uid;
  final bool remind;
  final String customerName;
  final double balance;
  CustomerModel({
    required this.uid,
    required this.remind,
    required this.customerName,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'remind': remind,
      'customerName': customerName,
      'balance': balance,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      uid: map['uid'] as String,
      remind: map['remind'] as bool,
      customerName: map['customerName'] as String,
      balance: map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

final allCustomers = [
  CustomerModel(
      uid: '1', remind: true, customerName: 'Juan Dela Cruz', balance: 10.00),
  CustomerModel(
      uid: '2', remind: true, customerName: 'Mel Francis', balance: 76.00),
  CustomerModel(
      uid: '3', remind: false, customerName: 'Pedro Penduko', balance: 0.00),
];
