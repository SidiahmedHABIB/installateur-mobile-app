import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';

import '../../../test.dart';
import '../../resources/fonst_manager.dart';
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
                  text: "Points",
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: "Won",
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: "Lost",
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: "Drawn",
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: "Against",
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
              DataColumn(
                label: MediumTextWidget(
                  text: "GD",
                  color: ColorManager.white,
                  size: FontSize.fs18,
                ),
              ),
            ],
            rows: [
              ...teamsData.map((team) => DataRow(
                    cells: [
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: team.points.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: team.won.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: team.lost.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: team.drawn.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: team.against.toString(),
                          color: Colors.black54,
                          size: FontSize.fs16,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )),
                      DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: MediumTextWidget(
                          text: team.gd.toString(),
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
