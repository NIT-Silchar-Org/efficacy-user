import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClubDetail extends StatefulWidget {
  static const routename = 'account - screen';

  const ClubDetail({Key? key}) : super(key: key);

  @override
  _ClubDetailState createState() => _ClubDetailState();
}

class _ClubDetailState extends State<ClubDetail>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("SlidingUpPanelExample"),
      //   backgroundColor: Colors.transparent,

      // ),
      body: SlidingUpPanel(
        panel: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 35, 35, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 44,
                      height: 44,
                      child: Image.network(
                        'https://res.cloudinary.com/devncode/image/upload/v1575267757/production_devncode/community/1575267756355.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.bell,
                          color: Colors.black,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'GDSC NITS',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(218, 229, 255, 1),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        color: Colors.blueAccent,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.add_to_photos_outlined, size: 15),
                          SizedBox(width: 3),
                          Text(
                            'Subscribe',
                            style: TextStyle(
                              color: Color.fromRGBO(33, 63, 141, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TabBar(
                    controller: _controller,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Color.fromRGBO(24, 0, 0, 0.17),
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 35.0),
                    ),
                    indicatorWeight: 0,
                    labelColor: const Color.fromRGBO(25, 28, 29, 0.7),
                    tabs: const [
                      Tab(
                        text: 'About',
                      ),
                      Tab(
                        text: 'Events',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: const [
                      Center(child: Text('people')),
                      Text('Person')
                    ],
                    controller: _controller,
                  ),
                ),
              ],
            ),
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        minHeight: devicesize.height * 0.75,
        maxHeight: devicesize.height,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: devicesize.width,
                height: devicesize.height * 0.28,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gdsc_android.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
