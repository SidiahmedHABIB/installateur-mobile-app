import 'package:get/get.dart';
import 'package:installateur/data/repository_imp/box_repository_imp.dart';
import 'package:installateur/domain/repository/box_repository.dart';
import 'package:installateur/presentation/box_table/box_table_view_model.dart';

class BoxTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoxRepository>(
      () => BoxRepositoryImp(Get.find(), Get.find()),
    );
    Get.lazyPut(() => BoxTableViewModel(Get.find()));
  }
}
