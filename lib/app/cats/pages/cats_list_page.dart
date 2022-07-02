import 'package:cats/app/cats/bloc/cats_bloc.dart';
import 'package:cats/app/cats/pages/cat_detail_page.dart';
import 'package:cats/app/cats/pages/cats_list_page_theme.dart';
import 'package:cats/core/constants.dart';
import 'package:cats/domain/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats/core/widgets/text.dart';
import 'package:cats/core/themes/text_theme.dart';

class CatsListPage extends StatefulWidget {
  const CatsListPage({Key? key}) : super(key: key);

  static const routeName = '/CatsListPage';

  @override
  State<CatsListPage> createState() => _CatsListPageState();
}

class _CatsListPageState extends State<CatsListPage> {
  late CatsBloc bloc;
  late TextEditingController controller;
  late ScrollController _scrollController;
  late List<Cat> _listCats;

  @override
  void initState() {
    bloc = BlocProvider.of<CatsBloc>(context);
    controller = TextEditingController(text: '');
    _listCats = [];
    bloc.add(const OnCatsEvent(null));
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                key: const Key('character-list-filter'),
                textInputAction: TextInputAction.search,
                controller: controller,
                onSubmitted: (value) {
                  bloc.add(OnCatsEvent(value));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<CatsBloc, CatsState>(
                builder: (context, state) {
                  if (state is SuccessfulState) {
                    _listCats.clear();
                    _listCats.addAll(state.characters);
                    return _CharacterList(scrollController: _scrollController, listCharacters: _listCats);
                  } else if (state is LoadingState) {
                    return _CharacterList(scrollController: _scrollController, listCharacters: _listCats);
                  } else if (state is ErrorState) {
                    return Expanded(
                        key: const Key('character-list-empty'),
                        child: Center(child: Text(state.message)));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterList extends StatelessWidget {
  const _CharacterList({
    Key? key,
    required ScrollController scrollController,
    required List<Cat> listCharacters,
  }) : _scrollController = scrollController, _listCats = listCharacters, super(key: key);

  final ScrollController _scrollController;
  final List<Cat> _listCats;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        key: const Key('character-list'),
        itemCount: _listCats.length,
        itemBuilder: (BuildContext context, int index) {
          return CatContainer(
            cat: _listCats[index],
            onTap: (character) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CatDetailPage(cat: character),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CatContainer extends StatelessWidget {
  final Cat cat;
  final Function(Cat) onTap;

  const CatContainer(
      {super.key, required this.cat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => onTap(cat),
          child: Row(
            children: [
              Image.network(
                cat.image??IMG,
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RMText(
                    text: cat.name ?? '',
                    type: RMTextTypes.cardTitle,
                  ),
                  listSeparator,
                  RMText(
                    text: cat.origin??'',
                    type: RMTextTypes.card1,
                  ),
                  listSeparator,
                  RMText(
                    text: 'Inteligencia: ${cat.intelligence??0}',
                    type: RMTextTypes.cardLabel,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
