import 'dart:async';

import 'package:flutter/material.dart';

import '../models/note.dart';

import '../widgets/editor_toolbar.dart';

class EditorPage extends StatefulWidget {

  final Note? note;

  final Function(
      String,
      String,
      bool,
      ) onSave;

  const EditorPage({

    super.key,

    required this.note,

    required this.onSave,
  });

  @override
  State<EditorPage> createState() =>
      _EditorPageState();
}

class _EditorPageState
    extends State<EditorPage> {

  late TextEditingController
  titleController;

  late TextEditingController
  contentController;

  Timer? timer;

  bool pinned = false;

  @override
  void initState() {
    super.initState();

    pinned =
        widget.note?.pinned ?? false;

    titleController =
        TextEditingController(

          text:
          widget.note?.title ?? "",
        );

    contentController =
        TextEditingController(

          text:
          widget.note?.content ?? "",
        );

    titleController.addListener(
            autoSave);

    contentController.addListener(
            autoSave);
  }

  void autoSave() {

    timer?.cancel();

    timer = Timer(

      const Duration(
          milliseconds: 700),

          () {

        widget.onSave(

          titleController.text,

          contentController.text,

          pinned,
        );
      },
    );
  }

  @override
  void dispose() {

    timer?.cancel();

    titleController.dispose();

    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.black,

      body: SafeArea(

        child: Column(

          children: [

            Padding(

              padding:
              const EdgeInsets.only(

                left: 10,
                right: 12,
                top: 8,
              ),

              child: Column(

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

                          size: 28,
                        ),
                      ),

                      const Spacer(),

                      IconButton(

                        onPressed: () {},

                        icon: const Icon(

                          Icons.undo,

                          color:
                          Colors.white38,
                        ),
                      ),

                      IconButton(

                        onPressed: () {},

                        icon: const Icon(

                          Icons.redo,

                          color:
                          Colors.white38,
                        ),
                      ),

                      PopupMenuButton(

                        color:
                        const Color(
                            0xFF1A1A1A),

                        itemBuilder:
                            (context) {

                          return [

                            PopupMenuItem(

                              onTap: () {

                                setState(() {

                                  pinned =
                                  !pinned;
                                });

                                autoSave();
                              },

                              child: Row(

                                children: [

                                  Icon(

                                    pinned

                                        ? Icons.push_pin

                                        : Icons
                                        .push_pin_outlined,
                                  ),

                                  const SizedBox(
                                      width:
                                      10),

                                  Text(

                                    pinned

                                        ? "Unpin"

                                        : "Pin",
                                  ),
                                ],
                              ),
                            ),

                            const PopupMenuItem(

                              child: Row(

                                children: [

                                  Icon(Icons
                                      .share),

                                  SizedBox(
                                      width:
                                      10),

                                  Text("Share"),
                                ],
                              ),
                            ),
                          ];
                        },
                      ),

                      TextButton(

                        onPressed: () {

                          widget.onSave(

                            titleController
                                .text,

                            contentController
                                .text,

                            pinned,
                          );

                          Navigator.pop(
                              context);
                        },

                        child: const Text(

                          "Done",

                          style: TextStyle(

                            fontSize: 18,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(

                    padding:
                    const EdgeInsets.only(
                        left: 12),

                    child: Row(

                      children: [

                        Text(

                          DateTime.now()
                              .toString()
                              .substring(
                              0,
                              16),

                          style: TextStyle(

                            color:
                            Colors.white
                                .withValues(
                                alpha:
                                0.35),

                            fontSize: 14,
                          ),
                        ),

                        Text(

                          "  |  Default notebook",

                          style: TextStyle(

                            color:
                            Colors.white
                                .withValues(
                                alpha:
                                0.35),

                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(

              child: Padding(

                padding:
                const EdgeInsets.only(

                  left: 24,
                  right: 24,
                  top: 24,
                ),

                child: Column(

                  children: [

                    TextField(

                      controller:
                      titleController,

                      style:
                      const TextStyle(

                        fontSize: 42,

                        fontWeight:
                        FontWeight.bold,

                        letterSpacing:
                        -1,
                      ),

                      decoration:
                      const InputDecoration(

                        hintText: "Title",

                        border:
                        InputBorder.none,
                      ),
                    ),

                    Expanded(

                      child: TextField(

                        controller:
                        contentController,

                        expands: true,

                        maxLines: null,

                        style:
                        const TextStyle(

                          fontSize: 20,

                          height: 1.9,
                        ),

                        decoration:
                        const InputDecoration(

                          hintText:
                          "Start writing...",

                          border:
                          InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const EditorToolbar(),
          ],
        ),
      ),
    );
  }
}