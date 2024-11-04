import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteButtomSheet extends StatefulWidget {
  const AddNoteButtomSheet({super.key});

  @override
  State<AddNoteButtomSheet> createState() => _AddNoteButtomSheetState();
}

class _AddNoteButtomSheetState extends State<AddNoteButtomSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errMessage}');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(  //  عشان اليوز يتفاعل فقط بعد فقط بعد اللودنج 
            absorbing: state is AddNoteLoading? true : false,
             child : Padding(
            padding: EdgeInsets.only(right: 16, left : 16 ,
            bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(child: AddNoteForm(),
            )
          ),
          );
      
        },
      ),
    );
  }
}
