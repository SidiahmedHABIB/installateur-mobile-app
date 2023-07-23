import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/calendar/calendar_view_model.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../drawer/drawer_widgets.dart';
import '../resources/strings_manager.dart';
import '../widgets_manager/noIntervention_data_widget.dart';
import '../main/widgets/planned_inter_cart.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/medium_text_widget.dart';

/// The hove page which hosts the calendar
class CalenderView extends StatelessWidget {
  /// Creates the home page to display teh calendar widget.
  const CalenderView({Key? key}) : super(key: key);

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
            title: MediumTextWidget(
              text: StringsManager.drawerTile5.tr,
              color: ColorManager.white,
              size: FontSize.fs20,
            ),
          ),
          backgroundColor: ColorManager.white,
          //drawer
          drawer: const MyDrawer(),
          //body
          body: GetBuilder<CalendarViewModel>(
            builder: (controller) {
              return controller.loadingPlanned == false
                  ? Column(
                      children: [
                        TableCalendar(
                          //locale: "en",
                          headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              titleTextStyle: TextStyle(
                                color: ColorManager.mainColor,
                                fontSize: FontSize.fs18,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.bold,
                              )),
                          calendarStyle: CalendarStyle(
                            cellMargin: EdgeInsets.all(AppMargin.hm5 / 2),
                          ),
                          firstDay: controller.firstDay,
                          lastDay: controller.lastDay,
                          focusedDay: controller.today,
                          rowHeight: AppSize.hs20 * 2,
                          selectedDayPredicate: (day) =>
                              isSameDay(day, controller.today),
                          availableGestures: AvailableGestures.all,
                          onDaySelected: (selectedDay, focusedDay) =>
                              controller.onDaySelected(selectedDay, focusedDay),
                        ),
                        SizedBox(height: AppPadding.hp10),
                        //Planned
                        controller.loadingPlanned == false
                            ? controller.interventionCalenderListe.isNotEmpty
                                ? Expanded(
                                    child: SizedBox(
                                      child: ListView.separated(
                                        itemCount: controller
                                            .interventionCalenderListe.length,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () => Get.toNamed(RoutesManager
                                              .getInterDetails(controller
                                                  .interventionCalenderListe[
                                                      index]
                                                  .id)),
                                          child: PlannedInterventionCart(
                                              image: controller
                                                          .interventionCalenderListe[
                                                              index]
                                                          .company!
                                                          .imageCompany ==
                                                      null
                                                  ? ""
                                                  : controller
                                                      .interventionCalenderListe[
                                                          index]
                                                      .company!
                                                      .imageCompany!
                                                      .name
                                                      .toString(),
                                              companyName:
                                                  controller.interventionCalenderListe[index].company!.name
                                                      .toString(),
                                              location:
                                                  controller.interventionCalenderListe[index].company!.location
                                                      .toString(),
                                              phone: controller
                                                  .interventionCalenderListe[index]
                                                  .company!
                                                  .phone
                                                  .toString(),
                                              month: DateFormat.MMM().format(DateTime.parse(controller.interventionCalenderListe[index].appointmentAt.toString())),
                                              day: DateFormat.M().format(DateTime.parse(controller.interventionCalenderListe[index].appointmentAt.toString())),
                                              hour: DateFormat.Hm().format(DateTime.parse(controller.interventionCalenderListe[index].appointmentAt.toString()))),
                                        ),
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Container();
                                        },
                                      ),
                                    ),
                                  )
                                : NoInterventionDataWidget(message: StringsManager.NoIntervention.tr)
                            : LoadingWidget(size: AppSize.hs20 * 3),
                      ],
                    )
                  : Center(
                      child: LoadingWidget(size: AppSize.hs25 * 3),
                    );
            },
          )),
    );
  }
}
