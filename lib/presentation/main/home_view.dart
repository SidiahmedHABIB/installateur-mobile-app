import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/main/home_view_model.dart';
import 'package:installateur/presentation/main/widgets/intervention_cart.dart';
import 'package:installateur/presentation/main/widgets/noIntervention_data_widget.dart';
import 'package:installateur/presentation/main/widgets/planned_inter_cart.dart';
import 'package:installateur/presentation/notification/notification_view.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_cart.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import 'package:intl/intl.dart';

import '../drawer/drawer_widgets.dart';
import '../resources/strings_manager.dart';
import '../widgets_manager/loading_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          //header
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(left: AppPadding.wp20),
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.bars,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                );
              },
            ),
            iconTheme: IconThemeData(
              color: ColorManager.white,
              size: AppSize.hs25 * 1.3,
            ),
            backgroundColor: ColorManager.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppSize.hs25),
              ),
            ),
            centerTitle: true,
            //string title
            title: MediumTextWidget(
              text: StringsManager.homePageTitle.tr,
              color: ColorManager.white,
              size: FontSize.fs20,
            ),
            actions: [
              GestureDetector(
                onTap: () => Get.to(const NotificationView()),
                child: Padding(
                  padding: EdgeInsets.only(right: AppPadding.wp20),
                  child: IconWidget(
                    icon: Icons.notifications,
                    size: AppSize.hs25 * 1.3,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: ColorManager.white,
          //nav bar
          drawer: const MyDrawer(),
          //body
          body: Column(
            children: [
              SizedBox(
                height: AppSize.hs20,
              ),
              //Tab Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.ws20),
                child: TabBar(
                  indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.hs8)),
                    color: ColorManager.mainColor,
                  ),
                  tabs: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: AppSize.hs10),
                      child: MediumTextWidget(
                        text: StringsManager.homePlanificaionT1.tr,
                        size: FontSize.fs18,
                        color: ColorManager.darkGrey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: AppSize.hs10),
                      child: MediumTextWidget(
                        text: StringsManager.homePlanificaionT2.tr,
                        size: FontSize.fs18,
                        color: ColorManager.darkGrey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: AppSize.hs10),
                      child: MediumTextWidget(
                        text: StringsManager.homePlanificaionT3.tr,
                        size: FontSize.fs18,
                        color: ColorManager.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.hs10),
              //Tab Bar View
              Expanded(
                child: GetBuilder<HomeViewModel>(builder: (controller) {
                  return TabBarView(
                    children: [
                      //ToPlan
                      controller.loadingToPlan == false
                          ? controller.interventionToPlanList.isNotEmpty
                              ? SizedBox(
                                  child: RefreshIndicator(
                                    onRefresh: () async {
                                      await controller.handleRefreshData();
                                    },
                                    child: ListView.separated(
                                      itemCount: controller
                                          .interventionToPlanList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () => Get.toNamed(RoutesManager
                                            .getInterDetails(controller
                                                .interventionToPlanList[index]
                                                .id)),
                                        child: InterventionCart(
                                          image: controller
                                                      .interventionToPlanList[
                                                          index]
                                                      .company!
                                                      .imageCompany ==
                                                  null
                                              ? ""
                                              : controller
                                                  .interventionToPlanList[index]
                                                  .company!
                                                  .imageCompany!
                                                  .name
                                                  .toString(),
                                          companyName: controller
                                              .interventionToPlanList[index]
                                              .company!
                                              .name
                                              .toString(),
                                          location: controller
                                              .interventionToPlanList[index]
                                              .company!
                                              .location
                                              .toString(),
                                          phone: controller
                                              .interventionToPlanList[index]
                                              .company!
                                              .phone
                                              .toString(),
                                        ),
                                      ),
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Container();
                                      },
                                    ),
                                  ),
                                )
                              : const NoInterventionDataWidget()
                          : LoadingWidget(size: AppSize.hs20 * 3),
                      //Planned
                      controller.loadingPlanned == false
                          ? controller.interventionPlannedList.isNotEmpty
                              ? SizedBox(
                                  child: RefreshIndicator(
                                    onRefresh: () async {
                                      await controller.handleRefreshData();
                                    },
                                    child: ListView.separated(
                                      itemCount: controller
                                          .interventionPlannedList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () => Get.toNamed(RoutesManager
                                            .getInterDetails(controller
                                                .interventionPlannedList[index]
                                                .id)),
                                        child: PlannedInterventionCart(
                                            image: controller.interventionPlannedList[index].company!.imageCompany ==
                                                    null
                                                ? ""
                                                : controller
                                                    .interventionPlannedList[
                                                        index]
                                                    .company!
                                                    .imageCompany!
                                                    .name
                                                    .toString(),
                                            companyName: controller
                                                .interventionPlannedList[index]
                                                .company!
                                                .name
                                                .toString(),
                                            location: controller
                                                .interventionPlannedList[index]
                                                .company!
                                                .location
                                                .toString(),
                                            phone: controller
                                                .interventionPlannedList[index]
                                                .company!
                                                .phone
                                                .toString(),
                                            month: DateFormat.MMM().format(
                                                DateTime.parse(controller.interventionPlannedList[index].appointmentAt.toString())),
                                            day: DateFormat.M().format(DateTime.parse(controller.interventionPlannedList[index].appointmentAt.toString())),
                                            hour: DateFormat.Hm().format(DateTime.parse(controller.interventionPlannedList[index].appointmentAt.toString()))),
                                      ),
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Container();
                                      },
                                    ),
                                  ),
                                )
                              : const NoInterventionDataWidget()
                          : LoadingWidget(size: AppSize.hs20 * 3),

                      //Onhold
                      controller.loadingOnhold == false
                          ? controller.interventionOnholdList.isNotEmpty
                              ? SizedBox(
                                  child: RefreshIndicator(
                                    onRefresh: () async {
                                      await controller.handleRefreshData();
                                    },
                                    child: ListView.separated(
                                      itemCount: controller
                                          .interventionOnholdList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () => Get.toNamed(RoutesManager
                                            .getInterDetails(controller
                                                .interventionOnholdList[index]
                                                .id)),
                                        child: InterventionCart(
                                          image: controller
                                                      .interventionOnholdList[
                                                          index]
                                                      .company!
                                                      .imageCompany ==
                                                  null
                                              ? ""
                                              : controller
                                                  .interventionOnholdList[index]
                                                  .company!
                                                  .imageCompany!
                                                  .name
                                                  .toString(),
                                          companyName: controller
                                              .interventionOnholdList[index]
                                              .company!
                                              .name
                                              .toString(),
                                          location: controller
                                              .interventionOnholdList[index]
                                              .company!
                                              .location
                                              .toString(),
                                          phone: controller
                                              .interventionOnholdList[index]
                                              .company!
                                              .phone
                                              .toString(),
                                        ),
                                      ),
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Container();
                                      },
                                    ),
                                  ),
                                )
                              : const NoInterventionDataWidget()
                          : LoadingWidget(size: AppSize.hs20 * 3),
                    ],
                  );
                }),
              ),
              // Expanded(
              //   child: GetBuilder<HomeViewModel>(
              //     builder: (controller) {
              //       return ListView.separated(
              //         itemCount: controller.interventionList.length,
              //         itemBuilder: (context, index) => InterventionCart(
              //           companyName: controller
              //               .interventionList[index].company!.name
              //               .toString(),
              //           location: controller
              //               .interventionList[index].company!.location
              //               .toString(),
              //           phone: controller.interventionList[index].company!.phone
              //               .toString(),
              //         ),
              //         separatorBuilder: (BuildContext context, int index) {
              //           return Container();
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
