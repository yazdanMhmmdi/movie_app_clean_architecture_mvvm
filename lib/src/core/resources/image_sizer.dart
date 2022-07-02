import '../core.dart';

class ImageSizer {
  static String w200(String path) {
    return (kBaseImageUrl! + '/t/p/w200' + path);
  }

  static String w500(String path) {
    return (kBaseImageUrl! + '/t/p/w500' + path);
  }

  static String original(String path) {
    return (kBaseImageUrl! + '/t/p/original' + path);
  }
}
