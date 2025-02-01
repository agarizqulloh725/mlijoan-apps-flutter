import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String message;

  const Failures({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failures{
  const ServerFailure({required super.message});
}

class ConnectionFailure extends Failures{
  const ConnectionFailure({required super.message});
}

class TimeoutFailure extends Failures{
  const TimeoutFailure({required super.message});
}

class CachedFailure extends Failures{
  const CachedFailure({required super.message});
}

class NotFoundFailure extends Failures{
  const NotFoundFailure({required super.message});
}
class NetworkFailure extends Failures{
  const NetworkFailure({required super.message});
}