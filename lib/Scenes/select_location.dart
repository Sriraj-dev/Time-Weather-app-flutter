import 'package:flutter/material.dart';
//import 'package:world_time/Services/timeProvider.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  late var data;

  // void setLocations()async{
  //   WorldTime instance = new WorldTime(location: 'Kolkata', url: 'Asia/Kolkata');
  //   var data = await instance.getLocations();
  // }
  List<dynamic> filteredans = [];
  List<dynamic> ans = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //setLocations();
    getList();
  }

  void getList() {

  }

  TextEditingController searchText = new TextEditingController();
  bool isSearching = false;

  void changeList() {
    if ((searchText.text.isEmpty)) {
      filteredans = ans;
    } else {
      List<dynamic> temp = [];
      for (int i = 0; i < ans.length; i++) {
        if (ans[i]
            .toLowerCase()
            .contains(searchText.text.toLowerCase())) {
          temp.add(ans[i]);
        }
      }
      filteredans = temp;
    }
  }

  @override
  Widget build(BuildContext context) {
    //data = ModalRoute.of(context)!.settings.arguments;
    data = ModalRoute.of(context)!.settings.arguments;
    ans = data['data'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: isSearching
              ? TextField(
                  onChanged: (value) {
                    setState(() {
                      changeList();
                    });
                  },
                  controller: searchText,
                  decoration: InputDecoration(
                    hintText: 'Search..',
                    prefixIcon: Icon(Icons.search),
                  ),
                )
              : Text('Select a Location'),
          actions: [
            IconButton(
                onPressed: () {
                  if (!isSearching) {
                    setState(() {
                      isSearching = true;
                      changeList();
                    });
                  } else {
                    setState(() {
                      isSearching = false;
                      searchText.clear();
                      filteredans = ans;
                    });
                  }
                },
                icon: isSearching
                    ? Icon(Icons.close)
                    : Icon(Icons.search_outlined)),
          ],
          elevation: 10,
        ),
        backgroundColor: Colors.white,
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text((filteredans.length == 0)
                    ? ans[index]
                    : filteredans[index]),
                onTap: () {
                  Navigator.popAndPushNamed(context, 'load2', arguments: {
                    'url': (filteredans.length == 0)
                        ? ans[index]
                        : filteredans[index],
                    'location': (filteredans.length == 0)
                        ? (ans[index]
                            .split('/')[ans[index].split('/').length - 1])
                        : (filteredans[index].split(
                            '/')[filteredans[index].split('/').length - 1]),
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 4,
              );
            },
            itemCount:
                (filteredans.length == 0) ? ans.length : filteredans.length));
  }
}
