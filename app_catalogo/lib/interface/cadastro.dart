import 'dart:ui';
import 'package:flutter/material.dart';

// Tab1 and Tab2 classes (unchanged from previous code)
class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Filmes'),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Séries'),
    );
  }
}

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage>
    with SingleTickerProviderStateMixin {
  bool showButton = false;
  List<Widget> containers = []; //provavelmente os videos sao adicionados aqui
  //MyApp funcoes = MyApp(); // Assuming this function is defined somewhere else

  late TabController tabController;

  // Dropdown data
  List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3'];
  String selectedDropdownItem = 'Item 1'; // Initially selected item

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset("images/uff.jpg", fit: BoxFit.cover),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Container(
              width: 200,
              height: 70,
              color: Color(0xFF262A2B),
              alignment: Alignment.center,
              child: DropdownButton<String>(
                value: selectedDropdownItem,
                items: dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDropdownItem = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 220),
              child: /*funcoes.botaoRedondo(
                  Icon(Icons.arrow_back), Color(0xFF0F62AC), 40, 40, () => {}),*/
                  ElevatedButton(
                onPressed: () {
                  // Add your logic here for the button's action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0F62AC),
                  shape: CircleBorder(),
                ),
                child: Icon(Icons.arrow_back),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 65, left: 20, right: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF0F62AC),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TabBar(
                                unselectedLabelColor: Colors.white,
                                labelColor: Colors.black,
                                indicatorColor: Colors.white,
                                indicatorWeight: 2,
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                controller: tabController,
                                tabs: [
                                  Tab(
                                    text: 'Filmes',
                                  ),
                                  Tab(
                                    text: 'Séries',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Tab1(),
                            Tab2(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              showButton = !showButton;
            });
          },
          backgroundColor: Color(0xFF0F62AC),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CatalogoPage(),
  ));
}
