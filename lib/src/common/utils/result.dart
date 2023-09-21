/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  const Result();

  S? get value {
    return switch (this) {
      Success(wrapValue: final v) => v,
      Failure() => null,
    };
  }

  E? get error {
    return switch (this) {
      Success() => null,
      Failure(exception: final e) => e,
    };
  }
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.wrapValue);
  final S wrapValue;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}
