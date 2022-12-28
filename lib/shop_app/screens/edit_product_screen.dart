import 'package:flutter/material.dart';
import 'package:flutter_app/shop_app/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const route = "/edit-product";

  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isInit = true;
  var _initValues = {
    "id": "",
    "title": "",
    "description": "",
    "price": "",
    "imageUrl": ""
  };

  Product _editedProduct = Product(
      id: "",
      title: "",
      price: 0,
      description: "",
      imageUrl: "",
      isFavorite: false);

  void _editNewProduct(
      {String? id,
      String? title,
      double? price,
      String? description,
      String? imageUrl,
      bool? isFavorite}) {
    _editedProduct = Product(
        id: id ?? _editedProduct.id,
        title: title ?? _editedProduct.title,
        price: price ?? _editedProduct.price,
        description: description ?? _editedProduct.description,
        imageUrl: imageUrl ?? _editedProduct.imageUrl,
        isFavorite: isFavorite ?? _editedProduct.isFavorite);
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final products = Provider.of<Products>(context, listen: false);
    final valid = _form.currentState!.validate();
    if (valid) {
      _form.currentState!.save();
      if (_initValues["id"] == "") {
        products.addProduct(_editedProduct);
      } else {
        products.updateProduct(_initValues["id"]!, _editedProduct);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String?;
      final product =
          Provider.of<Products>(context, listen: false).findById(id: productId);
      if (product != null) {
        _initValues = {
          "id": product.id,
          "title": product.title,
          "description": product.description,
          "price": product.price.toString(),
          "imageUrl": product.imageUrl,
        };
        _imageUrlController.text = _initValues["imageUrl"]!;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Product"),
          actions: [
            IconButton(onPressed: _saveForm, icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _form,
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: _initValues["title"],
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Title",
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                    onSaved: (value) {
                      _editNewProduct(title: value);
                    },
                  ),
                  TextFormField(
                      initialValue: _initValues["price"],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      onSaved: (value) {
                        _editNewProduct(price: double.parse(value ?? "0"));
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a price";
                        }
                        if (double.tryParse(value) == null) {
                          return "Please enter a valid value";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Price",
                      )),
                  TextFormField(
                      initialValue: _initValues["description"],
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      focusNode: _descriptionFocusNode,
                      onSaved: (value) {
                        _editNewProduct(description: value);
                      },
                      decoration: const InputDecoration(
                        labelText: "Description",
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(top: 8, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: _imageUrlController.text.isEmpty
                            ? const Text("Enter a url")
                            : FittedBox(
                                child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              )),
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onSaved: (value) {
                          _editNewProduct(imageUrl: value);
                        },
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onEditingComplete: () {
                          setState(() {});
                        },
                      ))
                    ],
                  )
                ],
              )),
        ));
  }
}
