part of 'add_notes_cubit.dart';


@immutable   

abstract class AddNotesState {}

final class AddNotesInitial extends AddNotesState {}

final class AddNotesLoading extends AddNotesState {}

final class AddNotesSuccess extends AddNotesState {}

final class AddNotesFaliure extends AddNotesState {
  final String errMessage;

  AddNotesFaliure(this.errMessage);
}




