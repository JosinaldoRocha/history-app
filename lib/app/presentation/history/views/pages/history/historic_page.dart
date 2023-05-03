import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/history/widgets/history/history_list_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class HistoricPage extends ConsumerStatefulWidget {
  const HistoricPage({
    required this.args,
    super.key,
  });
  final UserModel args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoricPageState();
}

class _HistoricPageState extends ConsumerState<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BoxText.body(
          'Histórico',
          size: 18,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        child: HistoryListWidget(id: widget.args.id!),
      ),
    );
  }
}
