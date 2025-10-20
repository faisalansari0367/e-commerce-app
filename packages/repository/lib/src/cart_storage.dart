import 'package:storage/storage.dart';
import 'models/cart_item.dart';

class CartStorage {
  final Storage _storage;
  static const String _cartKey = 'cart_items';

  List<CartItem>? _cache;
  bool _isInitialized = false;

  CartStorage(this._storage);

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await _loadFromStorage();
      _isInitialized = true;
    }
  }

  Future<void> _loadFromStorage() async {
    final data = await _storage.get<List>(_cartKey);
    if (data == null) {
      _cache = [];
      return;
    }

    _cache = data.map((json) {
      final map = Map<String, dynamic>.from(json);
      return CartItem.fromJson(map);
    }).toList();
  }

  Future<void> _saveToStorage() async {
    if (_cache == null) return;
    await _storage.put(_cartKey, _cache!.map((i) => i.toJson()).toList());
  }

  Future<List<CartItem>> getAll() async {
    await _ensureInitialized();
    return List.unmodifiable(_cache!);
  }

  Future<void> add(CartItem item) async {
    await _ensureInitialized();

    final existingIndex = _cache!.indexWhere((i) => i.productId == item.productId);

    if (existingIndex >= 0) {
      _cache![existingIndex] = _cache![existingIndex].copyWith(quantity: _cache![existingIndex].quantity + item.quantity);
    } else {
      _cache!.add(item);
    }

    await _saveToStorage();
  }

  Future<void> remove(String productId) async {
    await _ensureInitialized();

    _cache!.removeWhere((item) => item.productId == productId);
    await _saveToStorage();
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    await _ensureInitialized();

    final index = _cache!.indexWhere((i) => i.productId == productId);

    if (index >= 0) {
      if (quantity <= 0) {
        _cache!.removeAt(index);
      } else {
        _cache![index] = _cache![index].copyWith(quantity: quantity);
      }
      await _saveToStorage();
    }
  }

  Future<void> clear() async {
    await _ensureInitialized();

    _cache!.clear();
    await _storage.delete(_cartKey);
  }
}
