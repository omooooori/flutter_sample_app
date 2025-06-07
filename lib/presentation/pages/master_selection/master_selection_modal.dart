import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'master_selection_body.dart';

class MasterSelectionModal extends ConsumerWidget {
  const MasterSelectionModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollController) {
        return MasterSelectionBody(scrollController: scrollController);
      },
    );
  }
}
