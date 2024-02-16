import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kegiatanmahasiswa_app/bloc/manageinfo_bloc.dart';
import 'package:kegiatanmahasiswa_app/layout/detailview.dart';

// ignore: must_be_immutable
class ListInfoView extends StatelessWidget {
  final List info;
  String searchText;

  ListInfoView({super.key, required this.info, this.searchText = ""});

  @override
  Widget build(BuildContext context) {
    TextEditingController search0 = TextEditingController(text: searchText);

    return Scaffold(
      appBar: AppBar(title: const Text("LIst Information")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: search0,
              decoration: const InputDecoration(labelText: 'cari informasi'),
            ),
            ElevatedButton(
              onPressed: () {
                final search = search0.text;

                context
                    .read<ManageinfoBloc>()
                    .add(LoadListInfoEvent(keyword: search));
              },
              child: const Text('cari'),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    final Map infoItem = info[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          infoItem['img'],
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        title: Text(infoItem['title']),
                        subtitle: Text(infoItem['date']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailInfo(
                                      infoId: infoItem['id'].toString(),
                                    )),
                          ).then((search) {
                            final search = search0.text;

                            context
                                .read<ManageinfoBloc>()
                                .add(LoadListInfoEvent(keyword: search));
                          });
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
