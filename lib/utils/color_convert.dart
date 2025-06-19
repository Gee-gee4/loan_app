import 'dart:ui';

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
