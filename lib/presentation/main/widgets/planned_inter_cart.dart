import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../app/app_constants.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/big_text_widget.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

class PlannedInterventionCart extends StatelessWidget {
  String companyName;
  String location;
  String phone;
  String image;
  String month;
  String day;
  String hour;

  PlannedInterventionCart({
    super.key,
    required this.companyName,
    required this.location,
    required this.phone,
    required this.image,
    required this.month,
    required this.day,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    // big container
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppMargin.wm20, vertical: AppMargin.hm10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.hs10),
          boxShadow: [
            BoxShadow(
              color: ColorManager.whiteGrey,
              blurRadius: AppSize.hs10,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: AppSize.hs100 * 1.05,
              padding: EdgeInsets.only(
                left: AppPadding.wp10,
                top: AppPadding.hp14,
                bottom: AppPadding.hp14,
                right: AppPadding.wp20,
              ),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.hs10),
                  bottomLeft: Radius.circular(AppSize.hs10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // parte 1
                  Row(
                    children: [
                      //image
                      CircleAvatar(
                        backgroundColor: ColorManager.mainColor,
                        radius: AppSize.hs25,
                        backgroundImage: image != ""
                            ? Image.network(AppConstants.BASE_URL +
                                    AppConstants.DOWNLOAD_IMG_URL +
                                    image)
                                .image
                            : const AssetImage(AssetsManager.buildingWhite),
                      ),
                      SizedBox(width: AppSize.ws14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          MediumTextWidget(
                            text: companyName,
                            color: ColorManager.mainColor,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                          SizedBox(height: AppSize.hs8),
                          //location
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              IconWidget(
                                icon: Icons.location_pin,
                                iconColor: ColorManager.grey,
                                size: AppSize.hs20,
                              ),
                              SizedBox(
                                width: AppSize.ws10,
                              ),
                              MediumTextWidget(
                                text: location,
                                color: ColorManager.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.hs8),
                          //phone
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              IconWidget(
                                icon: Icons.phone,
                                iconColor: ColorManager.grey,
                                size: AppSize.hs20,
                              ),
                              SizedBox(
                                width: AppSize.ws10,
                              ),
                              MediumTextWidget(
                                text: phone,
                                color: ColorManager.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  // parte 2
                  Column(
                    children: [
                      Container(
                        width: AppSize.ws25 * 1.8,
                        padding: EdgeInsets.symmetric(
                            vertical: AppPadding.hp5 / 1.2),
                        decoration: BoxDecoration(
                          color: ColorManager.redColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.hs5),
                            topRight: Radius.circular(AppSize.hs5),
                          ),
                        ),
                        child: Center(
                            child: MediumTextWidget(
                          text: month.toUpperCase(),
                          color: ColorManager.white,
                          size: FontSize.fs12,
                        )),
                      ),
                      Container(
                        width: AppSize.ws25 * 1.8,
                        padding: EdgeInsets.symmetric(
                            vertical: AppPadding.hp5 / 1.2),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          border: Border.all(
                              color: ColorManager.redColor,
                              width: AppSize.hs5 / 2.5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSize.hs5),
                            bottomRight: Radius.circular(AppSize.hs5),
                          ),
                        ),
                        child: Center(
                            child: BigTextWidget(
                          text: day,
                          color: ColorManager.mainColor,
                          size: FontSize.fs12,
                        )),
                      ),
                      SizedBox(height: AppSize.hs5),
                      BigTextWidget(
                        text: hour,
                        color: ColorManager.redColor,
                        size: FontSize.fs14,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.hs100 * 1.05,
            decoration: BoxDecoration(
              color: ColorManager.mainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSize.hs10),
                bottomRight: Radius.circular(AppSize.hs10),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: AppPadding.wp5 / 5),
            child: IconWidget(
              icon: CupertinoIcons.forward,
              iconColor: ColorManager.white,
            ),
          )
        ],
      ),
    );
    ;
  }
}
