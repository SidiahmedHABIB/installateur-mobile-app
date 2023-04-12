import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:installateur/data/repository_imp/notice_repository_imp.dart';
import 'package:installateur/domain/repository/notice_repository.dart';
import 'package:installateur/presentation/notices/notice_view_model.dart';

class NoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeRepository>(
      () => NoticeRepositoryImp(Get.find(), Get.find()),
    );
    Get.lazyPut(() => NoticeViewModel(Get.find()));
  }
}
