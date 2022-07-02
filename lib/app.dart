import 'package:cats/app/cats/bloc/cats_bloc.dart';
import 'package:cats/app/cats/pages/cats_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CatsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RickMorty App',
        initialRoute: CatsListPage.routeName,
        routes: {
          CatsListPage.routeName: (_) => const CatsListPage(),
        },
      ),
    );
  }
}
