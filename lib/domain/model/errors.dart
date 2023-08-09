sealed class AppError {}

class NoInternet extends AppError {}

class ServerError extends AppError {}

class BadRequestError extends AppError {}

class ForbiddenError extends AppError {}

class NotFoundError extends AppError {}

class UnauthError extends AppError {}

class ConflictError extends AppError {}

class ExpiredSessionError extends AppError {}

class UninitializedSharedPreferencesError extends AppError {}

class UnknownError extends AppError {}

// TODO: add remote errors
// TODO: add user limit reached error
