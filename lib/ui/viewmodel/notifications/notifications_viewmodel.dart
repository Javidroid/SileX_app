import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class NotificationsViewModel extends RootViewModel<NotificationsViewState> {
  NotificationsViewModel() : super(Loading());

  @override
  void onAttach() async {
    emit(Success());
  }
}

sealed class NotificationsViewState extends ViewState {}

class Loading extends NotificationsViewState {}

class Success extends NotificationsViewState {
  Success();
}

class Error extends NotificationsViewState {
  final AppError error;

  Error(this.error);
}
