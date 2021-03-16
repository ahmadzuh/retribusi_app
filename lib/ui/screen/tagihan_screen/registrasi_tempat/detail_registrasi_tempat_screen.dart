import 'package:flutter/material.dart';
import '../../../../bloc/view_model/registrasi_tempat/regitrasi_tempat_model.dart';
import '../../../widget/custom_appbar.dart';

class DetailRegistrasiTempatScreenScreen extends StatefulWidget {
  final RegistrasiTempat registrasiTempat;
  DetailRegistrasiTempatScreenScreen({this.registrasiTempat});

  @override
  _DetailRegistrasiTempatScreenScreenState createState() =>
      _DetailRegistrasiTempatScreenScreenState();
}

class _DetailRegistrasiTempatScreenScreenState
    extends State<DetailRegistrasiTempatScreenScreen> {
  RegistrasiTempat registrasiTempat;

  @override
  void initState() {
    super.initState();
    registrasiTempat = widget.registrasiTempat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'Detail Registrasi Tempat'),
      body: Center(
        child: Container(
          child: Text(registrasiTempat.nmPedagang),
        ),
      ),
    );
  }
}
