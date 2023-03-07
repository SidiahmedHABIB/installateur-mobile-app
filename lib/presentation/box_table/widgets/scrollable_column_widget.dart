import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import '../../../test/test.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/medium_text_widget.dart';

class ScrollableColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            headingRowColor:
                MaterialStateProperty.all(Color.fromARGB(255, 195, 113, 122)),
            columnSpacing: 40,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
            columns: [
              DataColumn(
                label: MediumTextWidget(
                  text: StringsManager.boxTableColumnEnitie.tr,
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: StringsManager.boxTableColumnMatricul.tr,
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: StringsManager.boxTableColumnNserie.tr,
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
            ],
            rows: [
              ...boxes.map((box) => DataRow(
                    cells: [
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: box.entity.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: box.matricule.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: box.nserie.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                    ],
                  ))
            ]),
      ),
    );
  }
}
