import 'package:flutter_test/flutter_test.dart';
import 'package:hey_there/screens/home_page_screen.dart';

void main() {
  testWidgets('HomePageScreen has a title', (tester) async {
    await tester.pumpWidget(const HomePageScreen(title: 'Test Task'));
    final titleFinder = find.text('Test Task');
    expect(titleFinder, findsOneWidget);
  });
}
