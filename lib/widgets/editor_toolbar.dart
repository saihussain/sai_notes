import 'package:flutter/material.dart';

class EditorToolbar
    extends StatelessWidget {

  const EditorToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 72,

      padding:
      const EdgeInsets.symmetric(
          horizontal: 14),

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
        MainAxisAlignment.spaceAround,

        children: const [

          Icon(Icons.check_circle_outline),

          Icon(Icons.format_size),

          Icon(Icons.mic_none),

          Icon(Icons.image_outlined),

          Icon(Icons.add_circle_outline),
        ],
      ),
    );
  }
}