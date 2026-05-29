import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteCard extends StatelessWidget {

  final Note note;

  final VoidCallback onTap;

  const NoteCard({

    super.key,

    required this.note,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin:
        const EdgeInsets.only(
          bottom: 14,
        ),

        padding:
        const EdgeInsets.all(18),

        decoration: BoxDecoration(

          color:
          const Color(0xFF1A1A1A),

          borderRadius:
          BorderRadius.circular(24),
        ),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Text(

              note.title.isEmpty

                  ? "Untitled"

                  : note.title,

              maxLines: 1,

              overflow:
              TextOverflow.ellipsis,

              style: const TextStyle(

                fontSize: 22,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(

              note.content,

              maxLines: 2,

              overflow:
              TextOverflow.ellipsis,

              style: TextStyle(

                color:
                Colors.white
                    .withValues(
                    alpha: 0.7),

                fontSize: 15,

                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            Row(

              children: [

                Text(

                  note.date.substring(0, 10),

                  style: TextStyle(

                    color:
                    Colors.white
                        .withValues(
                        alpha: 0.5),

                    fontSize: 13,
                  ),
                ),

                const Spacer(),

                if(note.pinned)

                  const Icon(

                    Icons.push_pin,

                    size: 18,

                    color: Colors.amber,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}