import 'package:flutter/material.dart';

class SettingsTile
    extends StatelessWidget {

  final IconData icon;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const SettingsTile({

    super.key,

    required this.icon,

    required this.title,

    required this.subtitle,

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

        child: Row(

          children: [

            Container(

              width: 52,
              height: 52,

              decoration: BoxDecoration(

                color:
                Colors.white10,

                borderRadius:
                BorderRadius.circular(
                    18),
              ),

              child: Icon(
                icon,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [

                  Text(

                    title,

                    style:
                    const TextStyle(

                      fontSize: 18,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(

                    subtitle,

                    style: TextStyle(

                      color:
                      Colors.white
                          .withValues(
                          alpha: 0.45),

                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Icon(

              Icons.arrow_forward_ios,

              size: 16,

              color:
              Colors.white
                  .withValues(
                  alpha: 0.35),
            ),
          ],
        ),
      ),
    );
  }
}