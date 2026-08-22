import 'dart:async';

class AuthEventBus {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get onSessionExpiree => _controller.stream;

  void notifierSessionExpiree() => _controller.add(null);

  void dispose() => _controller.close();
}