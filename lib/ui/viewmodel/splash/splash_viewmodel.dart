import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/use_cases/social/get_updated_logged_user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SplashViewModel extends RootViewModel<SplashViewState> {
  final GetUpdatedLoggedUserUseCase getUpdatedLoggedUserUseCase;

  SplashViewModel(this.getUpdatedLoggedUserUseCase) : super(const Loading());

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  void onAttach() async {
    final result = await getUpdatedLoggedUserUseCase();

    // todo change
    // result.fold(
    //   (left) => navigator.toLogin(),
    //   (right) => navigator.replaceToHome(),
    // );
    result.fold(
      (left) => emitValue(Error(left)),
      (right) => navigator.toLogin(), // navigator.replaceToHome(),
    );
  }
}

sealed class SplashViewState extends ViewState {
  const SplashViewState();
}

class Loading extends SplashViewState {
  const Loading();
}

class Success extends SplashViewState {}

class Error extends SplashViewState {
  final AppError error;

  const Error(this.error);
}
