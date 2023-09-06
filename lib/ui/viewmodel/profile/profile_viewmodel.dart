import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@injectable
class ProfileViewModel extends RootViewModel<ProfileViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final _userRepository = getIt<UserRepository>();

  // TODO: check si se pueden reusar los objetos ya cargados

  /// The reference of the user. it may be the user's ID or the username.
  final String userRef;

  /// Indicates if [userRef] is the user's ID (true) or the username (false)
  final bool isUserRefId;

  ProfileViewModel({
    @factoryParam required this.userRef,
    @factoryParam required this.isUserRefId,
  }) : super(Loading());

  @override
  void onAttach() async {
    refreshProfile();
  }

  Future<void> refreshProfile() async {
    final updatedUser = isUserRefId
        ? await _userRepository.getUserById(userRef)
        : await _userRepository.getUser(userRef);

    final currentUser = await _userRepository.getCurrentLoggedUsername();

    updatedUser.fold(
      (left) => emitValue(
        Error(error: left),
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

  Error({required this.error});
}
