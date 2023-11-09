import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_lifecycle_observer.dart';
import 'lifecycle_event.dart';

part 'app_lifecycle_stream.g.dart';

@riverpod
Stream<LifecycleEvent> appLifecycleStream(
  AppLifecycleStreamRef ref,
  String key,
) async* {
  StreamController<LifecycleEvent> eventController = StreamController();

  final provider = ref.watch(appLifecycleObserverProvider);

  provider.subscribe(key, (LifecycleEvent event) {
    eventController.add(event);
  });

  ref.onDispose(() {
    provider.unsubscribe(key);
  });

  yield* eventController.stream;
}
