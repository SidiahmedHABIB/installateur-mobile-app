class AppConstants {
  // app name
  static const String APP_NAME = "INSTALLATEUR";

  //static const String BASE_URL = "http://localhost:8081";
  static const String BASE_URL = "http://10.0.2.2:8081";
  static const String DOWNLOAD_IMG_URL = "/image/download/";

  //user local key
  static const String USER_ID_TOKEN = "id";
  static const String USER_TOKEN = "user";

  // auth rep
  static const String POST_LOGIN_URI = "$BASE_URL/users/login/";

  // intervention status
  static const String TOPLAN = "TOPLAN";
  static const String PLANNED = "PLANNED";
  static const String ONHOLD = "ONHOLD";

  // inter rep
  static const String GET_PAGE_INTER_URI = "/inter/page/";
  static const String GET_INTER_BY_ID_URI = "/inter/id/";
  static const String GET_INTER_ADD_APPMT_URI = "/inter/addAppointment/";

  // profile rep
  static const String POST_EDIT_PROFILE_URI =
      BASE_URL + "/users/updateProfile/";
}
