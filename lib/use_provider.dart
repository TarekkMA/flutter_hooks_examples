import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

T useProvider<T>() {
  return use(_ProviderHook<T>());
}

class _ProviderHook<T> extends Hook<T> {
  const _ProviderHook();

  @override
  _ProviderHookState<T> createState() => _ProviderHookState<T>();
}

class _ProviderHookState<T> extends HookState<T, _ProviderHook<T>> {
  @override
  T build(BuildContext context) {
    return context.watch<T>();
  }
}
