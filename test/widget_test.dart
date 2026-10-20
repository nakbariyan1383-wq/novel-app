import 'package:flutter_test/flutter_test.dart';
import 'package:novel_app/main.dart';

void main() {
  testWidgets('splash renders app title', (tester) async {
    await tester.pumpWidget(const NovelApp());
    expect(find.text('رومان‌ورس'), findsWidgets);
  });
}
