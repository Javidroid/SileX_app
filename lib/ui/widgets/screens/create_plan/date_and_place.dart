import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';
import 'package:tfg_v2/utils/datetime_utils.dart';

class CreatePlanDateAndPlace extends StatelessWidget {
  const CreatePlanDateAndPlace({
    super.key,
    required this.setTime,
    required this.setDate,
    required this.controller,
    required this.date,
    required this.time,
  });

  // TODO: get date and time to show as text and as initial values

  final Function(TimeOfDay) setTime;
  final Function(DateTime) setDate;
  final TextEditingController controller;
  final DateTime date;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWithInfoTooltip(
            title: 'create_plan.place_and_date'.tr(),
            infoTooltip: 'create_plan.place_and_date_tooltip'.tr(),
          ),
          Padding(
            padding: Insets.h12,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'create_plan.date_text'.tr(),
                      style: TextStyles.createPlanText,
                    ),
                    TextButton(
                      child: Text(
                        DateTimeUtils.dateTimeToString(date),
                        style: TextStyles.createPlanTextButton,
                      ),
                      onPressed: () async {
                        setDate(
                          await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(
                                  DateTime.now().year + 1,
                                ), // next year
                              ) ??
                              DateTime.now(),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'create_plan.time_text'.tr(),
                      style: TextStyles.createPlanText,
                    ),
                    TextButton(
                      child: Text(
                        DateTimeUtils.timeOfDayToString(time),
                        style: TextStyles.createPlanTextButton,
                      ),
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
                  ],
                ),
              ],
            ),
          ),
          TextFormField(
            controller: controller,
            validator: (value) => (value == null) || (value.isEmpty)
                ? 'create_plan.empty_textfield'.tr()
                : null,
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
