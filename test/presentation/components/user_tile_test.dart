import 'package:elyx_digital_task_app/domain/model/user.dart';
import 'package:elyx_digital_task_app/presentation/users/components/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('UserListTile displays user information properly',
      (WidgetTester tester) async {
    const user = User(
      id: 99,
      email: 'rahul@yopmail.com',
      firstName: 'Rahul',
      lastName: 'Kumar',
      avatar: 'http://example.com/avatar.jpg',
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: ThemeData(useMaterial3: true),
            home: const Scaffold(
              body: UserTile(
                user: user,
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Rahul Kumar'), findsOneWidget);
      expect(find.text('rahul@yopmail.com'), findsOneWidget);
    });
  });
}
