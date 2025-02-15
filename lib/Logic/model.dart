import 'package:flutter/material.dart';

class NoteModel {
  int id;
  String head;
  String body;
  String date;
  bool isbinnd;
  Color color;

  NoteModel({
    required this.id,
    required this.head,
    required this.body,
    required this.date,
    required this.isbinnd,
    required this.color
  });
}

class ColorsModel {
  Color colored;
  bool isselected;

  ColorsModel({required this.colored, required this.isselected});
}
