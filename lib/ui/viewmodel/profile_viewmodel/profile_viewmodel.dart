import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class ProfileViewModel extends RootViewModel<ProfileViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final _userRepository = getIt<UserRepository>();

  // TODO: revisar si es mejor pasar solo el username y no enseñar en carga
  final User user;

  ProfileViewModel({required this.user}) : super(Loading());

  @override
  void onAttach() async {
    refreshProfile();
  }

  Future<void> refreshProfile() async {
    final updatedUser = await _userRepository.getUser(user.username);
    final currentUser = await _userRepository.getCurrentLoggedUsername();

    updatedUser.fold(
      (left) => emitValue(
        Error(
          error: left,
          outdatedUser: user,
          isCurrentUser:
              currentUser.isRight && currentUser.right == user.username,
          onRefresh: refreshProfile,
        ),
      ),
      (right) => emitValue(
        Success(
          updatedUser: updatedUser.right,
          isCurrentUser: currentUser.isRight &&
              currentUser.right == updatedUser.right.username,
          onRefresh: refreshProfile,
        ),
      ),
    );
  }
}

sealed class ProfileViewState extends ViewState {}

class Loading extends ProfileViewState {}

class Success extends ProfileViewState {
  final User updatedUser;
  final bool isCurrentUser;
  final Function() onRefresh;

  Success({
    required this.updatedUser,
    required this.isCurrentUser,
    required this.onRefresh,
  });
}

class Error extends ProfileViewState {
  final AppError error;
  final User outdatedUser;
  final bool isCurrentUser;
  final Function() onRefresh;

  Error({
    required this.error,
    required this.outdatedUser,
    required this.isCurrentUser,
    required this.onRefresh,
  });
}
