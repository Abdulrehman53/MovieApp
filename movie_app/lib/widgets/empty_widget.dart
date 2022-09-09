import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 0.0,
      height: 0.0,
    );
  }
}

class EmptySliver extends StatelessWidget {
  const EmptySliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Empty(),
    );
  }
}
