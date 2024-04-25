import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/screen/components/utils/init.dart';

import 'init.dart';

Future<void> initServices(Interceptor createInterceptor<T>()) async {
  GetIt.I.registerSingleton<ApiServices>(
      ApiServices(_createDioWithInterceptor<ApiServices>(createInterceptor), baseUrl: BASE_API_URL, connectTimeout: TIME_OUT));
}

Dio _createDioWithInterceptor<T>(Interceptor createInterceptor<T>()){
  if(createInterceptor == null) return Dio();
  final interceptor = createInterceptor<T>();
  if(interceptor == null) return Dio();
  return Dio()..interceptors.add(interceptor);
}



Interceptor get _defaultInterceptor {

  // BuildContext context;

  return InterceptorsWrapper(
    onRequest:(RequestOptions options) async {
      print("#################################### Url: ${options?.baseUrl}${options?.path}");
      // return options;
      Map<String, String> headers = new Map();
      headers['content-type'] = 'application/json';
      await SharePreferUtils.getAccessToken().then((String token) async => {
        if (token != null)
          {
            await SharePreferUtils.getUserInfo().then((value) => {
              headers['Authorization'] =
              '${Utils.getCurrentTimeStringRequest()}|${value.userId}|${value.corpId}|${Constants.VI}|X-AUTH-TOKEN $token'
            })
          }
      });
      options.headers = headers;
      print("#################################### headers: $headers");
      print("#################################### request: ${options.data}");
      return options;
    },
    onResponse:(Response response) async {
      print("#################################### response: [${response?.statusCode}] >> ${response?.data}");
      if(response?.data == "ERROR500"){
        print("=======vao day");
        Toast.showLongTop("Có lỗi hệ thống");
      }
      if(response?.data["responseCode"] == "SECT01"){
        Toast.showLongTop(response?.data["message"]);
        // SharePreferUtils.logOutApp();
        // Phoenix.rebirth(context);
      }
      // Do something with response data
      return response; // continue
    },
    onError: (DioError error) async {
      print("#################################### error: [${error?.response?.statusCode}] >> ${error?.response?.data}");
      print("#################################### error: [${error?.response}");

      if (error?.response == null) {
        Toast.showLongTop("Không có kết nối mạng");

      } else if(error?.response?.statusCode == 401){
        // await clearUserToken();
      }else if(error?.response?.statusCode == 500){
        Toast.showLongTop("Có lỗi hệ thống, bạn quay lại sau");
      }else{
        Toast.showLongTop("Có lỗi hệ thống, bạn quay lại sau");
      }
      final data = error?.response?.data;
      String message;
      if(data != null){
        message = data["message"];
      }

      if(message?.isNotEmpty != true){
        // message = ErrorCodes.fromHttpStatusCode(error?.response?.statusCode);
      }

      print("message: $message");
      // GetIt.I<AppModel>().setError(error: ErrorConfig.mapError[message] ?? message, source: "${error?.request?.baseUrl}${error?.request?.path}");

      return error;
    },
  );
}


Interceptor createInterceptor<T>(){
  if(T == ApiServices) return _defaultInterceptor;
  return null;
}


