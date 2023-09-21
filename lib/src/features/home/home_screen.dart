import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void loadData() {
    ref.read(homeFeedNotifierProvider.notifier).fetch();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(homeFeedNotifierProvider)
          .maybeWhen(orElse: () => loadData(), data: (_) => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeDataState = ref.watch(homeFeedNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(microseconds: 500),
        child: homeDataState.maybeWhen(
          orElse: () => const EmptyView(),
          loading: () => const LoadingWidget(),
          data: (data) {
            final popular = data.popularFeed;
            final recent = data.recentFeed;
            return RefreshIndicator(
                child: ListView(
                  children: [
                    PopularSection(entries: popular.feed?.entry ?? []),
                    const SizedBox(height: 20.0),
                    const SectionTitle(title: 'Categories'),
                    CategotySection(links: popular.feed?.link ?? []),
                    const SizedBox(height: 20.0),
                    const SectionTitle(title: 'Recently Add'),
                    const SizedBox(height: 20.0),
                    NewSection(entries: recent.feed?.entry ?? []),
                  ],
                ),
                onRefresh: () async => loadData());
          },
        ),
      ),
    );
  }
}
