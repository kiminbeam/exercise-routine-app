import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(sessionProvider.notifier).autoLogin();

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/컨벤셔널 데드리프트.gif',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,

        ),
      ),
    );
  }
}
