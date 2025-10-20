abstract class Storage {
  Future<void> init();
  Future<void> put(String key, dynamic value);
  Future<T?> get<T>(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
