import 'package:get/get.dart';
import 'package:installateur/presentation/installation_report/install_report_view_model.dart';

import '../../data/repository_imp/profile_repository_imp.dart';
import '../../domain/repository/profile_repository.dart';

class InstallationReportBinding extends Bindings {
  @override
  void dependencies() {
    //repo
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImp(Get.find(), Get.find(), Get.find()),
    );
    //view model
    Get.lazyPut(() => InstallationReportViewModel(Get.find(), Get.find()));
  }
}
