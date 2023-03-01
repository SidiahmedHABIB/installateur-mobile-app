import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../../../test/test.dart';
import '../../resources/colors_manager.dart';

class FixedColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 10,
      headingRowColor: MaterialStateProperty.all(ColorManager.redColor),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: ColorManager.mainColor,
            width: AppSize.ws5 / 2,
          ),
        ),
      ),
      columns: [
        DataColumn(
          label: MediumTextWidget(
            text: "Team",
            color: ColorManager.white,
            size: FontSize.fs18,
          ),
        ),
      ],
      rows: [
        ...teamsData.map((team) => DataRow(
              cells: [
                DataCell(
                  MediumTextWidget(
                    text: '${team.position.toString()}  ${team.name}',
                    color: Colors.black,
                    size: FontSize.fs16,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
