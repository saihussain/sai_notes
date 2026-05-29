import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoTile
    extends StatelessWidget {

  final Todo todo;

  final VoidCallback onToggle;

  const TodoTile({

    super.key,

    required this.todo,

    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin:
      const EdgeInsets.only(
          bottom: 14),

      padding:
      const EdgeInsets.symmetric(

        horizontal: 18,

        vertical: 16,
      ),

      decoration: BoxDecoration(

        color:
        const Color(0xFF181818),

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Row(

        children: [

          GestureDetector(

            onTap: onToggle,

            child: AnimatedContainer(

              duration:
              const Duration(
                  milliseconds: 200),

              width: 26,
              height: 26,

              decoration: BoxDecoration(

                color:
                todo.completed

                    ? Colors.amber

                    : Colors.transparent,

                borderRadius:
                BorderRadius.circular(
                    10),

                border: Border.all(

                  color:

                  todo.completed

                      ? Colors.amber

                      : Colors.white38,

                  width: 2,
                ),
              ),

              child:
              todo.completed

                  ? const Icon(

                Icons.check,

                size: 18,

                color: Colors.black,
              )

                  : null,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(

            child: Text(

              todo.title,

              style: TextStyle(

                fontSize: 18,

                decoration:
                todo.completed

                    ? TextDecoration
                    .lineThrough

                    : null,

                color:
                todo.completed

                    ? Colors.white38

                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}