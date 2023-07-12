import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: TabBar(
        tabs: [
          Tab(
            text: "Actividades creadas",
          ),
          Tab(
            text: "Actividades apuntadas",
          ),
        ],
      ),
    );
  }
}
