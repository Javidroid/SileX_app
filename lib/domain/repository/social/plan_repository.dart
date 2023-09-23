import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';

abstract interface class PlanRepository {
  Future<Either<AppError, List<Plan>>> getPlans();

  Future<Either<AppError, Plan>> getPlan(String idPlan);

  Future<Either<AppError, bool>> createPlan({
    required Plan plan,
    required String creatorUsername,
  });

  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan);

  Future<Either<AppError, bool>> deletePlan(String idPlan);

  Future<Either<AppError, bool>> signUpToPlan(String idPlan, String username);

  Future<Either<AppError, bool>> quitFromPlan(String idPlan, String username);
}

@Injectable(as: PlanRepository)
class PlanRepositoryImpl implements PlanRepository {
  final RemoteDatasource _remote;

  PlanRepositoryImpl(this._remote);

  @override
  Future<Either<AppError, bool>> createPlan({
    required Plan plan,
    required String creatorUsername,
  }) {
    return _remote.createPlan(plan: plan, creatorUsername: creatorUsername);
  }

  @override
  Future<Either<AppError, bool>> deletePlan(String idPlan) {
    return _remote.deletePlan(idPlan);
  }

  @override
  Future<Either<AppError, Plan>> getPlan(String idPlan) {
    return _remote.getPlan(idPlan);
  }

  @override
  Future<Either<AppError, List<Plan>>> getPlans() {
    return _remote.getPlans();
  }

  @override
  Future<Either<AppError, bool>> quitFromPlan(String idPlan, String username) {
    return _remote.quitFromPlan(idPlan, username);
  }

  @override
  Future<Either<AppError, bool>> signUpToPlan(String idPlan, String username) {
    return _remote.signUpToPlan(idPlan, username);
  }

  @override
  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan) {
    // TODO: implement updatePlan
    throw UnimplementedError();
  }
}
