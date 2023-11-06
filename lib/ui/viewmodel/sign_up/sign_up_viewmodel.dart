import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/use_cases/auth/login.dart';
import 'package:tfg_v2/domain/use_cases/social/create_user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SignUpViewModel extends RootViewModel<SignUpViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final CreateUserUseCase _createUserUseCase;
  final LoginUseCase _loginUseCase;

  // TODO: add regex

  SignUpViewModel(this._createUserUseCase, this._loginUseCase)
      : super(Success());

  @override
  void onAttach() async {}

  void toLoginScreen() => navigator.pop();

  Future<void> submitSignUp({
    required String username,
    required String email,
    required String password,
    required String name,
    required String surnames,
    required String description,
    required DateTime birthday,
    required String degree,
    required String center,
  }) async {
    emitValue(Loading());
    // todo handle errors
    final result = await _createUserUseCase(
      username: username,
      email: email,
      password: password,
      name: name,
      surnames: surnames,
      description: description,
      birthday: birthday,
      degree: degree,
      center: center,
    );

    result.fold(
      (left) => handleErrors(left), // TODO: snackbar
      (right) async {
        final login = await _loginUseCase(
          username: username,
          password: password,
        );
        login.fold(
          (left) => handleErrors(left), // TODO: snackbar
          (right) => navigator.replaceToHome(),
        );
      },
    );
  }

  void handleErrors(AppError error) {
    print(error.message);
    switch (error) {
      default: // todo: emit snackbar
    }
  }
}

sealed class SignUpViewState extends ViewState {}

class Loading extends SignUpViewState {}

class Success extends SignUpViewState {
  Success();
}

class Error extends SignUpViewState {
  final AppError error;

  Error(this.error);
}
