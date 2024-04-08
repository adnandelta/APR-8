import 'package:flutter/material.dart';
import 'package:giphy/models/TrendingModel.dart';

class FullImageScreen extends StatefulWidget {
  const FullImageScreen({super.key, required this.gifData});

  final GifData gifData;

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Image.network(widget.gifData.images!.original!.url!)));
  }
}
