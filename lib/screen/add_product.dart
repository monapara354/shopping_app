import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final _imageController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Add product'),
        ),
        body: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              onChanged: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Description'),
              ),
              onChanged: (value) {},
              maxLines: 3,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Price'),
              ),
              onChanged: (value) {},
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: _imageController.text.isEmpty
                      ? Text('Enter URL')
                      : FittedBox(
                          child: Image.network(_imageController.text),
                          fit: BoxFit.contain,
                        ),
                ),
                // TextFormField(
                //   controller: _imageController,
                //   decoration: InputDecoration(label: Text('Enter Image url')),
                //   keyboardType: TextInputType.url,
                // )
              ],
            )
          ],
        )));
  }
}
