import 'package:flutter/material.dart';

import '../models/note.dart';

import '../services/storage_service.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/compact_note_tile.dart';

import 'editor_page.dart';
import 'notebooks_page.dart';
import 'todo_page.dart';
import 'search_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  final notesBox =
  StorageService.notesBox;

  List<Note> notes = [];

  int navIndex = 0;

  @override
  void initState() {
    super.initState();

    loadNotes();
  }

  void loadNotes() {

    final savedNotes =
    notesBox.get('notes');

    if(savedNotes != null) {

      notes =
          List.from(savedNotes).map((e) {

            return Note(

              title: e['title'],

              content: e['content'],

              date: e['date'],

              pinned:
              e['pinned'] ?? false,

              favorite:
              e['favorite'] ?? false,

              archived:
              e['archived'] ?? false,

              checklist: false,

              color: 0,

              folder: "",

              notebook:
              e['notebook']
                  ?? "Personal",
            );

          }).toList();
    }

    setState(() {});
  }

  void saveNotes() {

    notesBox.put(

      'notes',

      notes.map((note) {

        return {

          'title': note.title,

          'content': note.content,

          'date': note.date,

          'pinned': note.pinned,

          'favorite':
          note.favorite,

          'archived':
          note.archived,

          'notebook':
          note.notebook,
        };

      }).toList(),
    );
  }

  void openEditor({
    int? index,
  }) {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) {

          return EditorPage(

            note:

            index != null

                ? notes[index]

                : null,

            onSave: (

                title,

                content,

                pinned,
                ) {

              if(index != null) {

                notes[index] = Note(

                  title: title,

                  content: content,

                  date:
                  notes[index].date,

                  pinned: pinned,

                  favorite:
                  notes[index]
                      .favorite,

                  archived:
                  notes[index]
                      .archived,

                  checklist: false,

                  color: 0,

                  folder: "",

                  notebook:
                  notes[index]
                      .notebook,
                );

              } else {

                if(title.isEmpty &&
                    content.isEmpty) {
                  return;
                }

                notes.insert(

                  0,

                  Note(

                    title: title,

                    content: content,

                    date:
                    DateTime.now()
                        .toString(),

                    pinned: false,

                    favorite: false,

                    archived: false,

                    checklist: false,

                    color: 0,

                    folder: "",

                    notebook:
                    "Personal",
                  ),
                );
              }

              saveNotes();

              setState(() {});
            },
          );
        },
      ),
    ).then((_) {

      loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {

    if(navIndex == 1) {

      return Scaffold(

        body:
        const TodoPage(),

        bottomNavigationBar:
        BottomNav(

          currentIndex: navIndex,

          onTap: (index) {

            setState(() {

              navIndex = index;
            });
          },
        ),
      );
    }

    if(navIndex == 2) {

      return Scaffold(

        body:
        const NotebooksPage(),

        bottomNavigationBar:
        BottomNav(

          currentIndex: navIndex,

          onTap: (index) {

            setState(() {

              navIndex = index;
            });
          },
        ),
      );
    }

    List<Note> pinned =

    notes.where((e) {

      return e.pinned &&
          !e.archived;

    }).toList();

    List<Note> others =

    notes.where((e) {

      return !e.pinned &&
          !e.archived;

    }).toList();

    return Scaffold(

      backgroundColor:
      Colors.black,

      body: SafeArea(

        child: Column(

          children: [

            Padding(

              padding:
              const EdgeInsets.only(

                left: 24,
                right: 18,
                top: 18,
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      Column(

                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          const Text(

                            "Notes",

                            style: TextStyle(

                              fontSize: 52,

                              fontWeight:
                              FontWeight.bold,

                              letterSpacing:
                              -2,
                            ),
                          ),

                          const SizedBox(
                              height: 4),

                          Text(

                            "${notes.length} notes",

                            style: TextStyle(

                              fontSize: 19,

                              color:
                              Colors.white
                                  .withValues(
                                  alpha:
                                  0.45),
                            ),
                          ),
                        ],
                      ),

                      Row(

                        children: [

                          IconButton(

                            onPressed: () {

                              Navigator.push(

                                context,

                                MaterialPageRoute(

                                  builder: (_) {

                                    return SearchPage(

                                      notes: notes,

                                      onOpen: (note) {

                                        Navigator.pop(
                                            context);

                                        openEditor(

                                          index:
                                          notes.indexOf(
                                              note),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },

                            icon: const Icon(

                              Icons.search,

                              size: 30,
                            ),
                          ),

                          PopupMenuButton(

                            color:
                            const Color(
                                0xFF1A1A1A),

                            itemBuilder:
                                (context) {

                              return [

                                const PopupMenuItem(
                                  child: Text(
                                      "Grid View"),
                                ),

                                PopupMenuItem(

                                  onTap: () {

                                    Future.delayed(

                                      Duration.zero,

                                          () {

                                        Navigator.push(

                                          context,

                                          MaterialPageRoute(

                                            builder: (_) {

                                              return const SettingsPage();
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },

                                  child: const Text(
                                    "Settings",
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  SizedBox(

                    height: 52,

                    child: ListView(

                      scrollDirection:
                      Axis.horizontal,

                      children: [

                        topChip(
                            "All notes"),

                        topChip(
                            "Recent"),

                        topChip(
                            "Notebook"),

                        topChip(
                            "Pinned"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(

              child: ListView(

                padding:
                const EdgeInsets.symmetric(
                    horizontal: 18),

                children: [

                  if(pinned.isNotEmpty)

                    sectionTitle("Pin"),

                  ...pinned.map((note) {

                    return Padding(

                      padding:
                      const EdgeInsets.only(
                          bottom: 12),

                      child:
                      CompactNoteTile(

                        note: note,

                        onTap: () {

                          openEditor(

                            index:
                            notes.indexOf(
                                note),
                          );
                        },

                        onDelete: () {

                          setState(() {

                            notes.remove(
                                note);
                          });

                          saveNotes();
                        },

                        onPin: () {

                          setState(() {

                            note.pinned =
                            !note.pinned;
                          });

                          saveNotes();
                        },

                        onFavorite: () {

                          setState(() {

                            note.favorite =
                            !note.favorite;
                          });

                          saveNotes();
                        },

                        onArchive: () {

                          setState(() {

                            note.archived =
                            true;
                          });

                          saveNotes();
                        },
                      ),
                    );

                  }),

                  if(others.isNotEmpty)

                    sectionTitle("Other"),

                  ...others.map((note) {

                    return Padding(

                      padding:
                      const EdgeInsets.only(
                          bottom: 12),

                      child:
                      CompactNoteTile(

                        note: note,

                        onTap: () {

                          openEditor(

                            index:
                            notes.indexOf(
                                note),
                          );
                        },

                        onDelete: () {

                          setState(() {

                            notes.remove(
                                note);
                          });

                          saveNotes();
                        },

                        onPin: () {

                          setState(() {

                            note.pinned =
                            !note.pinned;
                          });

                          saveNotes();
                        },

                        onFavorite: () {

                          setState(() {

                            note.favorite =
                            !note.favorite;
                          });

                          saveNotes();
                        },

                        onArchive: () {

                          setState(() {

                            note.archived =
                            true;
                          });

                          saveNotes();
                        },
                      ),
                    );

                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton:
      FloatingActionButton(

        backgroundColor:
        Colors.amber,

        onPressed: () {

          openEditor();
        },

        child: const Icon(

          Icons.add,

          size: 34,

          color: Colors.black,
        ),
      ),

      bottomNavigationBar:
      BottomNav(

        currentIndex: navIndex,

        onTap: (index) {

          setState(() {

            navIndex = index;
          });
        },
      ),
    );
  }

  Widget sectionTitle(String text) {

    return Padding(

      padding:
      const EdgeInsets.only(

        bottom: 18,

        top: 8,
      ),

      child: Text(

        text,

        style: const TextStyle(

          fontSize: 20,

          fontWeight:
          FontWeight.bold,
        ),
      ),
    );
  }

  Widget topChip(String text) {

    return Container(

      margin:
      const EdgeInsets.only(
          right: 12),

      padding:
      const EdgeInsets.symmetric(

        horizontal: 22,

        vertical: 14,
      ),

      decoration: BoxDecoration(

        color:
        const Color(0xFF1A1A1A),

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Text(

        text,

        style: const TextStyle(

          fontSize: 16,

          fontWeight:
          FontWeight.w500,
        ),
      ),
    );
  }
}