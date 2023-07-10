import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/local/local_datasource.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  final _repository = getIt<LocalDatasource>();

  HomeViewModel() : super(Loading());

  @override
  void onAttach() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await _repository.getEnvironment();
    response.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success()),
    );
  }

  void setCurrentPageIndex(int i) {
    emitValue(Success(currentPageIndex: i));
  }
}

sealed class HomeViewState extends ViewState {}

class Loading extends HomeViewState {}

class Success extends HomeViewState {
  Success({this.currentPageIndex = 0});

  final int currentPageIndex;
}

class Error extends HomeViewState {
  final AppError error;

  Error(this.error);
}
