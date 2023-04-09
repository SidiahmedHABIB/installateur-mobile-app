import 'package:get/get.dart';
import 'package:installateur/data/repository_imp/inter_repository_imp.dart';
import 'package:installateur/domain/repository/inter_repository.dart';
import 'package:installateur/presentation/drawer/drawer_view_model.dart';
import 'package:installateur/presentation/main/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrawerViewModel(Get.find()));
    Get.lazyPut<InterventionRepository>(
      () => InterventionRepositoryImp(Get.find(), Get.find(), Get.find()),
    );
    Get.lazyPut(() => HomeViewModel(Get.find()));
  }
}
