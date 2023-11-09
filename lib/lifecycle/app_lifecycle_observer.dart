import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'lifecycle_event.dart';

part 'app_lifecycle_observer.g.dart';

@Riverpod(keepAlive: true)
AppLifecycleObserver appLifecycleObserver(AppLifecycleObserverRef ref) =>
    AppLifecycleObserver();

typedef LifecycleObserverCallback = void Function(LifecycleEvent event);

class AppLifecycleObserver extends NavigatorObserver {
  AppLifecycleObserver() {
    _appLifecycleListener = AppLifecycleListener(
      onResume: () {
        _emitLifecycleEvent(
            _routeStack.last, const LifecycleEventResumed(true));
      },
      onPause: () {
        _emitLifecycleEvent(_routeStack.last, const LifecycleEventPaused(true));
      },
    );
  }

  late final AppLifecycleListener _appLifecycleListener;

  final Map<String, Set<LifecycleObserverCallback>> _subscribers =
      <String, Set<LifecycleObserverCallback>>{};

  final List<Route<dynamic>> _routeStack = [];

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeStack.remove(route);

    _emitLifecycleEvent(route, const LifecycleEventPaused(false));
    _emitLifecycleEvent(previousRoute, const LifecycleEventResumed(false));
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeStack.add(route);

    _emitLifecycleEvent(previousRoute, const LifecycleEventPaused(false));
    _emitLifecycleEvent(route, const LifecycleEventResumed(false));
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_routeStack.last == route) {
      _emitLifecycleEvent(route, const LifecycleEventPaused(false));
      _emitLifecycleEvent(previousRoute, const LifecycleEventResumed(false));
    }
    _routeStack.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final index = _routeStack.indexWhere((element) => element == oldRoute);
    if (_routeStack.last == oldRoute) {
      _emitLifecycleEvent(oldRoute, const LifecycleEventPaused(false));
    }
    _routeStack.remove(oldRoute);

    if (index >= 0 && newRoute != null) {
      _routeStack.insert(index, newRoute);
    }
    if (_routeStack.last == newRoute) {
      _emitLifecycleEvent(newRoute, const LifecycleEventResumed(false));
    }
  }

  void dispose() {
    _appLifecycleListener.dispose();
    _subscribers.clear();
  }

  void subscribe(String key, LifecycleObserverCallback callback) {
    final Set<LifecycleObserverCallback> subscribers =
        _subscribers.putIfAbsent(key, () => {});
    subscribers.add(callback);

    if (_routeStack.isNotEmpty && _routeStack.last.settings.name == key) {
      _emitLifecycleEvent(_routeStack.last, const LifecycleEventResumed(false));
    }
  }

  void unsubscribe(String key) {
    _subscribers.remove(key);
  }

  void _emitLifecycleEvent(Route<dynamic>? route, LifecycleEvent event) {
    final key = route?.settings.name;
    if (key == null) {
      return;
    }

    final subscribers = _subscribers[key];
    if (subscribers == null) {
      return;
    }
    for (final subscriber in subscribers) {
      subscriber.call(event);
    }
  }
}
