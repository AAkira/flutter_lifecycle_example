import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../lifecycle/app_lifecycle_observer.dart';
import '../lifecycle/lifecycle_event.dart';
import '../pages/page1.dart' as page2;

const pageName = 'appLifecycleObserverPage';

final appLifecycleObserver = AppLifecycleObserver();

class AppLifecycleObserverPage extends StatefulWidget {
  const AppLifecycleObserverPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends State<AppLifecycleObserverPage> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      appLifecycleObserver.subscribe(pageName, (event) {
        switch (event) {
          case LifecycleEventResumed():
            print(
                'AppLifecycleObserverPage [onResume]: ${event.isSystemEvent}');
          case LifecycleEventPaused():
            print('AppLifecycleObserverPage [onPause]: ${event.isSystemEvent}');
        }
      });

      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              pageName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push('/${page2.pageName}');
              },
              child: Text(
                'Go to ${page2.pageName}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
