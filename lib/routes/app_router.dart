import 'package:go_router/go_router.dart';

import '../features/introduction/interests/presentation/pages/interests_page.dart';
import '../features/navigation/presentation/pages/main_navigation_page.dart';
import '../features/introduction/onboarding/presentation/pages/onboaarding_page.dart';

import '../features/shop/explore/domain/entities/product_entity.dart';
import '../features/shop/product_detail/presentation/pages/product_detail_page.dart';
import '../features/shop/cart/presentation/pages/cart_page.dart';

import '../features/shop/product_detail/presentation/pages/product_detail_page.dart';

import '../features/shop/explore/domain/entities/product_entity.dart';

final appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    //DETALLE DE PRODUCTO
    GoRoute(
    path: '/product-detail',
    builder: (context, state) {

      final product =
          state.extra as ProductEntity;

      return ProductDetailPage(
        product: product,
      );
    },
  ),

    // ONBOARDING
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const OnboardingPage();
      },
    ),

    // INTERESTS
    GoRoute(
      path: '/interests',
      builder: (context, state) {
        return const InterestsPage();
      },
    ),

    // EXPLORE
    GoRoute(
      path: '/explore',
      builder: (context, state) {
        return const MainNavigationPage();
      },
    ),

    GoRoute(
      path: '/product-detail',

      builder: (context, state) {

        final product =
            state.extra as ProductEntity;

        return ProductDetailPage(
          product: product,
        );
      },
    ),
  ],
);