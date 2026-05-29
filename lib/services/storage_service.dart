import 'package:hive_flutter/hive_flutter.dart';

class StorageService {

  static final notesBox =
  Hive.box('notesBox');

  static final foldersBox =
  Hive.box('foldersBox');
}