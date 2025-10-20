import 'package:flutter/material.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/mock_data.dart';
import '../widgets/custom_card.dart';
import 'detail_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});
  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<String> favs = [];

  @override
  void initState() {
    super.initState();
    _loadFavs();
  }

  Future<void> _loadFavs() async {
    favs = await FavoritesController.loadFavorites();
    if (mounted) setState(() {});
  }

  List _collectFavorites() {
    final list = <Map>[];
    for (var h in MockData.hotels) if (favs.contains(h.id)) list.add({'type': 'hotel', 'item': h});
    for (var r in MockData.restaurants) if (favs.contains(r.id)) list.add({'type': 'restaurant', 'item': r});
    for (var p in MockData.attractions) if (favs.contains(p.id)) list.add({'type': 'attraction', 'item': p});
    for (var t in MockData.transports) if (favs.contains(t.id)) list.add({'type': 'transport', 'item': t});
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final items = _collectFavorites();
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFF),
      appBar: AppBar(backgroundColor: Colors.cyan, title: const Text('المفضلة'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: items.isEmpty
            ? Center(child: Text('لا توجد عناصر مفضلة بعد', style: TextStyle(color: Colors.grey[600])))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  final m = items[i];
                  final item = m['item'];
                  final type = m['type'];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailView.routeName,
                        arguments: DetailArguments(
                          id: item.id,
                          name: item.name,
                          description: item.description,
                          images: item.images,
                          rating: item.rating,
                          type: type == 'hotel'
                              ? DetailType.hotel
                              : type == 'restaurant'
                                  ? DetailType.restaurant
                                  : DetailType.attraction,
                          phoneNumber: item.phoneNumber,
                          locationUrl: item.locationUrl,
                        ),
                      );
                    },
                    child: CustomCard(
                      id: item.id,
                      title: item.name,
                      subtitle: item.location ?? '',
                   imagePath: (item.images != null && item.images.isNotEmpty)
    ? item.images.first
    : 'assets/images/placeholder.WebP',

                      rating: (item.rating ?? 0).toDouble(),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await FavoritesController.toggleFavorite(item.id);
                          await _loadFavs();
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
