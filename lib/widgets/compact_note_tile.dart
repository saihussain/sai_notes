import 'package:flutter/material.dart';

import '../models/note.dart';

class CompactNoteTile
    extends StatelessWidget {

  final Note note;

  final VoidCallback onTap;

  final VoidCallback onDelete;

  final VoidCallback onPin;

  final VoidCallback onFavorite;

  final VoidCallback onArchive;

  const CompactNoteTile({

    super.key,

    required this.note,

    required this.onTap,

    required this.onDelete,

    required this.onPin,

    required this.onFavorite,

    required this.onArchive,
  });

  void showOptions(BuildContext context) {

    showModalBottomSheet(

      context: context,

      backgroundColor:
      const Color(0xFF181818),

      shape:
      const RoundedRectangleBorder(

        borderRadius:
        BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),

      builder: (context) {

        return Padding(

          padding:
          const EdgeInsets.all(18),

          child: Column(

            mainAxisSize:
            MainAxisSize.min,

            children: [

              Container(

                width: 50,
                height: 5,

                decoration: BoxDecoration(

                  color: Colors.white24,

                  borderRadius:
                  BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 20),

              actionTile(

                icon:
                note.pinned

                    ? Icons.push_pin

                    : Icons.push_pin_outlined,

                title:
                note.pinned

                    ? "Unpin"

                    : "Pin",

                onTap: () {

                  Navigator.pop(context);

                  onPin();
                },
              ),

              actionTile(

                icon:
                note.favorite

                    ? Icons.star

                    : Icons.star_border,

                title:
                note.favorite

                    ? "Remove Favorite"

                    : "Favorite",

                onTap: () {

                  Navigator.pop(context);

                  onFavorite();
                },
              ),

              actionTile(

                icon:
                Icons.archive_outlined,

                title: "Archive",

                onTap: () {

                  Navigator.pop(context);

                  onArchive();
                },
              ),

              actionTile(

                icon: Icons.delete,

                title: "Delete",

                color: Colors.red,

                onTap: () {

                  Navigator.pop(context);

                  onDelete();
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget actionTile({

    required IconData icon,

    required String title,

    required VoidCallback onTap,

    Color color = Colors.white,
  }) {

    return ListTile(

      dense: true,

      onTap: onTap,

      leading: Icon(

        icon,

        color: color,

        size: 22,
      ),

      title: Text(

        title,

        style: TextStyle(

          color: color,

          fontSize: 15,
        ),
      ),

      shape:
      RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      onLongPress: () {

        showOptions(context);
      },

      child: Container(

        padding:
        const EdgeInsets.symmetric(

          horizontal: 16,

          vertical: 13,
        ),

        decoration: BoxDecoration(

          color:
          const Color(0xFF181818),

          borderRadius:
          BorderRadius.circular(22),
        ),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                Expanded(

                  child: Text(

                    note.title.isEmpty

                        ? "Untitled"

                        : note.title,

                    maxLines: 1,

                    overflow:
                    TextOverflow.ellipsis,

                    style:
                    const TextStyle(

                      fontSize: 18,

                      fontWeight:
                      FontWeight.w700,

                      letterSpacing:
                      -0.3,
                    ),
                  ),
                ),

                if(note.favorite)

                  const Icon(

                    Icons.star,

                    color: Colors.amber,

                    size: 15,
                  ),
              ],
            ),

            const SizedBox(height: 5),

            Text(

              note.content,

              maxLines: 1,

              overflow:
              TextOverflow.ellipsis,

              style: TextStyle(

                fontSize: 14,

                color:
                Colors.white
                    .withValues(
                    alpha: 0.50),
              ),
            ),

            const SizedBox(height: 10),

            Row(

              children: [

                Text(

                  note.date
                      .substring(0, 10),

                  style: TextStyle(

                    fontSize: 11,

                    color:
                    Colors.white
                        .withValues(
                        alpha: 0.30),
                  ),
                ),

                const Spacer(),

                if(note.pinned)

                  const Icon(

                    Icons.push_pin,

                    size: 14,

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