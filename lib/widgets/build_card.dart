import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';
import '../pages/detail_page.dart';

class BuildCard extends StatelessWidget {
  // final BuildContext context;
  final List<Clubs> model;
  UniqueKey myKey = UniqueKey();

  BuildCard({
    Key? key,
    // required this.context,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Column(
              children: [
                Container(
                  key: Key('DemoTag'),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///Image
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: model[index].image,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  Colors.transparent,
                                  BlendMode.colorBurn,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              model[index].country,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 140,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(),
                                  Text(
                                    "${model[index].value} Millionen",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, indent: 2, color: Colors.black26),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    model: model[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
