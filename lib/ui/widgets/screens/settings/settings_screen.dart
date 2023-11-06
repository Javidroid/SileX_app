import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/styles/theme.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return Scaffold(
          appBar: const DefaultAppBar(),
          body: Padding(
            padding: Insets.a16,
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text(
                    'settings.theme_mode'.tr(),
                    style: TextStyles.defaultStyle,
                  ),
                  onChanged: (value) => themeNotifier.mode = value,
                  value: themeNotifier.mode,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
