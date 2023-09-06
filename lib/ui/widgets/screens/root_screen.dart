import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

abstract class RootScreen<T extends ViewState, V extends RootViewModel<T>>
    extends StatelessWidget {
  const RootScreen({super.key, this.param1, this.param2});

  final dynamic param1;
  final dynamic param2;

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<V>(param1: param1, param2: param2);

    return BlocBuilder<V, T>(
      bloc: viewModel,
      builder: (context, state) {
        return buildView(context, state, viewModel);
      },
    );
  }

  Widget buildView(BuildContext context, T state, V viewModel);
}

abstract class RootScreenStateful<T extends ViewState,
    V extends RootViewModel<T>> extends StatefulWidget {
  const RootScreenStateful({super.key});

  @override
  RootScreenState<T, V, RootScreenStateful<T, V>> createState();
}

abstract class RootScreenState<T extends ViewState, V extends RootViewModel<T>,
    K extends RootScreenStateful<T, V>> extends State<K> {
  late final V viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<V>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<V, T>(
      bloc: viewModel,
      builder: (context, state) {
        return buildView(context, state, viewModel);
      },
    );
  }

  Widget buildView(BuildContext context, T state, V viewModel);
}
