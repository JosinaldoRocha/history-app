import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';
import 'package:my_history_app/app/modules/home/widgets/home_button_widget.dart';
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
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Olá, $args!',
          color: Colors.white,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 181, 214, 181),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: _buildContext(),
        ),
      ),
    );
  }

  Widget _buildContext() {
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
            HomeButtonWidget(
              title: 'Histórico',
              icon: Icons.history,
              onTap: () {
                Navigator.pushNamed(context, '/history-page');
              },
            ),
            const Space.x5(),
            HomeButtonWidget(
              title: 'Adicionar',
              icon: Icons.add,
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/add-item-page');
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
