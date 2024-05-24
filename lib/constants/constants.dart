import 'package:dio/dio.dart';
import 'package:wastely/urls/urls.dart';
import 'package:cookie_jar/cookie_jar.dart';

final dio =
    Dio(BaseOptions(baseUrl: baseUrl, validateStatus: (status) => true));

final cookieJar = CookieJar();
String profile_username = 'Wastely';

Future<void> fetchData() async {
  final cookies = await cookieJar.loadForRequest(Uri.parse(baseUrl));
  final cookie = cookies.firstWhere((cookie) => cookie.name == 'uid',
      orElse: () => null as Cookie);
  profile_username = cookie.value;
}
