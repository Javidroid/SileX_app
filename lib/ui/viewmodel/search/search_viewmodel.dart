import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class SearchViewModel extends RootViewModel<SearchViewState> {
  SearchViewModel() : super(Loading());

  @override
  void onAttach() async {
    emit(Success());
  }
}

sealed class SearchViewState extends ViewState {}

class Loading extends SearchViewState {}

class Success extends SearchViewState {
  Success();
}

class Error extends SearchViewState {
  final AppError error;

  Error(this.error);
}
