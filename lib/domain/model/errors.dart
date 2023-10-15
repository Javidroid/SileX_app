/// Superclass that includes local errors
sealed class AppError {}

class NoInternetError extends AppError {}

class UninitializedSharedPreferencesError extends AppError {}

class UnknownError extends AppError {}

/// Superclass that includes remote-related errors
sealed class RemoteError extends AppError {}

class ServerError extends RemoteError {}

class BadRequestError extends RemoteError {}

class ForbiddenError extends RemoteError {}

class NotFoundError extends RemoteError {}

class UnauthError extends RemoteError {}

class ConflictError extends RemoteError {}

class ExpiredSessionError extends RemoteError {}

class LimitReachedError extends RemoteError {}
