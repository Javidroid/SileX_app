import 'package:easy_localization/easy_localization.dart';

/// Superclass that includes all errors
sealed class AppError {}

class NoInternetError extends AppError {}

class TimeOutError extends AppError {}

class UninitializedSharedPreferencesError extends AppError {}

class UnknownError extends AppError {}

class ServerError extends AppError {}

class BadRequestError extends AppError {}

class ForbiddenError extends AppError {}

class NotFoundError extends AppError {}

class UnauthError extends AppError {}

class ConflictError extends AppError {}

class ExpiredSessionError extends AppError {}

class LimitReachedError extends AppError {}

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
      _ => 'errors.generic'.tr(),
    };
  }
}
