import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp2/Logic/cubit.dart';
import 'package:noteapp2/Logic/states.dart';
import 'package:noteapp2/Screans/add_note.dart';
import 'package:noteapp2/Shared/Theem/app_color.dart';
import 'package:noteapp2/Shared/Theem/app_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List ucdata = [
  //   {
  //     'head': 'Artificial Intelligence',
  //     'body': 'AI is transforming industries by automating routine tasks,',
  //     'Color': 0xff81BFDA,
  //     'date': 'Today 8:30 PM',
  //   },
  //   {
  //     'head': 'The Basics of Flutter',
  //     'body': 'Flutter, a UI toolkit from Google,',
  //     'Color': 0xffFADA7A,
  //     'date': 'Today 8:30 PM',
  //   },
  //   {
  //     'head': 'Climate Change',
  //     'body': 'Global warming, caused by greenhouse gas emissions,',
  //     'Color': 0xffA1D6CB,
  //     'date': 'Today 8:30 PM',
  //   },
  //   {
  //     'head': 'The Role of Exercise',
  //     'body': 'Regular physical activity not only improves',
  //     'Color': 0xff543A14,
  //     'date': 'Today 8:30 PM',
  //   },
  //   {
  //     'head': 'Effective Time ',
  //     'body': 'Time management skills, like prioritizing tasks,',
  //     'Color': 0xffE195AB,
  //     'date': 'Today 8:30 PM',
  //   },
  //   {
  //     'head': 'certification',
  //     'body': 'Call Instractor for Coplete Ditils',
  //     'Color': 0xffF29F58,
  //     'date': 'Today 8:30 PM',
  //   },
  // ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.backGroundColor,
          title: Text(
            'Notes',
            style: AppFonts.boldPrimaryGreen,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (_) => AddNote()));
                },
                child: Icon(
                  CupertinoIcons.create,
                  color: AppColors.greenColor,
                  size: 28,
                ),
              ),
            )
          ]),
      body: BlocBuilder<NotesCubit, NotesStates>(
        builder: (context, state) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 0;
                        i <
                            BlocProvider.of<NotesCubit>(context)
                                .userNotes
                                .length;
                        i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<NotesCubit>(context)
                                  .deleteNote(i);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 180,
                                width: 100,
                                color: BlocProvider.of<NotesCubit>(context)
                                            .userNotes[i]
                                            .color,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 35.0,
                                      left: 20.0,
                                      right: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        BlocProvider.of<NotesCubit>(context)
                                            .userNotes[i]
                                            .head,
                                        style: AppFonts.boldPrimaryBlack,
                                      ),
                                      Text(
                                        BlocProvider.of<NotesCubit>(context)
                                            .userNotes[i]
                                            .body,
                                        style: AppFonts.normalPrimaryblack,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 35,
                                        padding: EdgeInsets.all(6.5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 0.8,
                                            color: Color(0xff1A1A1D),
                                          ),
                                        ),
                                        child: Text(
                                          BlocProvider.of<NotesCubit>(context)
                                              .userNotes[i]
                                              .date,
                                          style: TextStyle(
                                              color: AppColors.blackColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
