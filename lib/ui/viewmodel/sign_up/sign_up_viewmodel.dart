import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/use_cases/social/create_user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SignUpViewModel extends RootViewModel<SignUpViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final CreateUserUseCase _createUserUseCase;

  SignUpViewModel(this._createUserUseCase) : super(Success());

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
    final result = _createUserUseCase(
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
      (right) => null, // todo: login, navigate home
    );
  }

  void handleErrors(AppError error) {}
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
