import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("[Username]"),
        actions: [
          ElevatedButton(
            onPressed: () {
              // todo editar perfil
            },
            child: const Text("Editar perfil"), // todo improve
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          children: const [
            ProfileHeader(),
            DefaultTabController(
                length: 2,
                child: TabBar(tabs: [
                  Tab(
                    text: "Actividades creadas",
                  ),
                  Tab(
                    text: "Actividades apuntadas",
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
