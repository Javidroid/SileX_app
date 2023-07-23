import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';

abstract interface class PlanRepository {
  Future<Either<AppError, Set<Plan>>> getPlans();

  Future<Either<AppError, Plan>> getPlan(String idPlan);

  Future<Either<AppError, bool>> createPlan(Plan plan);

  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan);

  Future<Either<AppError, bool>> deletePlan(String idPlan);

  Future<Either<AppError, bool>> signUpToPlan(String idPlan, String username);

  Future<Either<AppError, bool>> quitFromPlan(String idPlan, String username);
}

@Injectable(as: PlanRepository)
class PlanRepositoryImpl implements PlanRepository {
  final RemoteDatasource _remoteDatasource;

  PlanRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<AppError, bool>> createPlan(Plan plan) {
    // TODO: implement createPlan
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> deletePlan(String idPlan) {
    // TODO: implement deletePlan
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Plan>> getPlan(String idPlan) {
    // TODO: implement getPlan
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Set<Plan>>> getPlans() {
    return _remoteDatasource.getPlans();
  }

  @override
  Future<Either<AppError, bool>> quitFromPlan(String idPlan, String username) {
    // TODO: implement quitFromPlan
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> signUpToPlan(String idPlan, String username) {
    // TODO: implement signUpToPlan
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan) {
    // TODO: implement updatePlan
    throw UnimplementedError();
  }
}
