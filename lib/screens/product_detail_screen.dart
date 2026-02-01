import 'package:cake_app/models/cake.dart';
import 'package:cake_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Cake cake;

  const DetailsScreen({super.key, required this.cake});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            collapsedHeight: kToolbarHeight,
            pinned: true,
            snap: false,
            floating: false,
            backgroundColor: Colors.pinkAccent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                child: Image.network(cake.imageUrl, fit: BoxFit.cover),
              ),
              collapseMode: CollapseMode.parallax,
              stretchModes: const [StretchMode.zoomBackground],
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    cake.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${cake.price} EGP",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Consumer<FavoritesProvider>(
                                  builder: (context, fav, child) {
                                    final isFav = fav.isFavorite(cake);

                                    return GestureDetector(
                                      onTap: () => fav.toggleFavorite(cake),
                                      child: Icon(
                                        isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFav ? Colors.red : Colors.grey,
                                        size: 22,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    cake.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),

                const SizedBox(height: 80), 
              ],
            ),
          ),
        ],
      ),

      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              cart.addItem(
                cake,
              ); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
