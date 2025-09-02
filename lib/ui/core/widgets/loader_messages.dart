import 'package:cinebox_app/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderAndMessage<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 60);
          },
        );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
  void showErrorSnackbar (String message) => _showSnackBar(message, AppColors.redColor);

  void showSuccessSnackbar(String message) => _showSnackBar(message, Colors.green);

  void showInfoSnackbar(String message) => _showSnackBar(message, Colors.lightBlue);
}