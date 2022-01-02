import 'package:movie_app_clean_architecture_mvvm/src/core/utils/constants.dart';

class ImageSizer {
  static String w200(String path) {
    return (kBaseImageUrl! + '/t/p/w200' + path);
  }
}
