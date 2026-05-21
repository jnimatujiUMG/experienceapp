import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../shop/explore/presentation/pages/explore_page.dart';

class MainNavigationPage extends StatelessWidget {

  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {

    return PersistentTabView(

      tabs: [

        PersistentTabConfig(
          screen: const ExplorePage(),
          item: ItemConfig(
            icon: const Icon(Icons.explore),
            title: "Explore",
          ),
        ),

        PersistentTabConfig(
          screen: const Scaffold(),
          item: ItemConfig(
            icon: const Icon(Icons.grid_view),
            title: "Categories",
          ),
        ),

        PersistentTabConfig(
          screen: const Scaffold(),
          item: ItemConfig(
            icon: const Icon(Icons.storefront),
            title: "Stores",
          ),
        ),

        PersistentTabConfig(
          screen: const Scaffold(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Profile",
          ),
        ),
      ],

      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}