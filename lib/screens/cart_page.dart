import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommere/cubit/cart_cubit.dart';
import 'package:ecommere/widgets/primary_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Color.fromRGBO(248, 55, 88, 1)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, List<Map<String, dynamic>>>(
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return const Center(
              child: Text("Your cart is empty"),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              return ListTile(
                leading: Image.network(
                  product["thumbnail"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product["title"]),
                subtitle: Text("\$${product["price"]}"),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Product removed from cart",
                          style: const TextStyle(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: PrimaryButton(
          text: "Checkout",
          onPressed: () {},
        ),
      ),
    );
  }
}