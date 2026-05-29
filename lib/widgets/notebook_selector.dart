import 'package:flutter/material.dart';

class NotebookSelector
    extends StatelessWidget {

  final String selectedNotebook;

  final Function(String)
  onSelected;

  const NotebookSelector({

    super.key,

    required this.selectedNotebook,

    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {

    List<String> notebooks = [

      "Personal",
      "Ideas",
      "Study",
      "Projects",
    ];

    return Container(

      height: 52,

      decoration: BoxDecoration(

        color:
        const Color(0xFF181818),

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: DropdownButtonHideUnderline(

        child: DropdownButton<String>(

          value: selectedNotebook,

          dropdownColor:
          const Color(0xFF181818),

          borderRadius:
          BorderRadius.circular(18),

          iconEnabledColor:
          Colors.white,

          padding:
          const EdgeInsets.symmetric(
              horizontal: 16),

          items:
          notebooks.map((name) {

            return DropdownMenuItem(

              value: name,

              child: Text(name),
            );

          }).toList(),

          onChanged: (value) {

            if(value != null) {

              onSelected(value);
            }
          },
        ),
      ),
    );
  }
}