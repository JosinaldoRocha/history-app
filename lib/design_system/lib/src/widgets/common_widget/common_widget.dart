// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CommonStateWidget<S> extends StatelessWidget {
  const CommonStateWidget({
    Key? key,
    required this.state,
    required this.successWidget,
    this.failure,
    this.loading,
  }) : super(key: key);

  final CommonState<String, S> state;
  final Widget Function(S data) successWidget;
  final Widget? loading;
  final Widget? Function(String)? failure;

  @override
  Widget build(BuildContext context) {
    return state.maybeWhen(
      loadInProgress: () => Center(
        child: loading ?? const CircularProgressIndicator(),
      ),
      loadFailure: (error) => failure != null
          ? failure!(error)!
          : Center(
              child: Text(error),
            ),
      loadSuccess: successWidget,
      orElse: Container.new,
    );
  }
}
