import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('LoginPage Text Input Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.enterText(find.byType(TextField).first, 'test@test.com');
    await tester.enterText(find.byType(TextField).last, 'password123');

    expect(find.text('test@test.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);
  });

  testWidgets('LoginPage Button Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    await tester.tap(find.text('Login'));
    await tester.pump();
  });
}
