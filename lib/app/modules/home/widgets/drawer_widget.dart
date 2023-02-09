import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/widgets/icon_button_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../dependencies/dependencies.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 70,
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(39),
          topRight: Radius.circular(39),
        ),
      ),
      padding: const EdgeInsets.only(right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxText.bodyBold(
            'Limpar\ncadastros',
            textAlign: TextAlign.center,
            size: 14,
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 208, 208),
              borderRadius: BorderRadius.circular(50),
            ),
            height: 60,
            width: 60,
            child: IconButtonWidget(
              icon: Icons.cleaning_services_outlined,
              size: 35,
              onTap: () {
                ref.read(clearRegisterProvider.notifier).clearRegister();
              },
            ),
          ),
        ],
      ),
    );
  }
}
