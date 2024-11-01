import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/Constans.dart';

class CustomTextField extends StatelessWidget {
 const CustomTextField({super.key, required this.hint, this.maxLines = 1, this.onSaved});

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
            if(value?.isEmpty ?? true){ // if value equal null return field is required
              return 'Field is Required';
            } else{
               return null;
            }
      },
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: KprimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(KprimaryColor),
        border: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ));
}
