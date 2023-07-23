import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> controllerslist = [];
  void deleteButton(List<String> list, int index) {
    list.remove(controllerslist[index]);
    setState(() {});
  }

  void editButton(
    List<String> list,
    int index,
  ) {
    TextEditingController controller = TextEditingController();
    controller.text = list[index];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      controllerslist.add(controller.text);
                      deleteButton(list, index);
                      setState(() {});
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
      ),
      floatingActionButton: Container(
        height: 50,
        width: 100,
        child: FloatingActionButton(
          onPressed: () {
            TextEditingController controller = TextEditingController();

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text('Add a note'),
                          TextFormField(
                            controller: controller,
                          ),
                          ElevatedButton(
                            child: const Text('Save'),
                            onPressed: () {
                              if (controller.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('no text entered'),
                                  ),
                                );
                              } else {
                                setState(
                                    () => controllerslist.add(controller.text));
                                Navigator.pop(context);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
          child: Text('Add a Note'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: controllerslist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 2.8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child:
                                  Center(child: Text(controllerslist[index]))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    editButton(controllerslist, index);
                                  },
                                  child: const Text('Edit'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      deleteButton(controllerslist, index);
                                    },
                                    child: const Text('Delete')),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}



// // ignore: must_be_immutable
// class Resuablewidget extends StatefulWidget {
//   String note;
//   Resuablewidget({
//     super.key,
//     required this.note,
//   });

//   @override
//   State<Resuablewidget> createState() => _ResuablewidgetState();
// }

// class _ResuablewidgetState extends State<Resuablewidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: MediaQuery.of(context).size.height / 5,
//         width: MediaQuery.of(context).size.width / 2,
//         decoration: BoxDecoration(
//             color: Colors.white70, borderRadius: BorderRadius.circular(5)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 height: MediaQuery.of(context).size.height / 8,
//                 width: MediaQuery.of(context).size.width / 2.8,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Center(child: Text(widget.note))),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Edit'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         widget.note == '';
//                         setState(() {});
//                       },
//                       child: const Text('Delete')),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
