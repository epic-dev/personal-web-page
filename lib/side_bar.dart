import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final double width;
  final Function onSelectItem;

  const SideBar({Key key, this.width, this.onSelectItem}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<Map<String, dynamic>> sideBarItems = [
    {
      'id': 'HomeItem',
      'title': 'HOME',
      'routeName': '',
      'isActive': true, // TODO
    },
    {
      'id': 'AboutItem',
      'title': 'ABOUT',
      'routeName': '',
      'isActive': false,
    },
    {
      'id': 'CVItem',
      'title': 'CV',
      'routeName': '',
      'isActive': false, // TODO
    },
    {
      'id': 'ContactItem',
      'title': 'CONTACT',
      'routeName': '',
      'isActive': false, // TODO
    },
  ];
  var activeItemIndex = 0;
  void _selectItem(String id) {
    var i = sideBarItems.indexWhere((element) => element['id'] == id);
    setState(() {
      activeItemIndex = i;
    });
    widget.onSelectItem(index: i);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: sideBarItems.length,
        itemBuilder: (ctx, index) => _SideBarItem(
          id: sideBarItems[index]['id'],
          title: sideBarItems[index]['title'],
          routeName: sideBarItems[index]['routeName'],
          isActive: index == activeItemIndex,
          onSelect: _selectItem,
        ),
      ),
    );
  }
}

class _SideBarItem extends StatelessWidget {
  final String id;
  final String title;
  final String routeName;
  final bool isActive;
  final Function onSelect;

  const _SideBarItem({Key key, this.id, this.title, this.routeName, this.isActive, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: RotatedBox(
        quarterTurns: 3,
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent), // removes ripple effect
          ),
          child: Text(
            title,
            style: TextStyle(
              shadows: [Shadow(blurRadius: isActive ? 2 : 0, color: Colors.blueGrey)],
              color: Colors.blueGrey.shade700,
              fontFamily: 'SourceCodePro',
              fontSize: 20,
            ),
          ),
          onPressed: () => onSelect(id),
        ),
      ),
    );
  }
}
