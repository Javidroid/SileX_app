import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

class UserListViewModel extends RootViewModel<UserListViewState> {
  UserRepository get _userRepository => getIt<UserRepository>();

  UserListViewModel({required this.userIdList}) : super(Loading());

  final List<String> userIdList;

  @override
  void onAttach() async {
    emitValue(Loading());
    getJoinedUsers();
  }

  Future<void> getJoinedUsers() async {
    final result = await _userRepository.getUserListById(userIdList);
    result.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(userList: result.right)),
    );
  }
}

sealed class UserListViewState extends ViewState {}

class Loading extends UserListViewState {}

class Success extends UserListViewState {
  List<User> userList;

  Success({required this.userList});
}

class Error extends UserListViewState {
  final AppError error;

  Error(this.error);
}
