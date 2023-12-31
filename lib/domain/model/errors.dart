import 'package:easy_localization/easy_localization.dart';

/// Superclass that includes all errors
sealed class AppError {}

class NoInternetError extends AppError {}

class TimeOutError extends AppError {}

class UserNotFoundInLocalError extends AppError {}

class NotLoggedInError extends AppError {}

class AlreadyExistingUsernameError extends AppError {}

class UnknownError extends AppError {}

class ServerError extends AppError {}

class BadRequestError extends AppError {}

class ForbiddenError extends AppError {}

class NotFoundError extends AppError {}

class UnauthError extends AppError {}

class InvalidCredentials extends AppError {}

class ConflictError extends AppError {}

class ExpiredSessionError extends AppError {}

class LimitReachedError extends AppError {}

/// Thrown when 2 or more system components differ
class ConsistencyError extends AppError {
  final AppError causingError;

  ConsistencyError({required this.causingError});
}

/// Associated message to errors
extension ErrorMessage on AppError {
  String get message {
    return switch (runtimeType) {
      NoInternetError => 'errors.no_internet'.tr(),
      ServerError || TimeOutError => 'errors.server'.tr(),
      UnauthError => 'errors.unauth'.tr(),
      NotFoundError => 'errors.not_found'.tr(),
      ExpiredSessionError => 'errors.expired'.tr(),
      ConflictError => 'errors.conflict'.tr(),
      ForbiddenError => 'errors.forbidden'.tr(),
      InvalidCredentials => 'errors.invalid_credentials'.tr(),
      AlreadyExistingUsernameError => 'errors.already_existing_user'.tr(),
      _ => 'errors.generic'.tr(),
    };
  }
}
