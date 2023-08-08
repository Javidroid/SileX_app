import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class DirectMessagesViewModel extends RootViewModel<DirectMessagesViewState> {
  DirectMessagesViewModel() : super(Loading());

  @override
  void onAttach() async {
    emit(Success());
  }
}

sealed class DirectMessagesViewState extends ViewState {}

class Loading extends DirectMessagesViewState {}

class Success extends DirectMessagesViewState {
  Success();
}

class Error extends DirectMessagesViewState {
  final AppError error;

  Error(this.error);
}
