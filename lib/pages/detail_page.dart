// Der Club Real Madrid aus Spanien hat einen Wert von 570 Millionen Euro.
import 'dart:ui';

import 'package:allaboutapps/common/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../models/model.dart';

class DetailPage extends StatelessWidget {
  // final BuildContext context;
  final Clubs model;

  const DetailPage({
    Key? key,
    // required this.context,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Common.greenColor),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Image
          Container(
            color: const Color(0xff333333),
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppLocalizations.of(context)?.translate('part_1') ??
                        ' ',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: model.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' ${AppLocalizations.of(context)?.translate('part_2') ?? ' '} ${model.country} ${AppLocalizations.of(context)?.translate('part_3') ?? ' '} ${model.value} ${AppLocalizations.of(context)?.translate('part_4') ?? ' '}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
