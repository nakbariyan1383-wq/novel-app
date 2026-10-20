import 'package:flutter_test/flutter_test.dart';
import 'package:novel_app/main.dart';

void main() {
  testWidgets('App renders home page', (WidgetTester tester) async {
    await tester.pumpWidget(const NovelApp());
    expect(find.text('NovelApp'), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
  });
}
