import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/pages/pets_page.dart';
import 'package:histovet/src/pages/widgets/age.dart';
import 'package:histovet/src/pages/widgets/breed.dart';
import 'package:histovet/src/pages/widgets/contact_owner.dart';
import 'package:histovet/src/pages/widgets/document_owner.dart';
import 'package:histovet/src/pages/widgets/name.dart';
import 'package:histovet/src/pages/widgets/name_owner.dart';
import 'package:histovet/src/pages/widgets/sex.dart';
import 'package:histovet/src/pages/widgets/specie.dart';

import 'package:histovet/src/pages/widgets/color.dart';
import 'package:histovet/src/services/pet_service.dart';
import 'package:provider/provider.dart';

import '../models/pet_model.dart';
import 'widgets/code.dart';

class updatePet extends StatefulWidget {
  static String id = "edit_pet";
  final String idPet;
  updatePet(this.idPet,{Key? key}) : super(key: key);

  @override
  State<updatePet> createState() => _updatePetState();
}

class _updatePetState extends State<updatePet> {
  final PetService _service = PetService();
  final _formState = GlobalKey<FormBuilderState>();
  TextEditingController codeController = TextEditingController();
  bool respuesta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(codeController.text),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          getInfoPet();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        controller: codeController,
        name: "code",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Código",
            hintText: "Ingrese el código de la mascotas",
            prefixIcon: Icon(Icons.pets),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
        maxLength: 10,
        validator: FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
      ),
    )],
          )),
    );
  }

   @override
  void initState() {
    getInfo();
    super.initState();
  }

  getInfoPet() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final docOwner = values['docOwner'];
      final nameOwner = values['nameOwner'];
      final contactOwner = values['contactOwner'];
      final age = int.parse(values['age']);
      final breed = values['breed'];
      final specie = values['specie'];
      final color = values['color'];
      final sex = values['sex'];
      late Pet pet = new Pet("",code, name, nameOwner, contactOwner, docOwner, age, breed, specie, color, sex);
      updatePet(pet);
    }
  }
  void updatePet(Pet pet) async{
    respuesta = await _service.storePetToFirebase(pet);
    if (respuesta) {
            Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se guardóo la información"),
            backgroundColor: Colors.green,));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No se guardó la información"),
            backgroundColor: Colors.green,));
          }
  }

  void getInfo() async{
    // await _service.getPet(widget.idPet);
    Pet pet = await _service.getPet(widget.idPet);
    setState(() {
      codeController.text = pet.code.toString();
    });
  }

  
}