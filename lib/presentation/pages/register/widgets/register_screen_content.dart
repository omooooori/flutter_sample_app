import 'package:flutter/material.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_state.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';
import 'package:layerx_technical_problem/presentation/pages/register/widgets/master_selection_button.dart';
import 'package:layerx_technical_problem/presentation/pages/register/widgets/register_error_view.dart';
import 'package:layerx_technical_problem/presentation/pages/register/widgets/selected_masters_list.dart';

class RegisterScreenContent extends StatelessWidget {
  final RegisterScreenState state;
  final RegisterScreenViewModel viewModel;

  const RegisterScreenContent({
    super.key,
    required this.state,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      _ when state.isLoading => const Center(
          child: CircularProgressIndicator(),
        ),
      _ when state.hasError => RegisterErrorView(
          onRetry: () => viewModel.init(),
        ),
      _ => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MasterSelectionButton(),
              const SizedBox(height: 16),
              SelectedMastersList(
                selectedMastersByType: state.selectedMastersByType,
                onMasterDeleted: viewModel.toggleMasterSelection,
              ),
            ],
          ),
        ),
    };
  }
}
