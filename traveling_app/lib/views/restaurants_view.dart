import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/mock_data.dart';
import '../widgets/custom_card.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/main_drawer.dart';
import '../providers/restaurant_filter_provider.dart';
import 'detail_view.dart';


class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key});

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  List<String> favs = [];
  final filters = ["شعبي", "شرقي", "غربي", "حلويات", "إطلالة"];

  @override
  void initState() {
    super.initState();
    _loadFavs();
  }

  Future<void> _loadFavs() async {
    favs = await FavoritesController.loadFavorites();
    if (mounted) setState(() {});
  }

  Widget _buildTrailing(String id) {
    final isFav = favs.contains(id);
    return IconButton(
      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
      onPressed: () async {
        await FavoritesController.toggleFavorite(id);
        await _loadFavs();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurants = MockData.restaurants;
    final selectedFilter = context.watch<RestaurantFilterProvider>().selectedFilter;

    final filteredRestaurants = selectedFilter == null
        ? restaurants
        : restaurants.where((r) => r.cuisineType.contains(selectedFilter)).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFF),
      drawer: const MainDrawer(),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: filters.map((filter) {
                  final isSelected = selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<RestaurantFilterProvider>().selectFilter(filter);
                      },
                      icon: CircleAvatar(
                        radius: 12,
                        backgroundColor: isSelected ? Colors.white : const Color(0xFF00C2FF),
                        child: Icon(Icons.filter_alt, size: 14, color: isSelected ? Colors.black : Colors.white),
                      ),
                      label: Text(filter, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected ? const Color(0xFF00C2FF) : Colors.white,
                        foregroundColor: isSelected ? Colors.white : Colors.black87,
                        elevation: 1,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Color(0xFF00C2FF), width: 1),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: filteredRestaurants.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.74,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, i) {
                  final r = filteredRestaurants[i];
                  return CustomCard(
                    id: r.id,
                    title: r.name,
                    subtitle: r.location,
                    imagePath: r.images[0],
                    rating: r.rating,
                    trailing: _buildTrailing(r.id),
               onTap: () {
  Navigator.pushNamed(
    context,
    DetailView.routeName,
    arguments: DetailArguments(
      id: r.id,
      name: r.name,
      description: r.description,
      images: r.images, // ← تعديل هنا
      rating: r.rating,
      phoneNumber: r.phoneNumber,
      locationUrl: r.location,
      type: DetailType.restaurant,
    ),
  );
},

                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
