class Constants {
  String url = 'http://192.168.100.2';
  String port = '8000';

  Constants();

  String get api => "$url:$port";
}
