import 'package:bloc_test/bloc_test.dart';
import 'package:cats/app/cats/bloc/cats_bloc.dart';
import 'package:cats/app/cats/pages/cats_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cats/core/di.dart' as di;

class MockCharactersBloc extends MockBloc<CatsEvent, CatsState>
    implements CatsBloc {}

void main() {
  late MockCharactersBloc? bloc;

  setUpAll(() {
    di.init();
    bloc = MockCharactersBloc();
  });

  testWidgets('Render listpage correctly', (WidgetTester tester) async {
    when(() => bloc?.state).thenReturn(const SuccessfulState([]));

    await tester.pumpWidget(
      BlocProvider<CatsBloc>(
        create: (context) => bloc!,
        child: const MaterialApp(
          title: 'Widget Test',
          home: Scaffold(body: CatsListPage()),
        ),
      ),
    );
    expect(find.byKey(const Key('character-list-filter')), findsOneWidget);
    expect(
        find.byKey(const Key('character-list-gender-button')), findsOneWidget);
    expect(
        find.byKey(const Key('character-list-status-button')), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('character-list')), findsOneWidget);
  });

  testWidgets('Render listpage empty', (WidgetTester tester) async {
    when(() => bloc?.state).thenReturn(const ErrorState(''));

    await tester.pumpWidget(
      BlocProvider<CatsBloc>(
        create: (context) => bloc!,
        child: const MaterialApp(
          title: 'Widget Test',
          home: Scaffold(body: CatsListPage()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('character-list-empty')), findsOneWidget);
  });
}
