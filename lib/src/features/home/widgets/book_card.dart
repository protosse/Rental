import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';

class BookCard extends ConsumerWidget {
  final String img;
  final double width;
  final Entry entry;

  const BookCard({
    super.key,
    required this.img,
    required this.entry,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        elevation: 4,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () {},
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) => const LoadingWidget(
                isImage: true,
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/place.png',
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
