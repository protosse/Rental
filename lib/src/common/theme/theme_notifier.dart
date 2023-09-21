import 'package:reader/src/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  late ThemService _themService;

  ThemeNotifier() : super();

  Future<void> updateCurrentAppTheme(AppTheme theme) async {
    final success = await _themService.setCurrentAppTheme(theme);

    if (success) {
      state = AsyncValue.data(theme);
    }
  }

  @override
  Future<AppTheme> build() async {
    _themService = ref.read(themeServiceProvider);
    return _themService.getCurrentAppTheme();
  }
}
