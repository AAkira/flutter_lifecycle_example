sealed class LifecycleEvent {
  const LifecycleEvent(this.isSystemEvent);

  final bool isSystemEvent;
}

class LifecycleEventResumed extends LifecycleEvent {
  const LifecycleEventResumed(super.isSystemEvent);

  @override
  String toString() => 'LifecycleEventResumed(isSystemEvent: $isSystemEvent)';
}

class LifecycleEventPaused extends LifecycleEvent {
  const LifecycleEventPaused(super.isSystemEvent);

  @override
  String toString() => 'LifecycleEventPaused(isSystemEvent: $isSystemEvent)';
}
