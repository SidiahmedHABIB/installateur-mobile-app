import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../../../test/test.dart';
import '../../resources/colors_manager.dart';
import '../box_table_view_model.dart';

class FixedColumnWidget extends StatelessWidget {
  final List<BoxModel> listBoxes;

  const FixedColumnWidget({super.key, required this.listBoxes});

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
            text: StringsManager.boxTableColumnName.tr,
            color: ColorManager.white,
            size: FontSize.fs18,
          ),
        ),
      ],
      rows: [
        ...listBoxes.map((box) => DataRow(
              // color: MaterialStateColor.resolveWith((states) => Colors.amber),
              cells: [
                DataCell(
                  onTap: () {
                    print(box.name.toString());
                    // vm.lineTapM();
                  },
                  Row(
                    children: [
                      MediumTextWidget(
                        text: box.name.toString(),
                        color: Colors.black,
                        size: FontSize.fs16,
                        fontWeight: FontWeightManager.medium,
                      ),
                      SizedBox(width: AppSize.ws8),
                      IconWidget(
                        icon: Icons.star,
                        iconColor: ColorManager.redColor,
                        size: AppSize.hs18,
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
