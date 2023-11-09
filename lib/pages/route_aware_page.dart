import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/page1.dart' as page2;

const pageName = 'routeAwarePage';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwarePage extends StatefulWidget {
  const RouteAwarePage({super.key});

  @override
  State<StatefulWidget> createState() => _RouteAwarePageState();
}

class _RouteAwarePageState extends State<RouteAwarePage> with RouteAware {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    routeObserver.subscribe(
      this,
      ModalRoute.of(context)! as PageRoute<dynamic>,
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    print('route aware: didPush');
  }

  @override
  void didPop() {
    print('route aware: didPop');
  }

  @override
  void didPushNext() {
    print('route aware: didPushNext');
  }

  @override
  void didPopNext() {
    print('route aware: didPopNext');
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
