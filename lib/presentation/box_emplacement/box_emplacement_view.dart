import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/presentation/box_emplacement/box_emplacement_view_model.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:installateur/presentation/widgets_manager/show_alert_dialog.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/image_dialog_source_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import 'widgets/image_file_widget.dart';
import 'widgets/image_network_widget.dart';

class BoxEmplacementView extends StatelessWidget {
  int boxId;
  BoxEmplacementView({super.key, required this.boxId});

  @override
  Widget build(BuildContext context) {
    Get.find<BoxEmplacementViewModel>().handleGetBoxImages(boxId);
    BoxEmplacementViewModel viewModel = Get.find<BoxEmplacementViewModel>();

    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.white,
          // header
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
              text: StringsManager.boxEmplacementTitle.tr,
              color: ColorManager.white,
              size: FontSize.fs20,
            ),
          ),

          //boby
          body: GetBuilder<BoxEmplacementViewModel>(
            builder: (controller) {
              return controller.loadingPage == false
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSize.hs18),
                          //box location view
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.wp20),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: AppPadding.hp12),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: AppPadding.hp14 * 2,
                                      bottom: AppPadding.hp16 * 2,
                                      left: AppPadding.wp25,
                                      right: AppPadding.wp25,
                                    ),
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorManager.whiteGrey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // title
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            BigTextWidget(
                                              text: StringsManager
                                                  .boxEmplacementBoxTitle.tr,
                                              color: ColorManager.mainColor,
                                              size: FontSize.fs20,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: AppSize.hs16),

                                        Column(
                                          children: [
                                            // side truck image
                                            Stack(
                                              children: [
                                                Container(
                                                  width: double.maxFinite,
                                                  color: ColorManager.whiteGrey,
                                                  child: Image.asset(
                                                      AssetsManager.truckTop,
                                                      fit: BoxFit.cover),
                                                ),
                                                // top red index
                                                Positioned(
                                                  top: 0,
                                                  left: AppSize.ws25 * 2.7,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                AppPadding.hp5 /
                                                                    3,
                                                            horizontal:
                                                                AppPadding
                                                                    .wp16),
                                                    color:
                                                        ColorManager.redColor,
                                                    child: Column(
                                                      children: [
                                                        IconWidget(
                                                          icon: Icons.circle,
                                                          size:
                                                              AppSize.hs14 * 2,
                                                        ),
                                                        IconWidget(
                                                          icon: CupertinoIcons
                                                              .arrowtriangle_down_fill,
                                                          size: AppSize.hs16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // bottom red index
                                                Positioned(
                                                  bottom: 0,
                                                  left: AppSize.ws25 * 2.7,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                AppPadding.hp5 /
                                                                    3,
                                                            horizontal:
                                                                AppPadding
                                                                    .wp16),
                                                    color:
                                                        ColorManager.redColor,
                                                    child: Column(
                                                      children: [
                                                        IconWidget(
                                                          icon: CupertinoIcons
                                                              .arrowtriangle_up_fill,
                                                          size: AppSize.hs16,
                                                        ),
                                                        IconWidget(
                                                          icon: Icons.circle,
                                                          size:
                                                              AppSize.hs14 * 2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                            // black horizontal line
                                            Container(
                                              width: double.maxFinite,
                                              height: 2,
                                              color: Colors.black,
                                            ),

                                            // side truck image
                                            Container(
                                              width: double.maxFinite,
                                              color: ColorManager.whiteGrey,
                                              child: Image.asset(
                                                  AssetsManager.truckSide,
                                                  fit: BoxFit.cover),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: AppMargin.wm5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: Colors.white,
                                  child: MediumTextWidget(
                                    text: StringsManager.boxEmplacementBox.tr,
                                    color: ColorManager.redColor,
                                    size: FontSize.fs18,
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: AppSize.hs25),
                          // add photos

                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.wp20),
                            child: Column(
                              children: [
                                MediumTextWidget(
                                  text:
                                      StringsManager.boxEmplacementAddImages.tr,
                                  color: ColorManager.mainColor,
                                  size: FontSize.fs20,
                                ),
                                SizedBox(height: AppSize.hs14),
                                GestureDetector(
                                  onTap: () => controller.boxImages!.isEmpty
                                      ? controller.imagePiked.length == 2
                                          ? ShowAlertDialog(
                                              context: context,
                                              text: "Cann't add more thanks")
                                          : imageDialogSourceWidget(
                                              context: context,
                                              gallery: () =>
                                                  controller.handlePickImage(
                                                      context,
                                                      ImageSource.gallery),
                                              camera: () =>
                                                  controller.handlePickImage(
                                                      context,
                                                      ImageSource.camera),
                                            )
                                      : {},
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(AppSize.hs5),
                                    dashPattern: [AppSize.ws8, AppSize.ws5],
                                    color: ColorManager.grey,
                                    strokeWidth: AppSize.hs5 / 2,
                                    child: Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppPadding.hp10),
                                      child: IconWidget(
                                        icon: CupertinoIcons.camera_fill,
                                        iconColor: ColorManager.mainColor,
                                        size: AppSize.hs16 * 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: AppSize.hs20),
                          // list of images
                          controller.loadingPage == false
                              ? SizedBox(
                                  height: AppSize.hs100 * 1.2,
                                  child: controller.boxImages!.isEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.imagePiked.length,
                                          itemBuilder: (context, index) =>
                                              ImageFileWidget(
                                            fileUrl: controller.imagePiked != []
                                                ? controller.imagePiked[index]
                                                : null,
                                            clear: () => controller
                                                .handleDeletePickImage(index),
                                          ),
                                        )
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.boxImages!.length,
                                          itemBuilder: (context, index) =>
                                              ImageNetworkWidget(
                                            imageUrl: controller.boxImages != []
                                                ? AppConstants.BASE_URL +
                                                    AppConstants
                                                        .DOWNLOAD_IMG_URL +
                                                    controller
                                                        .boxImages![index].name
                                                        .toString()
                                                : "",
                                          ),
                                        ),
                                )
                              : LoadingWidget(
                                  size: AppSize.hs25,
                                ),
                          SizedBox(height: AppSize.hs16),
                        ],
                      ),
                    )
                  : LoadingWidget(size: AppSize.hs25 * 3);
            },
          ),
          //footer
          bottomNavigationBar: GetBuilder<BoxEmplacementViewModel>(
            builder: (controller) {
              return controller.loadingPage == false
                  ? Container(
                      height: AppSize.hs100,
                      padding: EdgeInsets.symmetric(
                          vertical: AppPadding.hp16,
                          horizontal: AppPadding.wp20),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: AppSize.hs5,
                            color: ColorManager.whiteGrey,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: ButtonWidget(
                          onClicked: controller.imagePiked.length == 2
                              ? () => controller.handleBoxUploadImages(boxId)
                              : () {},
                          text: StringsManager.boxEmplacementBottomButton.tr,
                          hdn: controller.imagePiked.length == 2 ? false : true,
                          textSize: FontSize.fs20,
                        ),
                      ),
                    )
                  : Container(height: AppSize.hs10);
            },
          )),
    );
  }
}
