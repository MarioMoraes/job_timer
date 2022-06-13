import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterState>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterState.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterState.failure:
            AsukaSnackbar.alert('Erro Ao Salvar Projeto');
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Projeto'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  decoration: const InputDecoration(
                    label: Text('Nome do Projeto'),
                  ),
                  validator:
                      Validatorless.required('Nome do Projeto Obrigatório!'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _estimateEC,
                    decoration: const InputDecoration(
                      label: Text('Tempo Estimado'),
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Tempo Estimado Obrigatório!'),
                      Validatorless.number('Apenas Números Permitidos!'),
                    ])),
                const SizedBox(
                  height: 10,
                ),
                BlocSelector<ProjectRegisterController, ProjectRegisterState,
                        bool>(
                    bloc: widget.controller,
                    selector: (state) => state == ProjectRegisterState.loading,
                    builder: (context, showLoading) {
                      return Visibility(
                          visible: showLoading,
                          child: const CircularProgressIndicator.adaptive());
                    }),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        await widget.controller.register(
                            _nameEC.text, int.parse(_estimateEC.text));
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
