import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/category.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/repository/social/category_repository.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class CreatePlanViewModel extends RootViewModel<CreatePlanViewState> {
  final CategoryRepository _categoryRepository;

  CreatePlanViewModel(this._categoryRepository) : super(Loading());

  // TfgNavigator get navigator => getIt<TfgNavigator>();

  int get currentPageIndex => _currentPageIndex;
  int _currentPageIndex = 0;

  List<Category> categories = [];

  @override
  void onAttach() async {
    categories = await _getCategories();
    emitValue(Success());
  }

  void nextPage() {
    _currentPageIndex++;
    emitValue(Success());
  }

  Future<List<Category>> _getCategories() async {
    final result = await _categoryRepository.getCategories();
    return result.fold(
      (left) => [],
      (right) => right,
    );
  }

  void finishOperation() {}

  void cancelOperation() {}
}

sealed class CreatePlanViewState extends ViewState {}

class Loading extends CreatePlanViewState {}

class Success extends CreatePlanViewState {
  Success();
}

class Error extends CreatePlanViewState {
  final AppError error;

  Error(this.error);
}
