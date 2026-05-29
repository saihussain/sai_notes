import 'package:flutter/material.dart';

import '../models/notebook.dart';

class NotebookCard
    extends StatelessWidget {

  final Notebook notebook;

  final VoidCallback onTap;

  const NotebookCard({

    super.key,

    required this.notebook,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin:
        const EdgeInsets.only(
            bottom: 16),

        padding:
        const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color:
          const Color(0xFF181818),

          borderRadius:
          BorderRadius.circular(28),
        ),

        child: Row(

          children: [

            Container(

              width: 58,
              height: 58,

              decoration: BoxDecoration(

                color:
                Color(notebook.color),

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: const Icon(

                Icons.menu_book_rounded,

                color: Colors.white,

                size: 30,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [

                  Text(

                    notebook.name,

                    style:
                    const TextStyle(

                      fontSize: 22,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(

                    "${notebook.notesCount} notes",

                    style: TextStyle(

                      color:
                      Colors.white
                          .withValues(
                          alpha: 0.5),

                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            Icon(

              Icons.arrow_forward_ios,

              size: 18,

              color:
              Colors.white
                  .withValues(
                  alpha: 0.4),
            ),
          ],
        ),
      ),
    );
  }
}