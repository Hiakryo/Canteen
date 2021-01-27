import 'package:flutter/material.dart';
import 'text_field_container.dart';

class BaseTextField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isPass;
  final bool isUsername;
  const BaseTextField({
    Key key,
    this.hinttext,
    this.icon,
    this.onChanged,
    this.isPass,
    this.isUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          buildUsername(),
        ],
      ),
    );
  }

  Widget buildUsername() {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        obscureText: isPass,
        decoration: InputDecoration(
            icon: Icon(icon, color: Colors.amber),
            hintText: hinttext,
            border: InputBorder.none),
        validator: (String value) {
          if (value.isEmpty) {
            return "Required";
          }
          if (hinttext == "Password") {
            if (value.length < 6) {
              return "Password cannot be less than 6";
              //validasi database
            }
            return null;
          } else if (hinttext == "Username") {
            if (value.length < 6) {
              return "Username cannot be less than 6";
              //validasi database
            }
            return null;
          } else {
            return null;
          } //LOGIN->BIKIN REGISTER_TEXT_FIELD + ARRAYLIST + UI DALAM
        },
      ),
    );
  }
}
