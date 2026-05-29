import 'package:flutter/material.dart';

import '../models/note.dart';

import '../widgets/compact_note_tile.dart';

import 'editor_page.dart';

class NotebookNotesPage
    extends StatefulWidget {

  final String notebookName;

  final List<Note> notes;

  final Function() refresh;

  const NotebookNotesPage({

    super.key,

    required this.notebookName,

    required this.notes,

    required this.refresh,
  });

  @override
  State<NotebookNotesPage> createState() =>
      _NotebookNotesPageState();
}

class _NotebookNotesPageState
    extends State<NotebookNotesPage> {

  @override
  Widget build(BuildContext context) {

    List<Note> notebookNotes =

    widget.notes.where((note) {

      return note.notebook ==
          widget.notebookName;

    }).toList();

    return Scaffold(

      backgroundColor:
      Colors.black,

      body: SafeArea(

        child: Padding(

          padding:
          const EdgeInsets.all(22),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Row(

                children: [

                  IconButton(

                    onPressed: () {

                      Navigator.pop(
                          context);
                    },

                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),

                  const SizedBox(width: 6),

                  Expanded(

                    child: Text(

                      widget.notebookName,

                      style: const TextStyle(

                        fontSize: 40,

                        fontWeight:
                        FontWeight.bold,

                        letterSpacing:
                        -1.5,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(

                "${notebookNotes.length} notes",

                style: TextStyle(

                  color:
                  Colors.white
                      .withValues(
                      alpha: 0.45),

                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 28),

              Expanded(

                child:

                notebookNotes.isEmpty

                    ? Center(

                  child: Text(

                    "No notes in this notebook",

                    style: TextStyle(

                      color:
                      Colors.white
                          .withValues(
                          alpha:
                          0.45),

                      fontSize: 18,
                    ),
                  ),
                )

                    : ListView.builder(

                  itemCount:
                  notebookNotes.length,

                  itemBuilder:
                      (context, index) {

                    final note =
                    notebookNotes[index];

                    return Padding(

                      padding:
                      const EdgeInsets.only(
                          bottom: 12),

                      child:
                      CompactNoteTile(

                        note: note,

                        onTap: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) {

                                return EditorPage(

                                  note: note,

                                  onSave: (
                                      title,
                                      content,
                                      pinned,
                                      ) {},
                                );
                              },
                            ),
                          ).then((_) {

                            setState(() {});

                            widget.refresh();
                          });
                        },

                        onDelete: () {

                          setState(() {

                            widget.notes
                                .remove(
                                note);
                          });

                          widget.refresh();
                        },

                        onPin: () {

                          setState(() {

                            note.pinned =
                            !note.pinned;
                          });

                          widget.refresh();
                        },

                        onFavorite: () {

                          setState(() {

                            note.favorite =
                            !note.favorite;
                          });

                          widget.refresh();
                        },

                        onArchive: () {

                          setState(() {

                            note.archived =
                            true;
                          });

                          widget.refresh();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}