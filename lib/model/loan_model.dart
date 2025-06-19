import 'package:loan_app/model/guarantor_model.dart';
import 'package:loan_app/model/member_model.dart';

class LoanModel {
  LoanModel({
    required this.loanId,
    required this.loanAmount,
    required this.loanInterest,
    required this.loanTotal,
    required this.loanDueDate,
    required this.loanStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.member,
    required this.guarantors,
  });

  final int loanId;
  final String loanAmount;
  final String loanInterest;
  final String loanTotal;
  final String loanDueDate;
  final String loanStatus;
  final String createdAt;
  final String updatedAt;
  final MemberModel member;
  final List<GuarantorModel> guarantors;

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
     loanId: (json['id'] as num?)?.toInt() ?? 0,
      loanAmount: json['amount'] ?? '',
      loanInterest: json['interest'] ?? '',
      loanTotal: json['total'] ?? '',
      loanDueDate: json['due_date'] ?? '',
      loanStatus: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      member: MemberModel.fromJson(json['member']),
      guarantors: (json['guarantors'] as List).map((e) => GuarantorModel.fromJson(e)).toList(),
    );
  }
}
