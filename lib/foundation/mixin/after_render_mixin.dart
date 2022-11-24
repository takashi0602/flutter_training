import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin AfterRenderMixin on HookConsumerWidget {
  String get pageLocation;

  void afterRender(BuildContext context, bool Function() isMounted);

  Widget buildAfterSetup(BuildContext context, WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouter.of(context).location;
    final isMounted = useIsMounted();
    useEffect(() {
      if (currentLocation != pageLocation) return null;
      WidgetsBinding.instance.endOfFrame.then(
        (_) => afterRender(context, isMounted),
      );
      return null;
    }, [currentLocation]);
    return buildAfterSetup(context, ref);
  }
}
