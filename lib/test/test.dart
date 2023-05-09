import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/domain/model/installation_report.dart';
import 'package:installateur/presentation/report_helper/report_helper.dart';
import 'package:installateur/presentation/report_helper/report_widget.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import 'package:open_file/open_file.dart';
import 'package:web_socket_channel/io.dart';
import '../presentation/widgets_manager/icon_widget.dart';
// generate pdf
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class Test extends StatefulWidget {
  Test({
    super.key,
  });

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final channel =
      IOWebSocketChannel.connect('ws://192.168.1.17:8081/websocket');
  late StreamSubscription subscription;
  List<int> numbers = [];

  @override
  void initState() {
    super.initState();
    subscription = channel.stream.listen((message) {
      final number = int.tryParse(message);
      if (number != null) {
        setState(() {
          numbers.add(number);
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    channel.sink.close();
    super.dispose();
  }

  void sendHello() {
    channel.sink.add('/app/hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: sendHello,
            child: Text('Send Hello'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                final number = numbers[index];
                return ListTile(
                  title: Text(number.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// dialog
Future appShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0x00FFFFFF),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //background image and clear icon
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: Get.height / 1.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.hs14),
                          image: const DecorationImage(
                            image: AssetImage(AssetsManager.background),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.hs14),
                            color: ColorManager.blurMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppPadding.wp8),
                        child: IconWidget(
                          icon: Icons.clear_rounded,
                          iconColor: ColorManager.white,
                          size: AppSize.hs16 * 2,
                        ),
                      )
                    ],
                  ),
                ),
                //white container
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: AppPadding.hp25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSize.hs14),
                            bottomRight: Radius.circular(AppSize.hs14),
                            topLeft: Radius.circular(AppSize.hs25 * 2),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.wp20),
                        child: Column(
                          children: [
                            SizedBox(height: AppSize.hs25 * 2.5),
                            MediumTextWidget(
                              text: "BoiterX0 / Entité EK-345-CF",
                              color: ColorManager.mainColor,
                              size: FontSize.fs16,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: () => {},
                              text: "INSTALLER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: () => {},
                              text: "DESINSTALLER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: () => {},
                              text: "DEPPANER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                          ],
                        ),
                      ),
                    ),
                    //icons
                    Padding(
                      padding: EdgeInsets.only(right: AppPadding.wp20),
                      child: IconWidget(
                        icon: CupertinoIcons.wrench_fill,
                        bColor: ColorManager.redColor,
                        iconColor: ColorManager.white,
                        size: AppSize.hs25,
                        hp: AppPadding.hp12,
                        wp: AppPadding.wp12,
                        br: AppSize.hs25 * 2,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

// confirm dialog

// box table model
class Box {
  String name;
  String entity;
  String matricule;
  String nserie;
  Box({
    required this.name,
    required this.entity,
    required this.matricule,
    required this.nserie,
  });
}

List<Box> boxes = [
  Box(
    name: "Strada_060",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_061",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_062",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_063",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_064",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_065",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_066",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_067",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_068",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
];
