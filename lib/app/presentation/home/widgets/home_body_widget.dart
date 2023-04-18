import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../authentication/data/models/user_model.dart';
import 'home_button_widget.dart';

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({
    super.key,
    this.user,
  });
  final UserModel? user;

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
            title: 'Adicionar',
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
