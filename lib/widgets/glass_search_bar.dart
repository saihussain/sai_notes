import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassSearchBar
    extends StatelessWidget {

  final Function(String) onChanged;

  const GlassSearchBar({

    super.key,

    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return GlassmorphicContainer(

      width: double.infinity,

      height: 58,

      borderRadius: 24,

      blur: 20,

      alignment: Alignment.center,

      border: 1,

      linearGradient:
      LinearGradient(

        colors: [

          Colors.white
              .withValues(alpha: 0.15),

          Colors.white
              .withValues(alpha: 0.05),
        ],
      ),

      borderGradient:
      LinearGradient(

        colors: [

          Colors.white24,

          Colors.white10,
        ],
      ),

      child: Padding(

        padding:
        const EdgeInsets.symmetric(
            horizontal: 16),

        child: TextField(

          onChanged: onChanged,

          decoration:
          const InputDecoration(

            hintText:
            "Search notes...",

            prefixIcon:
            Icon(Icons.search),

            border:
            InputBorder.none,
          ),
        ),
      ),
    );
  }
}