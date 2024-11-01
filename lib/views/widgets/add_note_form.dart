
import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/Custom_Button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey <FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled; // عشان لو اليوز دخل انبوط غلط
  String ? title , subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child:  Column(
        children:  [
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            onSaved: (value){
              title = value;
            },
            hint: 'Tittle',
            maxLines: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value){
                 subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
         const SizedBox(
            height: 32,
          ),
          CustomBotton(
            onTap: (){
              if(formKey.currentState!.validate() ){
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                  
                });
              }
            },
          ),
         const  SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
