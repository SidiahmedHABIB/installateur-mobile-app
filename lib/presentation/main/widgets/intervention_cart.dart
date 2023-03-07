import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/big_text_widget.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

class InterventionCart extends StatelessWidget {
  const InterventionCart({super.key});

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
                      CircleAvatar(
                        backgroundColor: ColorManager.mainColor,
                        radius: AppSize.hs25,
                        child: IconWidget(
                          icon: CupertinoIcons.building_2_fill,
                          iconColor: ColorManager.white,
                          size: AppSize.hs25,
                        ),
                      ),
                      SizedBox(width: AppSize.ws14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MediumTextWidget(
                            text: "Enterprise X",
                            color: ColorManager.mainColor,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                          SizedBox(height: AppSize.hs8),
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
                                text: "Address",
                                color: ColorManager.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.hs8),
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
                                text: "22234136507",
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
                          text: "ARV",
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
                          text: "18",
                          color: ColorManager.mainColor,
                          size: FontSize.fs12,
                        )),
                      ),
                      SizedBox(height: AppSize.hs5),
                      BigTextWidget(
                        text: "10:00",
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
            // padding: EdgeInsets.symmetric(horizontal: AppPadding.wp5),
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
