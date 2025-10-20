import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/splash_view.dart';
import 'views/hotels_view.dart';
import 'views/attractions_view.dart';
import 'views/restaurants_view.dart';
import 'views/transport_view.dart';
import 'views/detail_view.dart';

import 'providers/hotelas_filter_provider.dart';
import 'providers/transport_filter_provider.dart';
import 'providers/restaurant_filter_provider.dart';
import 'providers/attraction_filter_provider.dart';
import 'providers/comments_provider.dart';

void main() {
  runApp(const SyrTripApp());
}

class SyrTripApp extends StatelessWidget {
  const SyrTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => TransportFilterProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantFilterProvider()),
        ChangeNotifierProvider(create: (_) => AttractionFilterProvider()),
        ChangeNotifierProvider(create: (_) => CommentsProvider()),
      ],
      child: MaterialApp(
        title: 'SyrTrip',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Cairo',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        ),
        home: const SplashView(),
        routes: {
          '/hotels': (context) => const HotelsView(),
          '/attractions': (context) => const AttractionsView(),
          '/restaurants': (context) => const RestaurantsView(),
          '/transport': (context) => const TransportView(),
          DetailView.routeName: (context) => const DetailView(),
        },
      ),
    );
  }
}
