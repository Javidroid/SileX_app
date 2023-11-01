import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SignUpViewModel extends RootViewModel<SignUpViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  SignUpViewModel() : super(Loading());

  DateTime get date => _date;
  DateTime _date = DateTime.now();



  @override
  void onAttach() async {
    emitValue(Success());
  }

  void toLoginScreen() => navigator.pop();

  Future<void> submitSignUp() async {
    emitValue(Loading());
    // todo
  }

  void setDate(DateTime date) {
    _date = date;
    emitValue(Success());
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
