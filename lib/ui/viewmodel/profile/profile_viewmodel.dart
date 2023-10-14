import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/domain/use_cases/user_join_quit_plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@injectable
class ProfileViewModel extends RootViewModel<ProfileViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final _userRepository = getIt<UserRepository>();
  final _planRepository = getIt<PlanRepository>();

  final UserJoinQuitPlanUseCase joinQuitPlanUseCase;

  /// The reference of the user. it may be the user's ID or the username.
  final String userRef;

  /// Indicates if [userRef] is the user's ID (true) or the username (false)
  final bool isUserRefId;

  User? profileOwner;

  ProfileViewModel({
    @factoryParam required this.userRef,
    @factoryParam required this.isUserRefId,
    required this.joinQuitPlanUseCase,
  }) : super(Loading());

  @override
  void onAttach() async {
    refreshProfile();
  }

  Future<void> refreshProfile() async {
    final currentUser = await _userRepository.getCurrentLoggedUsername();
    if (currentUser.isLeft) return emitValue(Error(error: currentUser.left));

    final updatedUser = isUserRefId
        ? await _userRepository.getUserById(userRef)
        : await _userRepository.getUser(userRef);

    if (updatedUser.isLeft) return emitValue(Error(error: updatedUser.left));

    profileOwner = updatedUser.right;

    final createdPlans = await _planRepository.getUserPlans(
      updatedUser.right.username,
    );
    if (createdPlans.isLeft) return emitValue(Error(error: createdPlans.left));

    emitValue(
      Success(
        updatedUser: updatedUser.right,
        isCurrentUser: currentUser.right == updatedUser.right.username,
        onRefresh: refreshProfile,
        createdPlans: createdPlans.right,
      ),
    );
  }

  Future<void> joinButtonBehaviour({
    required Plan plan,
    required bool isJoin,
  }) async {
    await joinQuitPlanUseCase(localPlan: plan, isJoin: isJoin);
    refreshProfile();
  }

  bool isJoinedChecker({required Plan plan}) =>
      plan.joinedUsers.contains(profileOwner!.id);
}

sealed class ProfileViewState extends ViewState {}

class Loading extends ProfileViewState {}

class Success extends ProfileViewState {
  final User updatedUser;
  final bool isCurrentUser;
  final Function() onRefresh;
  final List<Plan> createdPlans;

  Success({
    required this.updatedUser,
    required this.isCurrentUser,
    required this.onRefresh,
    required this.createdPlans,
  });
}

class Error extends ProfileViewState {
  final AppError error;

  Error({required this.error});
}
