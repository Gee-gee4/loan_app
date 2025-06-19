import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loan_app/model/loan_model.dart';

class LoanService {
  final String _baseLoanUrl = 'http://35.202.151.232:8888/loans/';

  Future<List<LoanModel>> fetchLoans() async {
    final response = await http.get(Uri.parse(_baseLoanUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((loanJson) => LoanModel.fromJson(loanJson)).toList();
    } else {
      throw Exception('Failed to load loans');
    }
  }
}
