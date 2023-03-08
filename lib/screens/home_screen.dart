import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:ending_wars/screens/search_result_screen.dart';
import 'package:ending_wars/widgets/card_root_resources_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BaseConfig baseConfig = BaseConfig();
  final controller = TextEditingController();
  final searchInProgress = ValueNotifier<bool>(false);
  List<String> suggestions = [];
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> root;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: Column(children: [
              Image.asset(
                'assets/star_wars_logo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
              ),
              TextFormField(
                style: const TextStyle(color: Constants.brightYellow),
                cursorColor: Constants.brightRed,
                controller: controller,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Constants.brightRed),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Constants.brightYellow),
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Constants.brightYellow),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Constants.brightRed,
                    )),
                onChanged: (text) {
                  setState(() {
                    suggestions.clear();
                    if (text.isNotEmpty) {
                      searchInProgress.value = true;
                      searchTerm = text;
                    } else {
                      searchInProgress.value = false;
                    }
                  });
                },
              ),
              ValueListenableBuilder(
                  valueListenable: searchInProgress,
                  builder: (context, searching, child) {
                    return Container(
                        child: searching
                            ? SizedBox(
                                height: 150,
                                child: FutureBuilder(
                                    future: baseConfig.getFuzzyData(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        suggestions = baseConfig.fuzzySearch(
                                            searchTerm, snapshot.data!);
                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Constants.brightRed),
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: suggestions.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    if (suggestions.isNotEmpty) {
                                                      return Container(
                                                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                        decoration:
                                                            const BoxDecoration(border: Border(bottom: BorderSide(color: Constants.brightYellow)),),
                                                        child: Card(
                                                          color: Constants
                                                              .darkBlue,
                                                          child: InkWell(
                                                            onTap: () {
                                                              String resourceNameType = suggestions[index].substring(0, suggestions[index].indexOf(':')).toLowerCase();
                                                              String searchedResult = suggestions[index].substring(suggestions[index].indexOf(':') + 2,);
                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultScreen(resourceNameType: resourceNameType, searchResult: searchedResult,)));
                                                            },
                                                            child: ListTile(
                                                              title: Text(suggestions[index],
                                                                style: const TextStyle(
                                                                    color: Constants.brightYellow,
                                                                    fontSize: 16,
                                                                    fontStyle: FontStyle.italic),
                                                              ),
                                                              //subtitle: Text(items[index]),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return const ListTile(
                                                        title: Text('No matches'),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Column(
                                          children: const [
                                             CircularProgressIndicator(
                                               color: Constants.brightYellow,
                                             ),
                                            Spacer(),
                                          ],
                                        );
                                      }
                                    }),
                              )
                            : const SizedBox(
                                height: 10,
                              ));
                  }),
              const SizedBox(height: 30),
              FutureBuilder(
                future: baseConfig.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    root = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: root.length,
                        itemBuilder: (context, index) {
                          final key = root.keys.elementAt(index);
                          final value = root[key];
                          return CardRootResources(
                              resourceNameType: key, resourceStringUrl: value!);
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: Constants.brightYellow,
                    );
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}