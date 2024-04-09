class AppSettings {
  static final _singleton = AppSettings._internal();
  factory AppSettings() => _singleton;
  AppSettings._internal();

  static const serverAuthenticationToken = '';

  static const serverDomain = '81.163.30.36';

  static const myAppTitle = 'Aura';
}
