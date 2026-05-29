import 'package:flutter/material.dart';

import '../models/note.dart';

import '../widgets/search_note_tile.dart';

class SearchPage
    extends StatefulWidget {

  final List<Note> notes;

  final Function(Note) onOpen;

  const SearchPage({

    super.key,

    required this.notes,

    required this.onOpen,
  });

  @override
  State<SearchPage> createState() =>
      _SearchPageState();
}

class _SearchPageState
    extends State<SearchPage> {

  String search = "";

  @override
  Widget build(BuildContext context) {

    List<Note> filtered =

    widget.notes.where((note) {

      return

          note.title
              .toLowerCase()
              .contains(
              search.toLowerCase())

          ||

          note.content
              .toLowerCase()
              .contains(
              search.toLowerCase());

    }).toList();

    return Scaffold(

      backgroundColor:
      Colors.black,

      body: SafeArea(

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            children: [

              Row(

                children: [

                  Expanded(

                    child: Container(

                      height: 58,

                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 16),

                      decoration: BoxDecoration(

                        color:
                        const Color(
                            0xFF181818),

                        borderRadius:
                        BorderRadius.circular(
                            22),
                      ),

                      child: Row(

                        children: [

                          const Icon(
                            Icons.search,
                          ),

                          const SizedBox(
                              width: 12),

                          Expanded(

                            child: TextField(

                              autofocus: true,

                              onChanged: (value) {

                                setState(() {

                                  search = value;
                                });
                              },

                              decoration:
                              const InputDecoration(

                                hintText:
                                "Search notes",

                                border:
                                InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  GestureDetector(

                    onTap: () {

                      Navigator.pop(
                          context);
                    },

                    child: const Text(

                      "Cancel",

                      style: TextStyle(

                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Expanded(

                child:

                filtered.isEmpty

                    ? Center(

                  child: Text(

                    search.isEmpty

                        ? "Search your notes"

                        : "No results found",

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
                  filtered.length,

                  itemBuilder:
                      (context, index) {

                    final note =
                    filtered[index];

                    return SearchNoteTile(

                      note: note,

                      onTap: () {

                        widget.onOpen(
                            note);
                      },
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