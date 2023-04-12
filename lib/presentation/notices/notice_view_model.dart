import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/repository/notice_repository.dart';
import '../../data/network/failure.dart';
import '../../domain/model/notice_model.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class NoticeViewModel extends GetxController {
  final NoticeRepository _noticeRepository;
  NoticeViewModel(this._noticeRepository);
  TextEditingController searchController = TextEditingController();
  List<NoticeModel> noticeList = [];
  bool loadingPage = false;
  bool downloadLoading = false;
  double downloadProgress = 0;
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
}
