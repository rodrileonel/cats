import 'package:cats/app/cats/pages/cats_list_page_theme.dart';
import 'package:cats/core/constants.dart';
import 'package:cats/domain/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:cats/core/themes/text_theme.dart';
import 'package:cats/core/widgets/text.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({Key? key, required this.cat})
      : super(key: key);

  static const routeName = '/CatDetailPage';

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  cat.image??IMG,
                ),
              ),
              listSeparator,
              Expanded(
                child: ListView(
                  children: [
                    RMText(
                      text: cat.name ?? '',
                      type: RMTextTypes.header,
                    ),
                    listSeparator,
                    RMText(
                      text: cat.origin??'',
                      type: RMTextTypes.cardTitle,
                    ),
                    listSeparator,
                    RMText(
                      text: cat.description??'',
                      type: RMTextTypes.infoTitle,
                      maxLines: null,
                    ),
                    listSeparator,
                    RMText(
                      text: 'Inteligencia: ${cat.intelligence??0}',
                      type: RMTextTypes.cardTitle,
                    ),
                    listSeparator,
                    RMText(
                      text: 'Adaptabilidad: ${cat.adaptability??0}',
                      type: RMTextTypes.cardTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
