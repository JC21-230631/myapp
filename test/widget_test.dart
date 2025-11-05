
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:myapp/main.dart';
import 'package:myapp/theme_provider.dart';
import 'package:myapp/state/calendar_state.dart';

void main() {
  // Initialize date formatting for the 'ja_JP' locale before running tests.
  setUpAll(() async {
    await initializeDateFormatting('ja_JP', null);
  });

  testWidgets('Navigate to Account Screen smoke test', (WidgetTester tester) async {
    // Build our app with all necessary providers.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => CalendarState()),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that the initial screen's AppBar title is 'カレンダー'.
    expect(find.descendant(of: find.byType(AppBar), matching: find.text('カレンダー')), findsOneWidget);

    // Tap the 'Account' label on the BottomNavigationBar.
    await tester.tap(find.text('アカウント'));
    await tester.pumpAndSettle(); // pumpAndSettle waits for animations to complete.

    // Verify that we have navigated to the Account screen by checking its AppBar title.
    expect(find.descendant(of: find.byType(AppBar), matching: find.text('アカウント')), findsOneWidget);

    // Verify that the '通知設定' list tile is present on the Account screen.
    expect(find.text('通知設定'), findsOneWidget);
  });
}
