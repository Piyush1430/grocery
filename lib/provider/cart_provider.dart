import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:grocery/models/items_model.dart";

class CartNotifier extends StateNotifier<List<ItemsModel>> {
  CartNotifier() : super([]);
  void addItem(ItemsModel item) {
    state = [...state, item];
  }

  void removeItem(ItemsModel item) {
    state = state.where((cartItem) => cartItem != item).toList();
  }

    double getTotalPrice() {
    return state.fold(0, (total, item) => total + double.parse( item.price));
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<ItemsModel>>(
    (ref) => CartNotifier());
