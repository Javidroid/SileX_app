import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/plan_category.dart';
import 'package:tfg_v2/domain/repository/social/category_repository.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';
import 'package:tfg_v2/utils/datetime_utils.dart';

@Injectable()
class CreatePlanViewModel extends RootViewModel<CreatePlanViewState> {
  final CategoryRepository _categoryRepository;
  final PlanRepository _planRepository;
  final UserRepository _userRepository;

  CreatePlanViewModel(
    this._categoryRepository,
    this._planRepository,
    this._userRepository,
  ) : super(Loading());

  TfgNavigator get navigator => getIt<TfgNavigator>();

  int get currentPageIndex => _currentPageIndex;
  int _currentPageIndex = 0;

  List<PlanCategory> categories = [];
  final Set<String> selectedSubcategories = {};

  bool get isLastPage => currentPageIndex == 2;

  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  String _place = '';

  final placeController = TextEditingController();

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
    print(DateTimeUtils.getDateTimeFromDateAndTime(date: _date, time: _time));
    print(placeController.text);
    final createdPlan = Plan.createPlan(
      // TODO: get current user id
      title: 'title',
      description: 'description',
      place: placeController.text,
      date: DateTimeUtils.getDateTimeFromDateAndTime(date: _date, time: _time),
      categories: selectedSubcategories.toList(),
      maxUsers: 12,
    );

    _planRepository.createPlan(
      plan: createdPlan,
      creatorUsername: 'silenthekid',
    );
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

  void setTime(TimeOfDay time) => _time = time;

  void setDate(DateTime date) => _date = date;

  void setPlace(String place) => _place = place;
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
