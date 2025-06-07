import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';
import 'package:layerx_technical_problem/presentation/parts/layerx_app_bar.dart';
import 'widgets/register_screen_content.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: colorScheme.surface,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    );

    final searchState = ref.watch(registerScreenViewModelProvider);
    final viewModel = ref.read(registerScreenViewModelProvider.notifier);

    useEffect(() {
      Future.microtask(() => viewModel.init());
      return null;
    }, []);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        appBar: const LayerXAppBar(title: '検索画面'),
        body: SafeArea(
          child: RegisterScreenContent(
            state: searchState,
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}
