class AppConstants {
  // app name
  static const String APP_NAME = "INSTALLATEUR";

  //static const String BASE_URL = "http://localhost:8081";
  // vd
  //static const String BASE_URL = "http://10.0.2.2:8081";
  //rd
  static const String BASE_URL = "http://192.168.1.15:8081";
  static const String DOWNLOAD_IMG_URL = "/image/download/";

  //user local key
  static const String USER_ID_TOKEN = "id";
  static const String USER_TOKEN = "user";

  // intervention status
  static const String TOPLAN = "TOPLAN";
  static const String PLANNED = "PLANNED";
  static const String ONHOLD = "ONHOLD";
  // box status
  static const String INSTALLED = "INSTALLED";
  static const String NOTINSTALLED = "NOTINSTALLED";

  // auth rep
  static const String POST_LOGIN_URI = "$BASE_URL/users/login/";

  // inter rep
  static const String GET_PAGE_INTER_URI = "/inter/page/";
  static const String GET_INTER_BY_ID_URI = "/inter/id/";
  static const String GET_INTER_ADD_APPMT_URI = "/inter/addAppointment/";
  // box rep
  static const String GET_PAGE_BOX_ALL_URI = "/box/pageAll/";
  static const String GET_PAGE_BOX_STATUS_URI = "/box/pageStatus/";
  static const String GET_BOX_BY_ID_URI = "/box/id/";
  static const String GET_BOX_IMAGES_URI = "/box/boxImages/";
  static const String POST_UPLOAD_BOX_IMAGES_URI =
      "$BASE_URL/box/upload-images";
  // notice rep
  static const String GET_PAGE_NOTICE_ALL_URI = "/notice/page/";
  static const String GET_DOWNLOAD_NOTICE_URI = "/notice/download/";

  // profile rep
  static const String POST_EDIT_PROFILE_URI = BASE_URL + "/users/updateProfile";
  static const String GET_USER_BY_ID_URI = "/users/id/";
}
