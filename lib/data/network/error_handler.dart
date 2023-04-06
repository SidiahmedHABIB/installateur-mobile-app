class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String SUCCESS = "success with data";
  static const String NO_CONTENT = "success with no content";
  static const String BAD_REQUEST = "failure, api rejected our request";
  static const String FORBIDDEN = "failure,  api rejected our request";
  static const String UNAUTHORISED = "failure, user is not authorised";
  static const String NOT_FOUND =
      "failure, API url is not correct and not found in api side.";
  static const String INTERNAL_SERVER_ERROR =
      "failure, a crash happened in API side.";
}
