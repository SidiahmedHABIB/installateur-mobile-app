import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/box_table/box_table_view.dart';
import 'package:installateur/presentation/notices/notice_view_model.dart';
import 'package:installateur/presentation/notices/widgets/notice_row.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import '../main/home_view.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/medium_text_widget.dart';

class NoticesView extends StatelessWidget {
  int companyId;
  NoticesView({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    NoticeViewModel viewModel = Get.find<NoticeViewModel>();
    return Scaffold(
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
                  Get.offNamed(RoutesManager.getBoxTable(companyId));
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
          SizedBox(height: AppSize.hs20),

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
                              downLoadNotice: () => {},
                              downloading: controller.downloadLoading,
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
    );
  }
}
