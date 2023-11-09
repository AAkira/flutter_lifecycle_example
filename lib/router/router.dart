import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../lifecycle/app_lifecycle_observer.dart';
import '../pages/widget_lifecycle_page.dart' as widgetLifecyclePage;
import '../pages/app_lifecycle_listener_page.dart' as appLifecycleListenerPage;
import '../pages/app_lifecycle_observer_page.dart' as appLifecycleObserverPage;
import '../pages/home_page.dart';
import '../pages/page1.dart' as page1;
import '../pages/page2.dart' as page2;
import '../pages/route_aware_page.dart' as routeAwarePage;
import '../pages/route_aware_page.dart';
import '../pages/with_riverpod_page.dart' as withRiverpodPage;

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) => GoRouter(
      initialLocation: '/',
      observers: [
        routeObserver,
        appLifecycleObserverPage.appLifecycleObserver, // for without riverpod
        ref.watch(appLifecycleObserverProvider), // for riverpod
      ],
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: '/',
              child: const HomePage(),
            );
          },
        ),
        GoRoute(
          path: '/${page1.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: page1.pageName,
              child: const page1.Page1(),
            );
          },
        ),
        GoRoute(
          path: '/${page2.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: page2.pageName,
              child: const page2.Page2(),
            );
          },
        ),
        GoRoute(
          path: '/${widgetLifecyclePage.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: widgetLifecyclePage.pageName,
              child: const widgetLifecyclePage.WidgetLifecyclePage(),
            );
          },
        ),
        GoRoute(
          path: '/${appLifecycleListenerPage.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: appLifecycleListenerPage.pageName,
              child: const appLifecycleListenerPage.AppLifecycleListenerPage(),
            );
          },
        ),
        GoRoute(
          path: '/${routeAwarePage.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: routeAwarePage.pageName,
              child: const routeAwarePage.RouteAwarePage(),
            );
          },
        ),
        GoRoute(
          path: '/${appLifecycleObserverPage.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: appLifecycleObserverPage.pageName,
              child: const appLifecycleObserverPage.AppLifecycleObserverPage(),
            );
          },
        ),
        GoRoute(
          path: '/${withRiverpodPage.pageName}',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: withRiverpodPage.pageName,
              child: const withRiverpodPage.WithRiverpodPage(),
            );
          },
        ),
      ],
    );
