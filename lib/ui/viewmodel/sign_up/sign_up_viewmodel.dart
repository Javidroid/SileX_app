import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SignUpViewModel extends RootViewModel<SignUpViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  SignUpViewModel() : super(Loading());

  @override
  void onAttach() async {
    emitValue(Success());
  }

  Future<void> submitSignUp({
    required String username,
    required String password,
  }) async {
    emitValue(Loading());
    // todo
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
