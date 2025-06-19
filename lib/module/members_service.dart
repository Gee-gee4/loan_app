import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loan_app/model/member_model.dart';

class MembersService {
  static const String _baseUrl = 'http://35.202.151.232:8888';

  Future<List<MemberModel>> fetchMembers() async {
    final response = await http.get(Uri.parse('$_baseUrl/members/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => MemberModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load members');
    }
  }
}
