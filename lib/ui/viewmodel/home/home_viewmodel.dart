import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  final UserRepository _userRepository;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  HomeViewModel(this._userRepository) : super(Loading());

  @override
  void onAttach() async {
    getLoggedUser();
  }

  Future<void> getLoggedUser() async {
    final username = await _userRepository.getCurrentLoggedUsername();
    if (username.isLeft) {
      navigator.navigateToLogin();
      return;
    }

    final user = await _userRepository.getUser(username.right);
    user.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(loggedUser: right)),
    );
  }
}

sealed class HomeViewState extends ViewState {}

class Loading extends HomeViewState {}

class Success extends HomeViewState {
  final User loggedUser;

  Success({required this.loggedUser});
}

class Error extends HomeViewState {
  final AppError error;

  Error(this.error);
}
