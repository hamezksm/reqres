class Constants {
  String url = 'http://127.0.0.1';
  String port = '8000';

  Constants();

  String get api => "$url:$port";
}
