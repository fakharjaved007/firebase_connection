import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key key, 
   @required this.user
    }) : super(key: key);
  final FirebaseUser user;

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Fakhar javed'),
              accountEmail: Text('${widget.user.email}'),
              
              currentAccountPicture: CircleAvatar(
                radius: 10.0,
                child: Text('F'),
                backgroundColor: Colors.black,
              ),
            ),
            ListTile(
                title: Text('page one'),
                trailing: Icon(Icons.thumb_up),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("\a");
                }),
            ListTile(
                title: Text('page two'),
                trailing: Icon(Icons.thumb_down),
                onTap: () {
                   Navigator.of(context).pop();
                }),
            new Divider(),
            ListTile(
              title: Text('close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body:DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 100.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text('Home page'),
                    
                      ),
                      
                    ),
                    new SliverPadding(
                      padding: EdgeInsets.all(16.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          TabBar(
                            labelColor: Colors.orangeAccent,
                            tabs: <Widget>[
                              Tab(icon: Icon(Icons.info),text: 'information',),
                               Tab(icon: Icon(Icons.home),text: 'home',)
                            ],
                          )
                        ]),
                      ),
                    ),
                  
                  ];

                },
        body: Column(
        children: <Widget>[

          
          Container(

            child: GridView.count(
    crossAxisCount: 2,
    padding: EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
    mainAxisSpacing: 20.0,
    
    childAspectRatio: 1.0,
    
    children: <Widget>[
            Card(
             child: RaisedButton(
              child: Text('product detail'),
              onPressed: (){},
            ),
            ),
             Card(
             child: RaisedButton(
              child: Text('product detail'),
              onPressed: (){},
            ),
            ),
             Card(
             child: RaisedButton(
              child: Text('product detail'),
              onPressed: (){},
            ),
            ),
             Card(
             child: RaisedButton(
              child: Text('product detail'),
              onPressed: (){},
            ),
            ),
             Card(
             child: RaisedButton(
              child: Text('product detail'),
              onPressed: (){},
            ),
            ),
             Card(
             child: RaisedButton(
              child: Text('product detail'),
              onPressed: (){},
            ),
            ),
    ],
            ),
          ),
        ],
      )
              ),
            ),
          
      
    );
  }
}


      