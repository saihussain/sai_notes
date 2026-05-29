import 'package:flutter/material.dart';

import '../models/note.dart';

class SearchNoteTile
    extends StatelessWidget {

  final Note note;

  final VoidCallback onTap;

  const SearchNoteTile({

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
            bottom: 14),

        padding:
        const EdgeInsets.all(18),

        decoration: BoxDecoration(

          color:
          const Color(0xFF181818),

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

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(

              note.content,

              maxLines: 2,

              overflow:
              TextOverflow.ellipsis,

              style: TextStyle(

                color:
                Colors.white
                    .withValues(
                    alpha: 0.55),

                fontSize: 15,
              ),
            ),

            const SizedBox(height: 12),

            Text(

              note.date
                  .substring(0, 10),

              style: TextStyle(

                color:
                Colors.white
                    .withValues(
                    alpha: 0.35),

                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}