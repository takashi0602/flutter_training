import 'package:flutter/material.dart';
import 'package:flutter_training/foundation/mixin/after_render_mixin.dart';
import 'package:flutter_training/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstPage extends HookConsumerWidget with AfterRenderMixin {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    moveAfterRender(
      context,
      const FirstRoute().location,
      const HomeRoute().location,
    );

    return const Scaffold();
  }
}
