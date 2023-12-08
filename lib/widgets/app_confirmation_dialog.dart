import 'package:flutter/material.dart';

import '../../../resources/resources.dart';
import '../extensions/extensions.dart';
import 'app_dialog.dart';
import 'widgets.dart';

class AppConfirmationDialog extends AppDialog {
  const AppConfirmationDialog(
      {super.key,
      this.onConfirmClicked,
      this.onCancelClicked,
      this.leftTitle,
      this.rightTitle,
      this.title,
      this.description,
      this.confirmButtonContent,
      this.cancelButtonContent})
      : super(padding: EdgeInsets.zero);

  final VoidCallback? onConfirmClicked;
  final VoidCallback? onCancelClicked;
  final String? leftTitle;
  final String? rightTitle;
  final String? title;
  final String? description;
  final String? confirmButtonContent;
  final String? cancelButtonContent;

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      width: 316,
      decoration: BoxDecoration(
          color: AppColors.santaWhite1,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [Decorations.shadowA3Down()]),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: (title ?? 'Alert title').text(
                color: Colors.black,
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 20, right: 20.0, top: 8.0, bottom: 28.0),
            child: (description ?? 'Description').text(
                color: Colors.black,
                textAlign: TextAlign.center,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          _renderButtons(),
        ],
      ),
    );
  }

  Widget _renderButtons() {
    return Row(
      children: [
        if (onCancelClicked != null)
          Expanded(
            child: CustomMaterialButton(
              height: 50,
              onTap: onCancelClicked,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: (cancelButtonContent ?? 'Cancel').text(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
        if (onConfirmClicked != null)
          Expanded(
            child: CustomMaterialButton(
              height: 50,
              onTap: onConfirmClicked,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: (confirmButtonContent ?? 'Confirm').text(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
