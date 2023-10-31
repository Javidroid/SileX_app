import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/use_cases/auth/login.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class LoginViewModel extends RootViewModel<LoginViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(Loading());

  @override
  void onAttach() async {
    emitValue(Success());
  }

// TODO: set user in sharedPreferences

  void toRegisterScreen() => navigator.toSignUp();

  void submitLogin() {
    // todo
    loginUseCase();
  }
}

sealed class LoginViewState extends ViewState {}

class Loading extends LoginViewState {}

class Success extends LoginViewState {
  Success();
}

class Error extends LoginViewState {
  final AppError error;

  Error(this.error);
}
