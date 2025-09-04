import 'package:watch/core/entities/keyword.dart';
import 'package:watch/core/models/keyword.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keyword) {
    return KeywordEntity(name: keyword.name, id: keyword.id);
  }
}
