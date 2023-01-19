import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Draft', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'GB'),),
                  Text('Gallery', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'GB'),),
                  Text('Take', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'GB'),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/item$index.png'),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 70)),
      ],
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      height: 394,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/item8.png'),
        ),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: 18),
      child: Row(
        children: [
          Text('Posts', style: TextStyle(color: Colors.white, fontFamily: 'GB', fontSize: 24),),
          SizedBox(width: 10),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text('Next', style: TextStyle(color: Colors.white, fontFamily: 'GB', fontSize: 20),),
          SizedBox(width: 10),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }

}
