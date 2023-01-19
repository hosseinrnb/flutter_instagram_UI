import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({this.controller, Key? key}) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 40.0, sigmaX: 40),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color.fromRGBO(255, 255, 255, 0.1),
          child: _getGridContent(context),
        ),
      ),
    );
  }

  Widget _getGridContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GB',
                            color: Colors.white),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset('images/icon_search.png'),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search User',
                                hintStyle: TextStyle(color: Colors.white),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getItemGrid();
                },
                childCount: 100,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 110,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 100)),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              child: Text(
                'Send',
                style: TextStyle(fontFamily: 'GB', fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset('images/me.jpg'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Hossein',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontFamily: 'GB', fontSize: 12),
        ),
      ],
    );
  }
}

// GridView.builder(
// controller: controller,
// itemCount: 30,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 4,
// crossAxisSpacing: 20,
// mainAxisSpacing: 20,
// ),
// itemBuilder: (BuildContext context, index) {
// return Container(
// color: Colors.red,
// );
// },
// )
