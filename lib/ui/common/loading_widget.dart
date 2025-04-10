import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;

  const LoadingWidget({
    super.key,
    this.size = 96.0,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Image.asset(
          'assets/icons/ic_loading.png',
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
