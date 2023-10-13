import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';

class CategotySection extends StatelessWidget {
  final List<Link> links;

  const CategotySection({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: ListView.builder(
          primary: false,
          scrollDirection: Axis.horizontal,
          itemCount: links.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final Link link = links[index];
            if (index < 10) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '${link.title}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
