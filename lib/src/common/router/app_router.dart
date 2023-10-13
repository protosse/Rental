import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reader/src/features/features.dart';
import 'package:reader/src/common/common.dart';

part 'app_router.gr.dart'; 

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
    ),
    CupertinoRoute(
      page: TabsRoute.page,
      path: '/tabs-screen',
      children: [
        CupertinoRoute(
          page: HomeRoute.page,
          path: 'home-tab',
        ),
        CupertinoRoute(
          page: ExploreRoute.page,
          path: 'explore-tab',
          ),
          CupertinoRoute(
            page: SettingsRoute.page,
            path: 'settings-tab',
          ),
      ]
    ),
        CupertinoRoute(
          page: BookDetailsRoute.page,
          path: '/book-details-tab',
        ),
  ];
}