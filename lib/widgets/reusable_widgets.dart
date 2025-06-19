import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_app/utils/color_convert.dart';

SizedBox reusableTextField(
  String text,
  IconData? icon,
  bool showText,
  TextEditingController controller, {
  Function()? toggleOnOff,
  TextInputType? keyboardType,
}) {
  return SizedBox(
    width: 200,
    height: 60,
    child: TextField(
      controller: controller,
      obscureText: !showText,
      enableSuggestions: showText,
      //cursorColor: Colors.teal,
      style: const TextStyle(color: Colors.black),
      keyboardType:
          keyboardType ??
          (!showText
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress),
      inputFormatters:
          keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
      decoration: InputDecoration(
        hint: Text(
          'Search',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        prefixIcon: icon != null ? Icon(icon, color: Colors.black) : null,
        filled: true,
        fillColor: Colors.grey[450],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon:
            toggleOnOff == null
                ? null
                : IconButton(
                  onPressed: toggleOnOff,
                  icon: Icon(
                    showText ? Icons.visibility_off : Icons.visibility,
                    color: hexToColor('005954'),
                  ),
                ),
      ),
    ),
  );
}

//........................................................................................
Image myImages(String imageName) {
  print('Loading image: $imageName');
  return Image.asset(
    imageName,
    fit: BoxFit.fitHeight,
    height: 20,
    color: hexToColor('628ecb'),
  );
}

//........................................................................................