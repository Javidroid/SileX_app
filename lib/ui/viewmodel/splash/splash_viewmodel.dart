import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/local/local_datasource.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/env/environment.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SplashViewModel extends RootViewModel<SplashViewState> {
  final _repository = getIt<LocalDatasource>();

  TfgNavigator get navigator => getIt<TfgNavigator>();

  SplashViewModel() : super(Loading());

  @override
  void onAttach() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await _repository.getEnvironment();
    response.fold(
      (left) => emitValue(Error(left)),
      (right) => navigator.replaceToHome(),
    );
  }
}

sealed class SplashViewState extends ViewState {}

class Loading extends SplashViewState {}

class Success extends SplashViewState {
  final TfgEnv env;

  Success(this.env);
}

class Error extends SplashViewState {
  final AppError error;

  Error(this.error);
}
