import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_ui/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    //barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DraggableScrollableSheet(
                          expand: true,
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.7,
                          builder: (context, controller) {
                            return ShareBottomSheet(
                              controller: controller,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text('Open BottomSheet'),
              ),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 34),
                      _getHeaderPost(),
                      SizedBox(height: 24),
                      _getPostContent(),
                    ],
                  );
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff1C1F2E),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'Your Story',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      dashPattern: [30, 10],
      strokeWidth: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/me.jpg'),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(15),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            dashPattern: [30, 10],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/me.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'test',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hossein Ravanbakhsh',
                  style: TextStyle(
                      fontFamily: 'GB', color: Colors.white, fontSize: 12),
                ),
                Text(
                  'Vanak',
                  style: TextStyle(color: Colors.white, fontFamily: 'SM'),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getPostContent() {
    return Container(
      width: 394,
      height: 440,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('images/post_cover.png'),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(width: 6),
                          Text(
                            '2.5 k',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'GB',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(width: 42),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(width: 6),
                          Text(
                            '1.5 k',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'GB',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(width: 42),
                      Image.asset('images/icon_share.png'),
                      SizedBox(width: 42),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 34),
            _getHeaderPost(),
            SizedBox(height: 24),
            _getPostContent(),
          ],
        );
      },
    );
  }
}
