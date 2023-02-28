import 'package:flutter_test/flutter_test.dart';
import 'package:hey_there/src/screens/home_page_screen.dart';

void main() {
  ///Docs: https://docs.flutter.dev/cookbook/testing/widget/introduction
  testWidgets('HomePageScreen has a title', (tester) async {
    await tester.pumpWidget(const HomePageScreen(title: 'Test Task'));
    final titleFinder = find.text('Test Task');
    expect(titleFinder, findsOneWidget);
  });
}
