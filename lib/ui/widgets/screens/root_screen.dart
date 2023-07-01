import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

abstract class RootScreen<S extends ViewState> extends StatelessWidget {
  const RootScreen({super.key});

  abstract final RootViewModel<S> viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder(
        bloc: viewModel,
        builder: (context, state) => buildView(context, state as S),
      ),
    );
  }

  Widget buildView(BuildContext context, S state);
}
