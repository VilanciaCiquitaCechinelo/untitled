import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/test/widget_tests/login_page_test.dart';


void main() {
  testWidgets('Login page widgets test', (WidgetTester tester) async {
    // Build our LoginPage widget wrapped in a MaterialApp
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Find the TextFields by their labelTexts
    final emailTextField = find.byWidgetPredicate(
            (widget) => widget is TextField && widget.decoration?.labelText == 'Email');
    final passwordTextField = find.byWidgetPredicate(
            (widget) => widget is TextField && widget.decoration?.labelText == 'Password');
    final loginButton = find.byType(ElevatedButton);

    // Test if the widgets are present
    expect(emailTextField, findsOneWidget);
    expect(passwordTextField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    // Test entering text into the TextFields
    await tester.enterText(emailTextField, 'test@example.com');
    await tester.enterText(passwordTextField, 'password123');

    // Test tap on the login button
    await tester.tap(loginButton);
    // Await for the animation to complete
    await tester.pump();

    // You can add further assertions based on the login logic
    // For demonstration purposes, let's expect that the login logic displays a SnackBar
    expect(find.text('Login Successful'), findsOneWidget); // Assuming a success SnackBar is shown after login
  });
}
