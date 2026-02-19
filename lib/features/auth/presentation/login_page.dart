import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currentProfileProvider);
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Kreatriv Potok V2', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 18),
                  TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
                  const SizedBox(height: 12),
                  TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
                  const SizedBox(height: 18),
                  FilledButton(
                    onPressed: state.isLoading
                        ? null
                        : () => ref.read(currentProfileProvider.notifier).signIn(_emailCtrl.text.trim(), _passCtrl.text.trim()),
                    child: state.isLoading ? const CircularProgressIndicator() : const Text('Sign in'),
                  ),
                  if (state.hasError) const Padding(padding: EdgeInsets.only(top: 12), child: Text('Login failed', style: TextStyle(color: Colors.red))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
