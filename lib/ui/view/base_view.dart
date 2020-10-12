import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;
  final T viewModel;
  const BaseView({@required this.builder, this.onModelReady, this.viewModel});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    model = widget.viewModel ?? locator<T>();
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.viewModel != null
        ? widget.builder(context, model, null)
        : ChangeNotifierProvider<T>(
            create: (context) => model,
            child: widget.builder(context, model, null),
          );
  }
}
