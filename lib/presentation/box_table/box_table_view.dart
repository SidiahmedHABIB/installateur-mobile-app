import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/box_table/box_table_view_model.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import '../widgets_manager/text_cart.dart';
import 'widgets/fixed_column_widget.dart';
import 'widgets/scrollable_column_widget.dart';

// ignore: must_be_immutable
class BoxTableView extends StatelessWidget {
  int companyId;
  BoxTableView({super.key, required this.companyId});
  @override
  Widget build(BuildContext context) {
    Get.find<BoxTableViewModel>().handleGetPageBoxByCompany(companyId);
    BoxTableViewModel viewModel = Get.find<BoxTableViewModel>();

    return SafeArea(
      child: Scaffold(
        //header
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(left: AppPadding.wp20),
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          ),
          iconTheme: IconThemeData(
            color: ColorManager.white,
            size: AppSize.hs25 * 1.3,
          ),
          //header style
          backgroundColor: ColorManager.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(AppSize.hs10),
            ),
          ),
          centerTitle: true,
          title: MediumTextWidget(
            text: StringsManager.boxTableTitle.tr,
            color: ColorManager.white,
            size: FontSize.fs20,
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(RoutesManager.getNotice(companyId)),
              child: Padding(
                padding: EdgeInsets.only(right: AppPadding.wp20),
                child: IconWidget(
                  icon: CupertinoIcons.wrench_fill,
                  size: AppSize.hs25 * 1.3,
                ),
              ),
            ),
          ],
        ),
        //backgroundColor
        backgroundColor: ColorManager.white,
        body: Column(
          children: [
            SizedBox(height: AppSize.hs16),
            // search container
            Container(
              padding: EdgeInsets.symmetric(
                vertical: AppPadding.hp10,
                horizontal: AppPadding.wp20,
              ),
              child: TextFieldWidget(
                textController: viewModel.searchController,
                hintText: StringsManager.boxTableSearchHinttext.tr,
                icon: CupertinoIcons.search,
              ),
            ),
            SizedBox(height: AppSize.hs20),
            // list filtering box cart
            SizedBox(
              height: AppSize.hs25 * 1.5,
              child: GetBuilder<BoxTableViewModel>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.filteringStrings.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => controller
                          .handleGetPageBoxByStatusAndCompany(companyId, index),
                      child: TextCart(
                        text: controller.filteringStrings[index],
                        onClick: controller.buttonActive[index],
                        textSize: FontSize.fs18,
                        vpadding: AppSize.hs8,
                        hpadding: AppSize.ws16,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: AppSize.hs20),

            // table of boxes
            GetBuilder<BoxTableViewModel>(
              builder: (controller) {
                return controller.loadingPage != true
                    ? Expanded(
                        child: SafeArea(
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FixedColumnWidget(
                                    listBoxes: controller.listOfBoxes),
                                ScrollableColumnWidget(
                                    listBoxes: controller.listOfBoxes),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(height: AppSize.hs100),
                          LoadingWidget(size: AppSize.hs25 * 3),
                        ],
                      );
              },
            ),
          ],
        ),
        // footer
        bottomNavigationBar: GetBuilder<BoxTableViewModel>(
          builder: (controller) {
            return Container(
              height: AppSize.hs100 * 1,
              padding: EdgeInsets.symmetric(
                  vertical: AppPadding.hp16, horizontal: AppPadding.wp20),
              decoration: BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: AppSize.hs10,
                    color: ColorManager.darkGrey,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: ButtonWidget(
                  onClicked: () => controller.reportReady == true
                      ? Get.toNamed(RoutesManager.getInterRapport(
                          controller.boxReportReadyId))
                      : {},
                  text: StringsManager.boxTableBottomButton.tr,
                  hdn: controller.reportReady == true ? false : true,
                  textSize: FontSize.fs20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
