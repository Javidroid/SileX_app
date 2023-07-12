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
              const ProfileNumberButton(value: 32, text: 'Seguidores'),
              const ProfileNumberButton(value: 23, text: 'Siguiendo'),
              const ProfileNumberButton(value: 12, text: 'Planes'),
            ],
          ),
          BoxSpacer.v8(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "nombre, edad",
                style: TextStyles.profileTitle,
              ),
              Text(
                "titulacion (centro)",
                style: TextStyles.profileSubtitle,
              ),
              ExpandableText(
                'descripcion',
                textAlign: TextAlign.justify,
                expandText: 'más',
                collapseText: '(mostrar menos)',
                maxLines: 3,
                animation: true,
                expandOnTextTap: true,
                //collapseOnTextTap: true,
                linkEllipsis: false,
              ),
            ],
          ),
          BoxSpacer.v16(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Intereses"),
              Text("Logros"),
            ],
          ),
        ],
      ),
    );
  }
}
