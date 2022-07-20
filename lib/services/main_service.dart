import 'package:http/http.dart' as http;

class MainService {
  static httpGet(String url) async {
    Uri uri = Uri.parse(url);

    return await http.get(uri);
  }
}
