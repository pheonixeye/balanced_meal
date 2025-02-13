import 'package:balanced_meal/models/details_model.dart';
import 'package:balanced_meal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  DetailsModel _model = DetailsModel.initial();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Enter Your Details'),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_left_outlined),
          ),
        ),
        body: Center(
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
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        subtitle: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<Gender>(
                            //TODO: match figma design(dropdown items should not cover the button while open)
                            items: [
                              ...Gender.values.map((e) {
                                return DropdownMenuItem<Gender>(
                                  value: e,
                                  child: Text(e.name),
                                );
                              })
                            ],
                            borderRadius: BorderRadius.circular(12),

                            value: _model.gender,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            hint: Text('Choose Your Gender'),
                            onChanged: (val) {
                              setState(() {
                                _model = _model.copyWith(
                                  gender: val,
                                );
                              });
                            },
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
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _model = _model.copyWith(
                                weight: int.parse(value),
                              );
                            });
                          },
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
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _model = _model.copyWith(
                                height: int.parse(value),
                              );
                            });
                          },
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
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _model = _model.copyWith(
                                age: int.parse(value),
                              );
                            });
                          },
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
                      onPressed: _model.isModelValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                GoRouter.of(context).goNamed(AppRouter.order);
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
        ),
      ),
    );
  }
}
