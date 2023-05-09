import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/domain/repository/notice_repository.dart';
import '../../data/network/failure.dart';
import '../../domain/model/notice_model.dart';
import '../report_helper/report_helper.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class NoticeViewModel extends GetxController {
  final NoticeRepository _noticeRepository;
  NoticeViewModel(this._noticeRepository);
  TextEditingController searchController = TextEditingController();
  List<NoticeModel> noticeList = [];
  bool loadingPage = false;
  bool loadingNotice = false;
  double downloadProgress = 0.0;
  @override
  void onInit() {
    super.onInit();
    handleGetPageNotice();
  }

  Future<void> handleRefreshPage() async {
    await handleGetPageNotice();
  }

  Future<void> handleGetPageNotice() async {
    loadingPage = true;
    update();
    Either<Failure, PageNotice> noticePageGet =
        await _noticeRepository.getPageNotice(0, 10);
    if (noticePageGet.isRight()) {
      noticePageGet.fold(
          (l) => null,
          (r) => {
                noticeList = r.notices!,
                update(),
                loadingPage = false,
                update(),
                print(noticeList.length),
              });
    } else {
      noticePageGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingPage = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> openNotice(String noticeName) async {
    loadingNotice = true;
    update();
    FileDownloader.downloadFile(
      // url: "https://agritrop.cirad.fr/584726/1/Rapport.pdf",
      url:
          "http://192.168.1.17:8081/notice/download/10644de2-8078-4011-b93b-3cf50265bf26.pdf",
      onProgress: (name, progress) {
        downloadProgress = progress;
        update();
      },
      onDownloadCompleted: (value) {
        loadingNotice = false;
        update();
        print('path  $value ');
        downloadProgress = 0;
        update();
        ReportHelper.openFile(value);
      },
      onDownloadError: (errorMessage) {
        loadingNotice = false;
        update();
        showSnackBarWidget("Download problem ", ColorManager.error,
            title: "Download");
      },
    );
  }
}
