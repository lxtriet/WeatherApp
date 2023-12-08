import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../generated/l10n.dart';
import '../../../resources/resources.dart';

class CityInputView extends StatefulWidget {
  final Function(String) onSubmitted;
  const CityInputView({super.key, required this.onSubmitted});

  @override
  State<CityInputView> createState() => _CityEntryState();
}

class _CityEntryState extends State<CityInputView> {
  late TextEditingController cityEditController;

  @override
  void initState() {
    super.initState();
    cityEditController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 00),
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [Decorations.shadowA3Down()],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
                controller: cityEditController,
                style: ''.style(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                decoration: InputDecoration.collapsed(
                    hintStyle: ''.style(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    hintText: S.of(context).enter_city_or_zipcode),
                onSubmitted: widget.onSubmitted),
          ),
        ],
      ),
    );
  }
}
