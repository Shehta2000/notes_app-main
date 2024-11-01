import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/cubit/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/widgets/Constans.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider(create:(context) => AddNotesCubit()),

      ],
      
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ), // Theme Of App .
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      ),
    );
  }
}
