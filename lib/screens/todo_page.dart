import 'package:flutter/material.dart';

import '../models/todo.dart';

import '../widgets/todo_tile.dart';

class TodoPage
    extends StatefulWidget {

  const TodoPage({
    super.key,
  });

  @override
  State<TodoPage> createState() =>
      _TodoPageState();
}

class _TodoPageState
    extends State<TodoPage> {

  List<Todo> todos = [

    Todo(

      title:
      "Complete Flutter Notes App",

      completed: false,
    ),

    Todo(

      title:
      "Study AI & ML topics",

      completed: true,
    ),
  ];

  void addTodo(String title) {

    if(title.trim().isEmpty) return;

    setState(() {

      todos.insert(

        0,

        Todo(

          title: title,

          completed: false,
        ),
      );
    });
  }

  void toggleTodo(int index) {

    setState(() {

      todos[index].completed =
      !todos[index].completed;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Todo> pending =

    todos.where((e) =>
    !e.completed).toList();

    List<Todo> completed =

    todos.where((e) =>
    e.completed).toList();

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

                        "To-do",

                        style: TextStyle(

                          fontSize: 50,

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

                child: ListView(

                  children: [

                    sectionTitle(
                        "Pending"),

                    ...pending.map((todo) {

                      return TodoTile(

                        todo: todo,

                        onToggle: () {

                          toggleTodo(

                            todos.indexOf(
                                todo),
                          );
                        },
                      );

                    }),

                    if(completed.isNotEmpty)

                      sectionTitle(
                          "Completed"),

                    ...completed.map((todo) {

                      return TodoTile(

                        todo: todo,

                        onToggle: () {

                          toggleTodo(

                            todos.indexOf(
                                todo),
                          );
                        },
                      );

                    }),
                  ],
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

                      "New Task",

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
                        "Task name",

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

                          addTodo(
                              controller
                                  .text);

                          Navigator.pop(
                              context);
                        },

                        child:
                        const Text(
                          "Add Task",
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

  Widget sectionTitle(String text) {

    return Padding(

      padding:
      const EdgeInsets.only(

        bottom: 18,

        top: 10,
      ),

      child: Text(

        text,

        style: const TextStyle(

          fontSize: 22,

          fontWeight:
          FontWeight.bold,
        ),
      ),
    );
  }
}