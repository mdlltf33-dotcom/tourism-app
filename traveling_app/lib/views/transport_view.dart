import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/mock_data.dart';
import '../widgets/custom_card.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/main_drawer.dart';
import '../providers/transport_filter_provider.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  @override
  State<TransportView> createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  List<String> favs = [];

  final filters = ["تاكسي", "حافلة", "توصيل خاص", "سياحي", "مشترك"];

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
    final transports = MockData.transports;
    final selectedFilter = context.watch<TransportFilterProvider>().selectedFilter;

    final filteredTransports = selectedFilter == null
        ? transports
        : transports.where((t) => t.type.contains(selectedFilter)).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFF),
      drawer: const MainDrawer(),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          // ✅ شريط الفلاتر المتحرك
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
                        context.read<TransportFilterProvider>().selectFilter(filter);
                      },
                      icon: CircleAvatar(
                        radius: 12,
                        backgroundColor: isSelected ? Colors.white : const Color(0xFF00C2FF),
                        child: Icon(Icons.filter_alt, size: 14, color: isSelected ? Colors.black : Colors.white),
                      ),
                      label: Text(
                        filter,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                      ),
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

          // ✅ شبكة البطاقات
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: filteredTransports.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.74,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, i) {
                  final t = filteredTransports[i];
                  return CustomCard(
                    id: t.id,
                    title: t.name,
                    subtitle: t.location,
                    imagePath: t.images[0],
                    rating: t.rating,
                    trailing: _buildTrailing(t.id),
                    onTap: () {
                      // يمكن فتح صفحة تفاصيل لاحقًا
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
