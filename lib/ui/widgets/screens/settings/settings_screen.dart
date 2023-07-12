import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(), // todo: check appbar
      body: Center(child: Text("Settings")),
    );
  }
}
