import 'package:cric_addict/utils/constants.dart';
import 'package:flutter/material.dart';

Container inputFields(String initValue, Icon widget, bool password) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: secondaryText,
      borderRadius: BorderRadius.circular(18.0),
    ),
    child: TextFormField(
      obscureText: password ? true : false,
      cursorColor: textWhite,
      style: TextStyle(
        color: textWhite,
      ),
      initialValue: initValue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(18.0),
        ),
        // errorText: 'Invalid Email',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xff594c65),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        prefixIcon: widget,
      ),
    ),
  );
}
