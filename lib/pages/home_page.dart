import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/app_lifecycle_listener_page.dart' as appLifecycleListenerPage;
import '../pages/app_lifecycle_observer_page.dart' as appLifecycleObserverPage;
import '../pages/route_aware_page.dart' as routeAwarePage;
import '../pages/widget_lifecycle_page.dart' as widgetLifecyclePage;
import '../pages/with_riverpod_page.dart' as withRiverpodPage;

const pageName = '/';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Root page',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push('/${widgetLifecyclePage.pageName}');
              },
              child: Text(
                'WidgetLifecycle',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.push('/${appLifecycleListenerPage.pageName}');
              },
              child: Text(
                'AppLifecycleListener',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.push('/${routeAwarePage.pageName}');
              },
              child: Text(
                'RouteAware',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.push('/${appLifecycleObserverPage.pageName}');
              },
              child: Text(
                'AppLifecycleObserver without riverpod',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.push('/${withRiverpodPage.pageName}');
              },
              child: Text(
                'AppLifecycleObserver with riverpod',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
