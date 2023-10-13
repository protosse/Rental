import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';

class BookCard extends ConsumerWidget {
  final String img;
  final double? width;
  final String? tag;

  const BookCard({
    super.key,
    required this.img,
    this.width,
    this.tag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConditionalWrap(
      condition: tag != null,
      wrapper: (child) => Hero(tag: tag!, child: child),
      child: SizedBox(
      width: width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        elevation: 4,
        child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
      ),
    );
  }
}
