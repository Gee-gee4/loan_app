class MemberModel {
  MemberModel({
    required this.idNo,
    required this.accountNumber,
    required this.phoneNumber,
    required this.memberName,
    required this.memberShares,
    required this.memberSavings,
  });
  final String idNo;
  final String accountNumber;
  final String phoneNumber;
  final String memberName;
  final int memberShares;
  final int memberSavings;

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      idNo: json['id_no'] ?? '',
      accountNumber: json['account_no'] ?? '',
      phoneNumber: json['phone_no'] ?? '',
      memberName: json['full_name'] ?? '',
      memberShares: (json['shares'] as num).toInt(),
      memberSavings: (json['savings'] as num).toInt(),
    );
  }
}
