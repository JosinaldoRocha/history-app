import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../register/data/models/user_model.dart';
import '../dependencies/dependencies.dart';
import '../views/states/home_state.dart';
import 'home_button_widget.dart';

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({
    super.key,
    this.user,
  });
  final UserModel? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final auth = FirebaseAuth.instance;

    if (homeState is LoadingHomeState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (homeState is FailureHomeState) {
      return AlertDialog(
        content: BoxText.body(''),
      );
    } else if (homeState is SuccessHomeState) {
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
            BoxText.body(
              'Olá, ${auth.currentUser}',
              color: Colors.black,
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
    } else {
      return Container();
    }
  }
}
