import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';

class CreatePlanDateAndPlace extends StatelessWidget {
  const CreatePlanDateAndPlace({
    super.key,
    required this.setTime,
    required this.setDate,
    required this.controller,
  });

  // TODO: get date and time to show as text and as initial values

  final Function(TimeOfDay) setTime;
  final Function(DateTime) setDate;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWithInfoTooltip(
            title: 'create_plan.place_and_date'.tr(),
            infoTooltip: 'create_plan.place_and_date_tooltip'.tr(),
          ),
          ElevatedButton(
            child: const Text("PICK DATE"),
            onPressed: () async {
              setDate(
                await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1), // next year
                    ) ??
                    DateTime.now(),
              );
            },
          ),
          ElevatedButton(
            child: const Text("PICK TIME"),
            onPressed: () async {
              setTime(
                await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ) ??
                    TimeOfDay.now(),
              );
            },
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'create_plan.place_textfield_label'.tr(),
              alignLabelWithHint: true,
              hintText: 'create_plan.place_textfield_hint'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
