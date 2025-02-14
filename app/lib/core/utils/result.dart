sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.success(T value) = Success<T>._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.failure(Exception error) = Failure._;
}

/// Subclass of Result for values
final class Success<T> extends Result<T> {
  const Success._(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => '$value';
}

/// Subclass of Result for errors
final class Failure<E> extends Result<E> {
  const Failure._(this.error);

  /// Returned error in result
  final Exception error;

  @override
  String toString() => 'Error: $error';
}
