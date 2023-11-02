import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/env/constants.dart';

@Injectable()
class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);

  Future<Either<AppError, bool>> call({
    required String username,
    required String email,
    required String password,
    required String name,
    required String surnames,
    required String description,
    required DateTime birthday,
    required String degree,
    required String center,
  }) async {
    // check username doesn't exist
    final usernameExists = await _userRepository.checkUserExists(username);
    if (usernameExists.isLeft) return Left(usernameExists.left);

    // if successful call but didn't found user
    if (!usernameExists.right) return Left(AlreadyExistingUsernameError());

    // TODO: add center, degree, etc
    final user = UserCreate(
      username: username,
      email: email,
      name: name,
      surnames: surnames,
      description: description,
      birthDate: birthday,
      university: Constants.defaultUniversityId,
      degree: Constants.defaultDegreeId,
      center: Constants.defaultCenterId,
      profilePic: Constants.defaultProfilePicUrl,
    );

    // create user on database
    final apiCreation = await _userRepository.createUser(user);
    if (apiCreation.isLeft) return Left(apiCreation.left);

    // todo create user on API
    // if correct, then create user on auth0
    // if error, then delete user on API
    // todo error cases
    // if success, login with created user
    return const Right(true);
  }
}
