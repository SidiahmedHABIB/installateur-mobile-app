class AppConstants {
  // app name
  static const String APP_NAME = "INSTALLATEUR";

  //static const String BASE_URL = "http://localhost:8081";
  static const String BASE_URL = "http://10.0.2.2:8081";
  static const String DOWNLOAD_IMG_URL = "/image/download/";

  //user local key
  static const String USER_TOKEN = "user";

  // auth rep
  static const String LOGIN_URI = "$BASE_URL/users/login/";

  // inter rep
  static const String GET_PAGE_INTER_URI = "/inter/page/";

  // profile rep
  static const String EDIT_PROFILE_URI = BASE_URL + "/users/updateProfile/";
}
