import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/search/search_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class SearchScreen extends RootScreen<SearchViewState, SearchViewModel> {
  const SearchScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    SearchViewState state,
    SearchViewModel viewModel,
  ) {
    return Scaffold(
      body: switch (state) {
        Loading _ => const Center(
            child: CircularProgressIndicator(),
          ),
        Success _ => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Search'),
              ],
            ),
          ),
        Error _ => ErrorCard(error: state.error),
      },
    );
  }
}
