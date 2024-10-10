import 'dart:async';
import 'dart:math';

import 'package:card_custom/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context) => ProductBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List Builder Bloc"),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                bloc.add(r.nextInt(4) + 2);
              },
              child: const Text("Add Card"),
            ),
            BlocBuilder<ProductBloc, List<Product>>(
              builder: (context, products) => Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        imageUrl: products[index].imageUrl,
                        name: products[index].name,
                        price: products[index].price,
                        onIncTap: () {},
                        onDecTap: () {},
                        onAddCartTap: () {});
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  String imageUrl;
  String name;
  String price;

  Product({required this.imageUrl, required this.name, required this.price});
}

class ProductBloc extends Bloc<int, List<Product>> {
  ProductBloc() : super([]) {
    // Tambahkan 2-3 produk awal saat BLoC diinisialisasi
    List<Product> initialProducts = [
      Product(
        imageUrl: "images/sorabi.jpg",
        name: "Pocari Sweet 1",
        price: "Rp8.000",
      ),
      Product(
        imageUrl: "images/sorabi.jpg",
        name: "Pocari Sweet 2",
        price: "Rp8.000",
      ),
    ];

    // Emit produk awal
    emit(initialProducts);

    // Event handler untuk menambah produk baru
    on<int>((event, emit) {
      List<Product> updatedProducts = List.from(state);

      // Tambahkan produk baru ke list berdasarkan event (jumlah produk baru)
      for (int i = 0; i <= event; i++) {
        updatedProducts.add(Product(
          imageUrl: "images/sorabi.jpg",
          name: "Pocari Sweet $i",
          price: "Rp8.000",
        ));
      }

      // Emit list yang diperbarui
      emit(updatedProducts);
    });
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: firstColor,
//           title: const Text("Product Card"),
//         ),
//         body: ChangeNotifierProvider<ProductState>(
//           create: (context) => ProductState(),
//           child: Container(
//             margin: EdgeInsets.all(20),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: Consumer<ProductState>(
//                 builder: (context, productState, _) => ProductCard(
//                   imageUrl:
//                       "https://www.aio.co.id/cms/lib/images/product/pocari-sweat-banner.jpg",
//                   name: "Pocari Sweet",
//                   price: "Rp8.000",
//                   quantity: productState.quantity,
//                   notification:
//                       (productState.quantity > 5) ? "Diskon 50%" : null,
//                   onIncTap: () {
//                     productState.quantity++;
//                   },
//                   onDecTap: () {
//                     productState.quantity--;
//                   },
//                   onAddCartTap: () {},
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProductState with ChangeNotifier {
//   num _quantity = 0;

//   num get quantity => _quantity;
//   set quantity(num value) {
//     _quantity = value;
//     notifyListeners();
//   }
// }
