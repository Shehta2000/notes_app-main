import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/cubit/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/Constans.dart';


class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());


addNote(NoteModel note) async{
  emit(AddNotesLoading());

try {
  var notesBox =  Hive.box(kNotesBox);
 
   await notesBox.add(note);
     emit(AddNotesSuccess());

}  catch (e) {
emit(AddNotesFaliure(e.toString())
);
}


}
}