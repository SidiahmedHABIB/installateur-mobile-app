import 'package:get/get.dart';
import 'package:installateur/data/repository_imp/profile_repository_imp.dart';
import 'package:installateur/domain/repository/profile_repository.dart';
import 'package:installateur/presentation/profile/profile_view_model.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    //repo
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImp(Get.find(), Get.find(), Get.find()),
    );
    //view model
    Get.lazyPut(() => ProfileViewModel(Get.find()));
  }
}
