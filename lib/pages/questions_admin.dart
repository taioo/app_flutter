import 'package:flutter/material.dart';

import './question_edit.dart';
import './question_list.dart';

class QuestionsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  QuestionsAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.border_horizontal),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/question');
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Go to Start Page'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            QuestionEditPage(addProduct: addProduct),
            QuestionListPage(products, updateProduct, deleteProduct)
          ],
        ),
      ),
    );
  }
}