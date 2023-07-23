import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/notices/notice_view_model.dart';
import 'package:installateur/presentation/notices/widgets/notice_row.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/medium_text_widget.dart';

// ignore: must_be_immutable
class NoticesView extends StatelessWidget {
  int companyId;
  NoticesView({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    NoticeViewModel viewModel = Get.find<NoticeViewModel>();
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
            text: StringsManager.noticesTitle.tr,
            color: ColorManager.white,
            size: FontSize.fs20,
          ),
        ),

        //body
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.ws20),
          child: Column(children: [
            SizedBox(height: AppSize.hs25),
            // search
            TextFieldWidget(
              textController: viewModel.searchController,
              hintText: StringsManager.noticesSearchHintText.tr,
              icon: CupertinoIcons.search,
            ),
            SizedBox(height: AppSize.hs10),
            //indicator
            GetBuilder<NoticeViewModel>(builder: (controller) {
              return controller.loadingNotice == true
                  ? LinearProgressIndicator(
                      backgroundColor: ColorManager.mainColor,
                      valueColor:
                          const AlwaysStoppedAnimation(ColorManager.grey),
                      minHeight: AppSize.hs12,
                    )
                  : Container();
            }),
            SizedBox(height: AppSize.hs10),

            //lister of notices
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => viewModel.handleRefreshPage(),
                child: GetBuilder<NoticeViewModel>(
                  builder: (controller) {
                    return controller.loadingPage != true
                        ? ListView.separated(
                            itemCount: controller.noticeList.length,
                            itemBuilder: (context, index) {
                              return NoticeRow(
                                name: "Notice ${index + 1}",
                                downLoadNotice: () => controller.openNotice(
                                    controller.noticeList[index].name
                                        .toString()),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: AppSize.hs10);
                            },
                          )
                        : LoadingWidget(size: AppSize.hs25 * 3);
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
