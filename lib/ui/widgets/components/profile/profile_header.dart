import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_number_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

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
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.06,
                foregroundImage:
                    const AssetImage('assets/images/SilenTheKid.jpg'),
              ),
              ProfileNumberButton(value: 32, text: 'profile.followers'.tr()),
              ProfileNumberButton(value: 23, text: 'profile.following'.tr()),
              ProfileNumberButton(value: 12, text: 'profile.n_plans'.tr()),
            ],
          ),
          BoxSpacer.v8(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${'lorem.name'.tr()}, ${'lorem.age'.tr()}",
                style: TextStyles.profileTitle,
              ),
              Text(
                "${'lorem.degree'.tr()} (${'lorem.center'.tr()})",
                style: TextStyles.defaultStyleBold,
              ),
              ExpandableText(
                'lorem.description'.tr(),
                textAlign: TextAlign.justify,
                expandText: 'profile.show_more'.tr(),
                collapseText: 'profile.show_less'.tr(),
                style: TextStyles.defaultStyleLight,
                maxLines: 3,
                animation: true,
                expandOnTextTap: true,
                collapseOnTextTap: true,
                linkEllipsis: false,
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
