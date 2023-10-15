import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class UnavailableViewModel extends RootViewModel<UnavailableViewState> {
  UnavailableViewModel() : super(Loading());

  @override
  void onAttach() async {}

// todo make try again function
}

sealed class UnavailableViewState extends ViewState {}

class Loading extends UnavailableViewState {}

class Success extends UnavailableViewState {
  Success();
}

class Error extends UnavailableViewState {
  final AppError error;

  Error(this.error);
}
