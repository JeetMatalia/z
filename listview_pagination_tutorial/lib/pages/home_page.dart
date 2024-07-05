import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:listview_pagination_tutorial/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final Dio dio = Dio();

  List<Product> products = [];
  int totalProducts = 1000;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getProducts();
    scrollController.addListener(loadMoreData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FStore",
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          controller: scrollController,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Column(
              children: [
                ListTile(
                  leading: Text(
                    product.id.toString(),
                  ),
                  title: Text(
                    product.title!,
                  ),
                  subtitle: Text(
                    "\$${product.price.toString()}",
                  ),
                  trailing: Image(
                    width: 150,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.thumbnail!,
                    ),
                  ),
                ),
                if (index == products.length - 1 && isLoading)
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SpinKitThreeBounce(
                      color: Colors.purple,
                      size: 40,
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }

  void loadMoreData() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        products.length < totalProducts) {
      getProducts();
    }
  }

  Future<void> getProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await dio.get(
          "https://dummyjson.com/products?limit=15&skip=${products.length}&select=title,price,thumbnail");
      final List data = response.data["products"];
      final List<Product> newProducts =
          data.map((p) => Product.fromJson(p)).toList();
      setState(() {
        isLoading = false;
        totalProducts = response.data["total"];
        products.addAll(newProducts);
      });
    } catch (e) {
      print(e);
    }
  }
}
