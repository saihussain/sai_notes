import 'package:flutter/material.dart';

import '../widgets/settings_tile.dart';

class SettingsPage
    extends StatefulWidget {

  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {

  bool darkMode = true;

  bool amoled = true;

  bool gridView = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.black,

      body: SafeArea(

        child: Padding(

          padding:
          const EdgeInsets.all(22),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Row(

                children: [

                  IconButton(

                    onPressed: () {

                      Navigator.pop(
                          context);
                    },

                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),

                  const SizedBox(width: 4),

                  const Text(

                    "Settings",

                    style: TextStyle(

                      fontSize: 42,

                      fontWeight:
                      FontWeight.bold,

                      letterSpacing:
                      -1.5,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Expanded(

                child: ListView(

                  children: [

                    SettingsTile(

                      icon:
                      Icons.palette_outlined,

                      title: "Theme",

                      subtitle:
                      darkMode

                          ? "Dark mode"

                          : "Light mode",

                      onTap: () {

                        setState(() {

                          darkMode =
                          !darkMode;
                        });
                      },
                    ),

                    SettingsTile(

                      icon:
                      Icons.dark_mode_outlined,

                      title:
                      "AMOLED Mode",

                      subtitle:
                      amoled

                          ? "Enabled"

                          : "Disabled",

                      onTap: () {

                        setState(() {

                          amoled =
                          !amoled;
                        });
                      },
                    ),

                    SettingsTile(

                      icon:
                      Icons.grid_view_rounded,

                      title:
                      "Grid View",

                      subtitle:
                      gridView

                          ? "Enabled"

                          : "Disabled",

                      onTap: () {

                        setState(() {

                          gridView =
                          !gridView;
                        });
                      },
                    ),

                    SettingsTile(

                      icon:
                      Icons.backup_outlined,

                      title:
                      "Backup Notes",

                      subtitle:
                      "Export your notes",

                      onTap: () {},
                    ),

                    SettingsTile(

                      icon:
                      Icons.restore,

                      title:
                      "Restore Backup",

                      subtitle:
                      "Import notes",

                      onTap: () {},
                    ),

                    SettingsTile(

                      icon:
                      Icons.lock_outline,

                      title:
                      "App Lock",

                      subtitle:
                      "Protect your notes",

                      onTap: () {},
                    ),

                    SettingsTile(

                      icon:
                      Icons.text_fields,

                      title:
                      "Font Size",

                      subtitle:
                      "Medium",

                      onTap: () {},
                    ),

                    SettingsTile(

                      icon:
                      Icons.info_outline,

                      title:
                      "About App",

                      subtitle:
                      "Sai Notes v1",

                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
