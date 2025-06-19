import 'package:loan_app/model/member_model.dart';

class GuarantorModel {
  GuarantorModel({
    required this.guarantorId,
    required this.member,
    required this.shares,
  });

  final int guarantorId;
  final MemberModel? member; // changed from int memberId
  final String shares;

  factory GuarantorModel.fromJson(Map<String, dynamic> json) {
    return GuarantorModel(
      guarantorId: (json['id'] as num?)?.toInt() ?? 0,
      member: MemberModel.fromJson(json['member']), // new line
      shares: json['shares'] ?? '',
    );
  }
}
