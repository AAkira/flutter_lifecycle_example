import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/page1.dart' as page2;

const pageName = 'appLifecycleListenerPage';

class AppLifecycleListenerPage extends StatefulWidget {
  const AppLifecycleListenerPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppLifecycleListenerState();
}

class _AppLifecycleListenerState extends State<AppLifecycleListenerPage> {
  late final AppLifecycleListener appLifecycleListener;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      appLifecycleListener = AppLifecycleListener(
        onStateChange: (state) => print('AppLifecycleListener $state'),
      );

      _initialized = true;
    }
  }

  @override
  void dispose() {
    appLifecycleListener.dispose();
    super.dispose();
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
          ],
        ),
      ),
    );
  }
}
