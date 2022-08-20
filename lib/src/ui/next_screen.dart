import 'package:dat_bas_prosto/src/block/data_block.dart';
import 'package:dat_bas_prosto/src/model/data_model.dart';
import 'package:dat_bas_prosto/src/ui/final_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final TextEditingController _controllerKritNextName = TextEditingController();
  final TextEditingController _controllerKritName = TextEditingController();

  @override
  void initState() {
    super.initState();
    dataBlock.allDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<DataModel>>(
          stream: dataBlock.getData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataModel> data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 4.0,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            data[index].kritName,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                height: 450,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => null,
                      child: SizedBox(
                        height: 60,
                        //  padding: EdgeInsets.all(15.0),
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextField(
                          controller: _controllerKritNextName,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.black45)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Align(
                      alignment: const FractionalOffset(0.94, 0.1),
                      child: ElevatedButton(
                        onPressed: () async {
                          dataBlock.saveData(
                            DataModel(
                              name: '',
                              kritName: '',
                              kritNextName: '',
                            ),
                          );
                          _controllerKritNextName.text = "";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) {
                            if (_controllerKritNextName == _controllerKritName)
                              ;
                            return FinalSCreen();
                          }));
                        },
                        child: const SizedBox(
                          height: 40.0,
                          width: 40.0,
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            backgroundColor: Colors.transparent,
          );
        },
        child: const Center(
          child: Icon(
            Icons.edit_note,
            size: 30,
          ),
        ),
      ),
    );
  }
}
