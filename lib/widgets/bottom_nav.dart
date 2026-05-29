import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {

  final int currentIndex;

  final Function(int) onTap;

  const BottomNav({

    super.key,

    required this.currentIndex,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 78,

      decoration: const BoxDecoration(

        color: Color(0xFF141414),

        border: Border(

          top: BorderSide(
            color: Colors.white10,
          ),
        ),
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,

        children: [

          navItem(

            icon: Icons.notes,

            label: "Notes",

            index: 0,
          ),

          navItem(

            icon:
            Icons.check_box_outlined,

            label: "To-do",

            index: 1,
          ),

          navItem(

            icon:
            Icons.menu_book_rounded,

            label: "Notebook",

            index: 2,
          ),
        ],
      ),
    );
  }

  Widget navItem({

    required IconData icon,

    required String label,

    required int index,
  }) {

    bool selected =
        currentIndex == index;

    return GestureDetector(

      onTap: () {

        onTap(index);
      },

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(

            icon,

            size: 26,

            color: selected

                ? Colors.amber

                : Colors.white54,
          ),

          const SizedBox(height: 4),

          Text(

            label,

            style: TextStyle(

              color: selected

                  ? Colors.amber

                  : Colors.white54,

              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}