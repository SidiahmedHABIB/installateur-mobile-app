import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/main/home_view.dart';
import 'package:installateur/presentation/notification/widgets/card_notification.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  Widget deletBgItem() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(
        right: AppMargin.wm20,
        left: AppMargin.wm20,
        top: AppMargin.hm20,
        bottom: AppMargin.hm10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.hs14),
        color: Colors.red.shade500,
      ),
      child: IconWidget(
        icon: CupertinoIcons.delete_solid,
        iconColor: ColorManager.white,
        size: AppSize.hs25 * 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    Get.to(HomeView());
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
            text: "Notifications",
            color: ColorManager.white,
            size: FontSize.fs20,
          ),
        ),
        //backgroundColor
        backgroundColor: ColorManager.white,
        body: Container(
          child: Column(
            children: [
              //list of n otification cards
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: const Key("10"),
                      onDismissed: (direction) {
                        print(index);
                      },
                      background: deletBgItem(),
                      child: CardNotication(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
