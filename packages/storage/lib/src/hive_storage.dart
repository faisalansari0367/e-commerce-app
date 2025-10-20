import 'package:hive_flutter/hive_flutter.dart';
import 'storage_interface.dart';

class HiveStorage implements Storage {
  static const String _boxName = 'shopsy_box';
  Box? _box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  @override
  Future<void> put(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  @override
  Future<T?> get<T>(String key) async {
    return _box?.get(key) as T?;
  }

  @override
  Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box?.clear();
  }
}
