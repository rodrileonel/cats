import 'package:flutter/material.dart';

class RMSelectableDialog {
  static Future<String?> show(
    BuildContext context, {
    required String title,
    required List<String> items,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: 300,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: Key('alert-dialog-$index'),
                  title: Text(items[index]),
                  onTap: () {
                    Navigator.of(context).pop(items[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
