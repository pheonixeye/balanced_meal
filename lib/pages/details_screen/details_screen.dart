import 'package:balanced_meal/models/user_details_model.dart';
import 'package:balanced_meal/providers/px_user_details.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:balanced_meal/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _texfFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid Input';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter Your Details'),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_left_outlined),
          ),
        ),
        body: Consumer<PxUserDetails>(
          builder: (context, d, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          ListTile(
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                layoutBehavior:
                                    ButtonBarLayoutBehavior.constrained,
                                child: DropdownButtonFormField<Gender>(
                                  //TODO: match figma design(dropdown items should not cover the button while open)
                                  items: [
                                    ...Gender.values.map((e) {
                                      return DropdownMenuItem<Gender>(
                                        value: e,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: d.detailsModel.gender == e
                                                ? Color(0xffFFEDE3)
                                                : null,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(e.name),
                                              ),
                                              if (d.detailsModel.gender == e)
                                                Icon(
                                                  Icons.check,
                                                  color: AppTheme.primaryColor,
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                  ],

                                  selectedItemBuilder: (context) {
                                    return Gender.values.map((e) {
                                      return Text(e.name);
                                    }).toList();
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Invalid Input';
                                    }
                                    return null;
                                  },
                                  value: d.detailsModel.gender,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  hint: Text('Choose Your Gender'),
                                  onChanged: (val) {
                                    d.updateDetailsModel(
                                      gender: val,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Weight',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: TextFormField(
                              initialValue: d.detailsModel.weight == 0
                                  ? null
                                  : d.detailsModel.weight.toString(),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                d.updateDetailsModel(
                                  weight: value.isEmpty ? 0 : int.parse(value),
                                );
                              },
                              validator: _texfFieldValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: 'Enter Your Weight',
                                suffix: Text('Kg'),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Height',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: TextFormField(
                              initialValue: d.detailsModel.height == 0
                                  ? null
                                  : d.detailsModel.height.toString(),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                d.updateDetailsModel(
                                  height: value.isEmpty ? 0 : int.parse(value),
                                );
                              },
                              validator: _texfFieldValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: 'Enter Your Height',
                                suffix: Text('Cm'),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Age',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: TextFormField(
                              initialValue: d.detailsModel.age == 0
                                  ? null
                                  : d.detailsModel.age.toString(),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {
                                d.updateDetailsModel(
                                  age: value.isEmpty ? 0 : int.parse(value),
                                );
                              },
                              validator: _texfFieldValidator,
                              decoration: InputDecoration(
                                hintText: 'Enter Your Age',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      SizedBox(),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: d.detailsModel.isModelValid
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    GoRouter.of(context)
                                        .goNamed(AppRouter.order);
                                  }
                                }
                              : null,
                          child: Text('Next'),
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
