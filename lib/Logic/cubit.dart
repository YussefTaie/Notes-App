import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/Logic/model.dart';
import 'package:noteapp2/Logic/states.dart';
import 'package:flutter/material.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(InitNoteState());
  List<NoteModel> _userNotes = [
    NoteModel(
      id: 1,
      head: 'Artificial Intelligence',
      body: 'AI is transforming industries by automating routine tasks,',
      date: 'Today 8:30 PM',
      isbinnd: false,
      color: Color(0xff81BFDA),
    ),
    NoteModel(
      id: 1,
      head: 'The Basics of Flutter',
      body: 'Flutter, a UI toolkit from Google,',
      date: 'Today 8:30 PM',
      isbinnd: false,
      color: Color(0xffFADA7A),
    ),
    NoteModel(
        id: 1,
        head: 'Climate Change',
        body: 'Global warming, caused by greenhouse gas emissions,',
        date: 'Today 8:30 PM',
        isbinnd: false,
        color: Color(0xffA1D6CB)),
    NoteModel(
        id: 1,
        head: 'The Role of Exercise',
        body: 'Regular physical activity not only improves',
        date: 'Today 8:30 PM',
        isbinnd: false,
        color: Color(0xff543A14)),
    NoteModel(
        id: 1,
        head: 'Effective Time',
        body: 'Time management skills, like prioritizing tasks,',
        date: 'Today 8:30 PM',
        isbinnd: false,
        color: Color(0xffE195AB)),
    NoteModel(
        id: 1,
        head: 'certification',
        body: 'Call Instractor for Coplete Ditils',
        date: 'Today 8:30 PM',
        isbinnd: false,
        color: Color(0xffF29F58)),
  ];

  List<ColorsModel> _noteColor = [
    ColorsModel(colored: Color(0xff81BFDA), isselected: false),
    ColorsModel(colored: Color(0xffFADA7A), isselected: false),
    ColorsModel(colored: Color(0xffA1D6CB), isselected: false),
    ColorsModel(colored: Color(0xffA1D6CB), isselected: false),
    ColorsModel(colored: Color(0xff543A14), isselected: false),
    ColorsModel(colored: Color(0xffE195AB), isselected: false),
    ColorsModel(colored: Color(0xffF29F58), isselected: false),
  ];

  List _Colors = [
    Color(0xff81BFDA),
    Color(0xffFADA7A),
    Color(0xffA1D6CB),
    Color(0xffA1D6CB),
    Color(0xff543A14),
    Color(0xffE195AB),
    Color(0xffF29F58),
  ];
  // List<ColorsModel> colorchosed = [];

  //Geter
  List<NoteModel> get userNotes => _userNotes;
  List<ColorsModel> get noteColor => _noteColor;
  List get Colors => _Colors;

  void createNote(
      {required String head,
      required String body,
      required Color colored}) async {
    DateTime nowValue = DateTime.now();
    NoteModel newNote = NoteModel(
        id: 5,
        head: head,
        body: body,
        date: nowValue.toString(),
        isbinnd: false,
        color: await choseColor(colored));
    _userNotes.insert(0, newNote);
    emit(noteCreatedState());
  }

  void deleteNote(int index) {
    userNotes.removeAt(index);
    emit(deleteNoteState());
  }

  choseColor(Color Colored) {
    for (int i = 0; i < Colors.length; i++) {
      if (Colors[i] == Colored) {
        _noteColor[i].isselected = true;
      } else {
        _noteColor[i].isselected = false;
      }
    }
  }

  // void colorchosen({required Color color}) {
  //   ColorsModel newColor = ColorsModel(colored: color, isselected: false);
  //   _noteColor.insert(0, newColor);
  // }
}
