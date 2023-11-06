import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/auth/auth_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/utils/profile_pic_generator.dart';

@Injectable()
class CreateUserUseCase {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  CreateUserUseCase(this._userRepository, this._authRepository);

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

    // if success and user exists, cancel operation
    if (usernameExists.right) return Left(AlreadyExistingUsernameError());

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
      profilePic: ProfilePicGenerator.generateByName(
        name: name,
        surname: surnames,
      ),
    );

    // TODO: try to get image from auth0 service of signup dbuser result

    // create user on database
    final apiCreation = await _userRepository.createUser(user);
    if (apiCreation.isLeft) return Left(apiCreation.left);

    // if correct, then create user on auth system
    final authCreation = await _authRepository.signUp(
      username: username,
      email: email,
      password: password,
    );

    // TODO: check error: al poner mal la contraseña no borra el usuario en BD
    // TODO: hay que revisar las excepciones de la llamada a sign up

    // if error on auth system, delete user on API
    if (authCreation.isLeft) {
      // delete user on api
      final tryDelete = await _userRepository.deleteUser(username);
      if (tryDelete.isLeft) {
        // consistency error!!!
        return Left(ConsistencyError(causingError: tryDelete.left));
      }

      // user successfully deleted on API => send auth error
      return Left(authCreation.left);
    }

    // if success, login with created user

    return const Right(true);
  }
}
