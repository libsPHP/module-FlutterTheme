/// Modern Result pattern for error handling in Flutter Magento plugin.
///
/// This sealed class provides a type-safe way to handle operations that can
/// either succeed or fail, eliminating the need for exceptions in many cases.
sealed class Result<T> {
  const Result();

  /// Returns true if this is a [Success] result.
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a [Failure] result.
  bool get isFailure => this is Failure<T>;

  /// Returns the data if this is a [Success], otherwise null.
  T? get data => switch (this) {
    Success<T>(data: final data) => data,
    Failure<T>() => null,
  };

  /// Returns the error message if this is a [Failure], otherwise null.
  String? get error => switch (this) {
    Failure<T>(message: final message) => message,
    Success<T>() => null,
  };

  /// Returns the error code if this is a [Failure], otherwise null.
  int? get errorCode => switch (this) {
    Failure<T>(code: final code) => code,
    Success<T>() => null,
  };

  /// Maps the data if this is a [Success], otherwise returns the failure.
  Result<U> map<U>(U Function(T data) mapper) => switch (this) {
    Success<T>(data: final data) => Success(mapper(data)),
    Failure<T>(message: final message, code: final code) => Failure(
      message,
      code,
    ),
  };

  /// Maps the data to a Result if this is a [Success], otherwise returns the failure.
  Result<U> flatMap<U>(Result<U> Function(T data) mapper) => switch (this) {
    Success<T>(data: final data) => mapper(data),
    Failure<T>(message: final message, code: final code) => Failure(
      message,
      code,
    ),
  };

  /// Executes a function if this is a [Success].
  Result<T> onSuccess(void Function(T data) action) {
    if (this case Success<T>(data: final data)) {
      action(data);
    }
    return this;
  }

  /// Executes a function if this is a [Failure].
  Result<T> onFailure(void Function(String message, int? code) action) {
    if (this case Failure<T>(message: final message, code: final code)) {
      action(message, code);
    }
    return this;
  }

  /// Returns the data if this is a [Success], otherwise returns the default value.
  T getOrElse(T defaultValue) => switch (this) {
    Success<T>(data: final data) => data,
    Failure<T>() => defaultValue,
  };

  /// Returns the data if this is a [Success], otherwise throws an exception.
  T getOrThrow() => switch (this) {
    Success<T>(data: final data) => data,
    Failure<T>(message: final message, code: final code) => throw Exception(
      'Operation failed: $message (code: $code)',
    ),
  };
}

/// Represents a successful operation result.
final class Success<T> extends Result<T> {
  const Success(this.data);

  @override
  final T data;

  @override
  String toString() => 'Success(data: $data)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Success<T> && other.data == data);

  @override
  int get hashCode => data.hashCode;
}

/// Represents a failed operation result.
final class Failure<T> extends Result<T> {
  const Failure(this.message, [this.code]);

  final String message;
  final int? code;

  @override
  String toString() => 'Failure(message: $message, code: $code)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Failure<T> && other.message == message && other.code == code);

  @override
  int get hashCode => Object.hash(message, code);
}

/// Extension methods for Result types.
extension ResultExtensions<T> on Result<T> {
  /// Returns the data if this is a [Success], otherwise executes the provided function.
  T getOrElse(T Function() defaultValue) => switch (this) {
    Success<T>(data: final data) => data,
    Failure<T>() => defaultValue(),
  };

  /// Returns the data if this is a [Success], otherwise executes the provided function.
  Future<T> getOrElseAsync(Future<T> Function() defaultValue) async =>
      switch (this) {
        Success<T>(data: final data) => data,
        Failure<T>() => await defaultValue(),
      };
}

/// Helper functions for creating Result instances.
class ResultUtils {
  /// Creates a [Success] result.
  static Result<T> success<T>(T data) => Success(data);

  /// Creates a [Failure] result.
  static Result<T> failure<T>(String message, [int? code]) =>
      Failure(message, code);

  /// Creates a [Result] from a function that might throw.
  static Result<T> tryCatch<T>(T Function() operation) {
    try {
      return Success(operation());
    } catch (e) {
      return Failure('Operation failed: $e');
    }
  }

  /// Creates a [Result] from an async function that might throw.
  static Future<Result<T>> tryCatchAsync<T>(
    Future<T> Function() operation,
  ) async {
    try {
      return Success(await operation());
    } catch (e) {
      return Failure('Operation failed: $e');
    }
  }
}
