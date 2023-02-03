import 'package:efficacy_user/utils/basemodel.dart';
import 'package:efficacy_user/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onDispose;

  const BaseView({Key? key, 
    required this.builder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  @override
  createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    var onModelReady = widget.onModelReady;
    if (onModelReady != null) {
      onModelReady(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    var onDispose = widget.onDispose;
    if (onDispose != null) {
      onDispose(model);
    }
    super.dispose();
  }

  @override
  Widget build(context) {
    /*return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );*/
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      value: model,
      //builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
