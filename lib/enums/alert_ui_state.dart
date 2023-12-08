import 'package:flutter/material.dart';

import '../core/core.dart';
import '../widgets/widgets.dart';

enum AlertUiState {
  Unknown,
  Network,
}

extension AppErrorExtension on AppError {
  AlertUiState asAlertUiState() {
    switch (this) {
      case AppError.Network:
        return AlertUiState.Network;
      default:
        return AlertUiState.Unknown;
    }
  }
}

extension AlertUiStateExtension on AlertUiState {
  void show(BuildContext context,
      {VoidCallback? onConfirmClicked, VoidCallback? onCancelClicked}) {
    showDialog(
      context: context,
      builder: (_) => AppConfirmationDialog(
        title: title,
        description: description,
        confirmButtonContent: primary,
        onCancelClicked: onCancelClicked != null
            ? () {
                onCancelClicked.call();
                Navigator.of(context).pop();
              }
            : null,
        onConfirmClicked: () {
          onConfirmClicked?.call();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  String? get title {
    switch (this) {
      case AlertUiState.Unknown:
        return "An unknown error\nhas occurred :(";
      case AlertUiState.Network:
        return "Connection failed";
      default:
        return null;
    }
  }

  String? get description {
    switch (this) {
      case AlertUiState.Unknown:
        return "Please try again.";
      case AlertUiState.Network:
        return "It seems the internet connection is unstable.\nPlease try again later.";
      default:
        return null;
    }
  }

  String? get primary {
    switch (this) {
      case AlertUiState.Unknown:
      case AlertUiState.Network:
        return "Confirm";
      default:
        return null;
    }
  }
}
