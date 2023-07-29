import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:grocery/models/items_model.dart";

class CartNotifier extends StateNotifier<List<ItemsModel>> {
  CartNotifier() : super([]);
  void addItem(ItemsModel item) {
    var exItems = state.where((i) => i == item);
    if (exItems.isNotEmpty) {
      return;
    }
    state = [...state, item];
  }

  void removeItem(ItemsModel item) {
    state = state.where((cartItem) => cartItem != item).toList();
  }

  void increaseQuantity(ItemsModel item) {
    final index = state.indexWhere((cartItem) => cartItem.title == item.title);
    if (index != -1) {
      state[index].quantity++;
    }
  }

  void decreaseQuantity(ItemsModel item) {
    final index = state.indexWhere((cartItem) => cartItem.title == item.title);
    if (index != -1) {
      if (state[index].quantity > 1) {
        state[index].quantity--;
      }
    }
  }

  double updatePrice(ItemsModel item) {
    if (item.quantity > 1) {
      return double.parse(item.price) * item.quantity;
    }
    return double.parse(item.price);
  }

  double getTotalPrice() {
    return state.fold(
        0, (total, item) => total + double.parse(item.price) * item.quantity);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<ItemsModel>>(
    (ref) => CartNotifier());
