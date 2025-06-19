import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loan_app/model/guarantor_model.dart';

Color hexToColor(String hex) {
  return Color(int.parse('0xFF$hex'));
}
////////////////////////////////////////////////
String getInitials(String fullName) {
  final parts = fullName.trim().split(' ');
  if (parts.length >= 2) {
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  } else if (parts.isNotEmpty) {
    return parts[0][0].toUpperCase();
  } else {
    return '';
  }
}
/////////////////////////////////////////////////
Color getLoanStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return hexToColor('bdc4d4');
    case 'approved':
    case 'paid':
      return Colors.green;
    case 'rejected':
      return Colors.red;
    default:
      return Colors.grey; // fallback just in case
  }
}
////////////////////////////////////////////////////////////////////
List<String> getGuarantorNames(List<GuarantorModel> guarantors) {
  if (guarantors.isEmpty) return ['None'];

  return guarantors.map((g) {
    final fullName = g.member?.memberName ?? '';
    final firstName = fullName.split(' ').first;
    return firstName;
  }).toList();
}


