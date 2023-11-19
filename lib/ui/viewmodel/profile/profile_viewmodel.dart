import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/social/plan.dart';
import 'package:tfg_v2/domain/model/social/user.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/domain/use_cases/social/follow_user.dart';
import 'package:tfg_v2/domain/use_cases/social/get_updated_logged_user.dart';
import 'package:tfg_v2/domain/use_cases/social/user_join_quit_plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@injectable
class ProfileViewModel extends RootViewModel<ProfileViewState> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  final _userRepository = getIt<UserRepository>();
  final _planRepository = getIt<PlanRepository>();

  final UserJoinQuitPlanUseCase _joinQuitPlanUseCase;
  final FollowUserUseCase _followUserUseCase;
  final GetUpdatedLoggedUserUseCase _getUpdatedLoggedUserUseCase;

  /// The reference of the user. it may be the user's ID or the username.
  final String userRef;

  /// Indicates if [userRef] is the user's ID (true) or the username (false)
  final bool isUserRefId;

  /// The [User] being shown on the profile. Can be or not the [currentUser].
  User? profileOwner;

  /// Current logged [User] that holds the device.
  /// Can be or not the [profileOwner]
  User? currentUser;

  ProfileViewModel({
    @factoryParam required this.userRef,
    @factoryParam required this.isUserRefId,
    required UserJoinQuitPlanUseCase joinQuitPlanUseCase,
    required FollowUserUseCase followUserUseCase,
    required GetUpdatedLoggedUserUseCase getUpdatedLoggedUserUseCase,
  })  : _followUserUseCase = followUserUseCase,
        _joinQuitPlanUseCase = joinQuitPlanUseCase,
        _getUpdatedLoggedUserUseCase = getUpdatedLoggedUserUseCase,
        super(Loading());

  @override
  void onAttach() async {
    refreshProfile();
  }

  Future<void> refreshProfile() async {
    // emitValue(Loading());
    final tempCurrentUser = await _getUpdatedLoggedUserUseCase();
    if (tempCurrentUser.isLeft) {
      return emitValue(Error(error: tempCurrentUser.left));
    }
    currentUser = tempCurrentUser.right;

    final updatedOwnerUser = isUserRefId
        ? await _userRepository.getUserById(userRef)
        : await _userRepository.getUser(userRef);

    if (updatedOwnerUser.isLeft) {
      return emitValue(Error(error: updatedOwnerUser.left));
    }

    profileOwner = updatedOwnerUser.right;

    final createdPlans = await _planRepository.getUserPlans(
      updatedOwnerUser.right.username,
    );
    if (createdPlans.isLeft) return emitValue(Error(error: createdPlans.left));

    emitValue(
      Success(
        updatedUser: updatedOwnerUser.right,
        isCurrentUser:
            tempCurrentUser.right.username == updatedOwnerUser.right.username,
        onRefresh: refreshProfile,
        createdPlans: createdPlans.right,
      ),
    );
  }

  /// When follow/unfollow button is pressed, runs consequent operation.
  /// If [isFollow] is true, then it follows. Unfollows otherwise.
  Future<void> onFollowPressed({required bool isFollow}) async {
    await _followUserUseCase(
      isFollow: isFollow,
      targetUser: profileOwner!,
    );
    refreshProfile();
  }

  Future<void> joinButtonBehaviour({
    required Plan plan,
    required bool isJoin,
  }) async {
    await _joinQuitPlanUseCase(localPlan: plan, isJoin: isJoin);
  }

  /// Checks if [currentUser] is following [profileOwner]
  bool isFollowingChecker() {
    return currentUser != null &&
        currentUser!.profile.following.contains(profileOwner!.id);
  }

  bool isJoinedChecker({required Plan plan}) =>
      plan.joinedUsers.contains(currentUser!.id);
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
