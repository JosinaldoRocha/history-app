import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(homeProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Histórico',
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: _buildContext(),
      ),
    );
  }

  Widget _buildContext() {
    //String image = 'assets/images/logo.png';
    final homeState = ref.watch(homeProvider);

    if (homeState is LoadingHomeState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (homeState is FailureHomeState) {
      return AlertDialog(
        content: BoxText.body(homeState.errorMessage),
      );
    } else if (homeState is SuccessHomeState) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              title: 'Ver histórico',
              onTap: () {
                Navigator.pushNamed(context, '/history-page');
              },
            ),
            const Space.x5(),
            ButtonWidget(
              title: 'Adicionar item',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/add-item-page');
              },
            ),
            const Space.x5(),
            ButtonWidget(
              title: 'Editar histórico',
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('/edit-history-page');
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
