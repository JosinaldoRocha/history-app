import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/authentication/providers/authentication_providers.dart';
import 'package:my_history_app/app/presentation/home/mixins/home_mixin.dart';
import 'package:my_history_app/app/presentation/home/widgets/home_body_widget.dart';
import '../../../widgets/app_bar_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.args});
  final UserModel args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    final user = widget.args;
    final updateProfilePictureState = ref.watch(updataProfilePictureProvider);

    logoutListen();
    updateProfilePictureListen(widget.args);
    deleteUserListen();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/book.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Column(
          children: [
            AppBarWidget(
              updateProfilePictureState: updateProfilePictureState,
              user: user,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Spacer(),
                    HomeBodyWidget(user: user),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
