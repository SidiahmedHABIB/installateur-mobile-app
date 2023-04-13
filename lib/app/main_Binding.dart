import 'package:get/get.dart';
import 'package:installateur/data/data_source/remote_data_source.dart';
import 'package:installateur/data/repository_imp/auth_repository_imp.dart';
import 'package:installateur/domain/repository/auth_repository.dart';
import 'package:installateur/presentation/splash/splash_view_model.dart';

import '../data/network/network_checker.dart';
import 'app_constants.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    //Get.lazyPut(() => LocalDataSource());

    //remote data source
    Get.lazyPut(() => RemoteDataSource(appBaseUrl: AppConstants.BASE_URL));
    //repository
    Get.lazyPut(() => NetworkChecker());
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(Get.find(), Get.find(), Get.find()),
    );
    //splash
    Get.put(SplashViewModel(Get.find()));

    // Get.put(BoxTableViewModel());
    // Get.lazyPut(() => BoxTableViewModel());
  }
}
