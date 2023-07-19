import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/items/faq_item.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  // TODO: get FAQ from viewmodel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'faq.title'.tr()),
      body: ListView(
        children: [
          FaqItem(
            question: 'lorem.question'.tr(),
            answer: 'lorem.answer'.tr(),
          ),
          FaqItem(
            question: 'lorem.question'.tr(),
            answer: 'lorem.answer'.tr(),
          ),
        ],
      ),
    );
  }
}
