sealed class AppError {}

class NoInternet extends AppError {}

class ServerError extends AppError {}

class BadRequestError extends AppError {}

class ForbiddenError extends AppError {}

class NotFoundError extends AppError {}

class UnauthError extends AppError {}

class ExpiredSessionError extends AppError {}

class UnknownError extends AppError {}
