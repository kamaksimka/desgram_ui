import 'package:desgram_ui/ui/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_personal_information_view_model.dart';

class EditPersonalInformationPage extends StatelessWidget {
  const EditPersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<EditPersonalInformationViewModel>();
    var personalInformationModel = viewModel.personalInformationModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Личная информация"),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
      ),
      body: personalInformationModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
              children: [
                const Divider(
                  height: 7,
                  thickness: 1,
                  color: Color.fromARGB(255, 196, 196, 196),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: Text(
                    "Эта информация не будет показана в вашем общедоступном профиле.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Divider(
                  height: 7,
                  thickness: 1,
                  color: Color.fromARGB(255, 196, 196, 196),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8)),
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              var model = viewModel.personalInformationModel;
                              if (model != null) {
                                AppNavigator.toChangeEmailPage(model);
                              }
                            },
                            controller: viewModel.emailController,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                hintText: "Электронный адрес"),
                          )),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8)),
                          child: TextField(
                            onTap: viewModel.toEditBirthDate,
                            readOnly: true,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            controller: viewModel.birthDateController,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                hintText: "День рождения"),
                          ))
                    ],
                  ),
                )
              ],
            )),
    );
  }

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => EditPersonalInformationViewModel(context: context),
      child: const EditPersonalInformationPage(),
    );
  }
}
