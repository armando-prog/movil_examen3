import 'package:examen3/add_weight_screen.dart';
import 'package:examen3/weight_model.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final List<WeightModel> registros = [];

  Future<void> _agregarRegistro() async {
    final result = await Navigator.of(context).push<WeightModel>(
      MaterialPageRoute<WeightModel>(
        builder: (context) => const AddWeightScreen(),
      ),
    );

    if (!mounted || result == null) return;
    setState(() => registros.add(result));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Peso')),
      body: registros.isEmpty
          ? const Center(child: Text('No hay registros'))
          : ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) {
                final registro = registros[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.monitor_weight_outlined),
                    ),
                    title: Text('Fecha: ${registro.fecha}'),
                    subtitle: Text('Peso: ${registro.pesoKilos} kg'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _agregarRegistro,
        tooltip: 'Agregar peso',
        child: const Icon(Icons.add),
      ),
    );
  }
}
