import 'package:flutter/material.dart';

import '../models/notebook.dart';

import '../widgets/notebook_card.dart';

class NotebooksPage
    extends StatefulWidget {

  const NotebooksPage({
    super.key,
  });

  @override
  State<NotebooksPage> createState() =>
      _NotebooksPageState();
}

class _NotebooksPageState
    extends State<NotebooksPage> {

  List<Notebook> notebooks = [

    Notebook(

      name: "Personal",

      color: Colors.orange.value,

      notesCount: 12,
    ),

    Notebook(

      name: "Ideas",

      color: Colors.blue.value,

      notesCount: 8,
    ),

    Notebook(

      name: "Study",

      color: Colors.green.value,

      notesCount: 24,
    ),

    Notebook(

      name: "Projects",

      color: Colors.purple.value,

      notesCount: 5,
    ),
  ];

  void addNotebook(String name) {

    if(name.trim().isEmpty) return;

    setState(() {

      notebooks.add(

        Notebook(

          name: name,

          color: Colors
              .primaries[
          notebooks.length %
              Colors.primaries.length]
              .value,

          notesCount: 0,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

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

                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

                children: [

                  const Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                    children: [

                      Text(

                        "Notebooks",

                        style: TextStyle(

                          fontSize: 46,

                          fontWeight:
                          FontWeight.bold,

                          letterSpacing:
                          -2,
                        ),
                      ),
                    ],
                  ),

                  IconButton(

                    onPressed: () {},

                    icon: const Icon(

                      Icons.search,

                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Expanded(

                child: ListView.builder(

                  itemCount:
                  notebooks.length,

                  itemBuilder:
                      (context, index) {

                    return NotebookCard(

                      notebook:
                      notebooks[index],

                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton:
      FloatingActionButton(

        backgroundColor:
        Colors.amber,

        onPressed: () {

          TextEditingController
          controller =
          TextEditingController();

          showModalBottomSheet(

            context: context,

            backgroundColor:
            const Color(0xFF181818),

            builder: (context) {

              return Padding(

                padding:
                const EdgeInsets.all(20),

                child: Column(

                  mainAxisSize:
                  MainAxisSize.min,

                  children: [

                    const Text(

                      "New Notebook",

                      style: TextStyle(

                        fontSize: 24,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    TextField(

                      controller:
                      controller,

                      decoration:
                      InputDecoration(

                        hintText:
                        "Notebook name",

                        filled: true,

                        fillColor:
                        Colors.white10,

                        border:
                        OutlineInputBorder(

                          borderRadius:
                          BorderRadius.circular(
                              18),

                          borderSide:
                          BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    SizedBox(

                      width:
                      double.infinity,

                      child:
                      ElevatedButton(

                        style:
                        ElevatedButton
                            .styleFrom(

                          backgroundColor:
                          Colors.amber,

                          foregroundColor:
                          Colors.black,

                          padding:
                          const EdgeInsets
                              .symmetric(
                            vertical: 16,
                          ),
                        ),

                        onPressed: () {

                          addNotebook(
                              controller
                                  .text);

                          Navigator.pop(
                              context);
                        },

                        child:
                        const Text(

                          "Create Notebook",
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },

        child: const Icon(

          Icons.add,

          color: Colors.black,
        ),
      ),
    );
  }
}