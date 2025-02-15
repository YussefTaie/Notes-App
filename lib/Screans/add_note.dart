// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/Logic/cubit.dart';
import 'package:noteapp2/Shared/Shared%20Widgets/input_feld.dart';
import 'package:noteapp2/Shared/Theem/app_color.dart';
import 'package:noteapp2/Shared/Theem/app_fonts.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController headController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  // Color colorController = ColorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColors.backGroundColor,
            title: Text(
              'Add Note',
              style: AppFonts.boldPrimaryGreen,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: InkWell(
                  onTap: () {
                    if (headController.text.isEmpty ||
                        bodyController.text.isEmpty) {
                      return;
                    }
                    BlocProvider.of<NotesCubit>(context).createNote(
                        head: headController.text,
                        body: bodyController.text,
                        colored:
                            BlocProvider.of<NotesCubit>(context).choseColor());
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.add,
                    color: AppColors.greenColor,
                    size: 28,
                  ),
                ),
              )
            ]),
        body: ListView(
          children: [
            Row(
              children: [
                for (int k = 0;
                    k < BlocProvider.of<NotesCubit>(context).noteColor.length;
                    k++)
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: BlocProvider.of<NotesCubit>(context)
                            .noteColor[k]
                            .colored,
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            fild(
                controller: headController,
                label: 'Head',
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done),
            SizedBox(
              height: 30,
            ),
            fild(
                controller: bodyController,
                label: 'Body',
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done),
          ],
        ));
  }
}
