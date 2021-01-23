import 'package:flutter/material.dart';
import 'text_field_container.dart';

class BaseTextField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isPass;
  const BaseTextField({
    Key key,
    this.hinttext,
    this.icon,
    this.onChanged,
    this.isPass,
  }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        obscureText: isPass,
        decoration: InputDecoration(
            icon: Icon(
                icon,
                color: Colors.amber
            ),
            hintText: hinttext,
            border: InputBorder.none
        ) ,
        validator: (String value){
          if(value.isEmpty){
            return "Required";
          }
          else{
            return null;
          }
        },
      ),
    );
  }

  // Widget buildUsername() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       icon: Icon(icon, color: Colors.amber),
  //       hintText: hinttext,
  //       border: InputBorder.none,
  //     ),
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return "Required";
  //       } else {
  //         return null;
  //       }
  //     },
  //   );
  // }