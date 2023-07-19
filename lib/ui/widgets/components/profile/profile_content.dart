import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        tabs: [
          Tab(
            text: 'profile.created_plans'.tr(),
          ),
          Tab(
            text: 'profile.joined_plans'.tr(),
          ),
        ],
      ),
    );
  }
}
