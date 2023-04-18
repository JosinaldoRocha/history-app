import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import 'home_button_widget.dart';

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({
    super.key,
    required this.user,
  });
  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeButtonWidget(
            title: 'Histórico',
            icon: Icons.history,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/history-page',
                arguments: user,
              );
            },
          ),
          const Space.x5(),
          HomeButtonWidget(
            title: 'Adicionar história',
            icon: Icons.add,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/add-item-page',
                arguments: user,
              );
            },
          ),
        ],
      ),
    );
  }
}
