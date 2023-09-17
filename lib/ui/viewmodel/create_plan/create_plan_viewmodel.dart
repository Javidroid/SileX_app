import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan_category.dart';
import 'package:tfg_v2/domain/repository/social/category_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class CreatePlanViewModel extends RootViewModel<CreatePlanViewState> {
  final CategoryRepository _categoryRepository;

  CreatePlanViewModel(this._categoryRepository) : super(Loading());

  TfgNavigator get navigator => getIt<TfgNavigator>();

  int get currentPageIndex => _currentPageIndex;
  int _currentPageIndex = 0;

  List<PlanCategory> categories = [];
  final Set<String> selectedSubcategories = {};

  bool get isLastPage => currentPageIndex == 2;

  @override
  void onAttach() async {
    categories = await _getCategories();
    emitValue(Success());
  }

  void nextPage() {
    _currentPageIndex++;
    emitValue(Success());
  }

  Future<List<PlanCategory>> _getCategories() async {
    final result = await _categoryRepository.getCategories();
    return result.fold(
      (left) => [],
      (right) => right,
    );
  }

  void finishOperation() {
    // TODO: enviar llamada a backend
    navigator.replaceToHome();
  }

  void cancelOperation() {}

  void addOrDeletePlanCategory({
    required String subcategory,
    bool isAdd = true,
  }) {
    isAdd
        ? selectedSubcategories.add(subcategory)
        : selectedSubcategories.remove(subcategory);
    emitValue(Success());
  }
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
