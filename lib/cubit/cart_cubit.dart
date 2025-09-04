import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  void addToCart(Map<String, dynamic> product) {
    final updatedCart = List<Map<String, dynamic>>.from(state);
    updatedCart.add(product);
    emit(updatedCart);
  }

  void removeFromCart(Map<String, dynamic> product) {
    final updatedCart = List<Map<String, dynamic>>.from(state);
    updatedCart.remove(product);
    emit(updatedCart);
  }

  void clearCart() {
    emit([]);
  }
}