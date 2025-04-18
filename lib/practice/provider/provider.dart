import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider({
    super.key,
    required this.data,
    required this.child,
  });

  final T data;
  final Widget child;

  static T of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    print(context.getInheritedWidgetOfExactType());
    final provider = listen ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()!
        : context.getElementForInheritedWidgetOfExactType()?.widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  State<ChangeNotifierProvider<T>> createState() =>
      _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
  extends State<ChangeNotifierProvider<T>>{

  void update() {
    setState(() {

    });
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

}

class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    super.key,
    required this.data,
    required super.child,
  });

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    // return oldWidget.data != data;
    return true;
  }

  static InheritedProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
  }
 }

 class Consumer<T> extends StatelessWidget {
   const Consumer({
     super.key,
     required this.builder,
   });

   final Widget Function(BuildContext, T) builder;

   @override
   Widget build(BuildContext context) {
     final provider = ChangeNotifierProvider.of<T>(context);
     return builder(context, provider);
   }
 }