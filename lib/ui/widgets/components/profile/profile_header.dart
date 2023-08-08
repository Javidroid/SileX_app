import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/profile.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_number_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.prof});

  final Profile prof;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.a20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: Constants.profilePicHeroTag,
                child: NavigableProfilePic(
                  radius: MediaQuery.of(context).size.height * 0.06,
                  asset: prof.profilePic,
                ),
              ),
              ProfileNumberButton(
                value: prof.followers.length,
                text: 'profile.followers'.tr(),
              ),
              ProfileNumberButton(
                value: prof.following.length,
                text: 'profile.following'.tr(),
              ),
              ProfileNumberButton(
                value: prof.createdPlansId.length,
                text: 'profile.n_plans'.tr(),
              ),
            ],
          ),
          BoxSpacer.v8(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${prof.name} ${prof.surnames}, ${prof.age}",
                style: TextStyles.profileTitle,
              ),
              Text(
                "${prof.degree.toLowerCase().capitalize} (${prof.center})",
                style: TextStyles.defaultStyleBold,
              ),
              BoxSpacer.v8(),
              ExpandableText(
                prof.description,
                textAlign: TextAlign.justify,
                expandText: 'profile.show_more'.tr(),
                collapseText: 'profile.show_less'.tr(),
                style: TextStyles.defaultStyleLight,
                maxLines: 3,
                animation: true,
                expandOnTextTap: true,
                collapseOnTextTap: true,
                linkEllipsis: false,
                linkColor: colorScheme.primary, // todo check
              ),
            ],
          ),
          BoxSpacer.v16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('profile.interests'.tr()),
              Text('profile.achievements'.tr()),
            ],
          ),
        ],
      ),
    );
  }
}
