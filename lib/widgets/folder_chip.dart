import 'package:flutter/material.dart';

class FolderChip extends StatelessWidget {

  final String folder;

  final bool selected;

  final VoidCallback onTap;

  const FolderChip({

    super.key,

    required this.folder,

    required this.selected,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: AnimatedContainer(

        duration:
        const Duration(
            milliseconds: 250),

        margin:
        const EdgeInsets.only(
            right: 10),

        padding:
        const EdgeInsets.symmetric(

          horizontal: 16,

          vertical: 7,
        ),

        decoration: BoxDecoration(

          color: selected

              ? Colors.white

              : Colors.white
              .withValues(alpha: 0.08),

          borderRadius:
          BorderRadius.circular(18),
        ),

        child: Text(

          folder,

          style: TextStyle(

            color: selected

                ? Colors.black

                : Colors.white,

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}