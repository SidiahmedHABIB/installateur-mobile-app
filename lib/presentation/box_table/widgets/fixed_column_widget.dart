import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/presentation/box_table/widgets/dialog_inter_type.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import '../../resources/colors_manager.dart';
import '../box_table_view_model.dart';

class FixedColumnWidget extends StatelessWidget {
  final List<BoxModel> listBoxes;

  const FixedColumnWidget({super.key, required this.listBoxes});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoxTableViewModel>(
      builder: (controller) {
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
            ...listBoxes.asMap().entries.map((box) => DataRow(
                  cells: [
                    DataCell(
                      onTap: () => dialogBoxIntervention(
                        context: context,
                        boxName: box.value.name,
                        boxEntity: box.value.entity,
                        boxStatus: box.value.status,
                        insall: () => Get.toNamed(
                            RoutesManager.getBoxDetails(box.value.id)),
                        deInsall: () => Get.toNamed(
                            RoutesManager.getBoxDetails(box.value.id)),
                        depanner: () => Get.toNamed(
                            RoutesManager.getBoxDetails(box.value.id)),
                      ),
                      onLongPress: () =>
                          controller.handleActiveReportButton(box.key),
                      Row(
                        children: [
                          box.value.reportBox != null
                              ? IconWidget(
                                  icon: Icons.check_circle,
                                  iconColor: ColorManager.mainColor,
                                  size: AppSize.hs18,
                                )
                              : Container(),
                          SizedBox(width: AppSize.ws5),
                          MediumTextWidget(
                            text: box.value.name,
                            color: Colors.black,
                            size: FontSize.fs16,
                            fontWeight: FontWeightManager.medium,
                          ),
                          SizedBox(width: AppSize.ws5),
                          box.value.status == AppConstants.NOTINSTALLED
                              ? IconWidget(
                                  icon: Icons.star,
                                  iconColor: ColorManager.redColor,
                                  size: AppSize.hs18,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        );
      },
    );
  }
}
