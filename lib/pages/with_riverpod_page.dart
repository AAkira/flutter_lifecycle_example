import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../lifecycle/app_lifecycle_stream.dart';
import '../pages/page1.dart' as page2;

const pageName = 'withRiverpodPage';

class WithRiverpodPage extends ConsumerWidget {
  const WithRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(appLifecycleStreamProvider(pageName));
    event.whenData((value) {
      print('$pageName: $value');
    });

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
