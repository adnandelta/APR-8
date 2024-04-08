import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:giphy/screens/Fullscreen.dart';
import 'package:giphy/services/GifService.dart';
import 'package:giphy/models/TrendingModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  bool showButtomLoader = true;
  bool isSearchQuery = false;
  bool isDark = false;
  String searchQuery = '';
  @override
  void initState() {
    super.initState();
    context.read<GiphsModel>().fetchTrendingImages();
    scrollController = ScrollController(keepScrollOffset: true);
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        showButtomLoader = true;
        if (context.read<GiphsModel>().offset <= maxNofOfssets) {
          context.read<GiphsModel>().fetchTrendingImages();
        }
      } else {
        showButtomLoader = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GiphsModel>(builder: (context, model, child) {
      var children = <Widget>[];
      int index = 0;
      GiphyQuery? giphyQuery;
      if (searchQuery == '') isSearchQuery = false;
      if (isSearchQuery == true) {
        giphyQuery = model.giphySearchAlbum;
      } else {
        giphyQuery = model.giphyTrendingAlbum;
      }

      if (giphyQuery != null) {
        for (var element in giphyQuery.data!) {
          index += 1;

          if (element.images?.original?.webp != null) {
            children.add(Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: SizedBox(
                    height: double.parse(
                        element.images!.fixedHeightDownsampled!.height!),
                    child: GestureDetector(
                        child: Image.network(
                          element.images!.fixedHeightDownsampled!.url!,
                        ),
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullImageScreen(
                                          gifData: element,
                                        )),
                              )
                            }))));
          } else {
            children.add(const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Center(child: Text('End of Gifs'))));
          }
        }
        showButtomLoader && !isSearchQuery
            ? children.add(const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ))))
            : children.add(const SizedBox());

        //     children
      }

      return Scaffold(
        appBar: EasySearchBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                icon: Icon(
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                        ? Icons.sunny
                        : Icons.dark_mode)),
          ],
          title: const Text(
            "Trending GIFs",
            style: TextStyle(fontSize: 22),
          ),
          onSearch: (value) {
            isSearchQuery = true;
            searchQuery = value;
            model.searchImages(value);
            scrollController.jumpTo(0);
          },
        ),
        body: Center(
            child: GridView(
          controller: scrollController,
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: children,
        )),
      );
    });
  }
}
