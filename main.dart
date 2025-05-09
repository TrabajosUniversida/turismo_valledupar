
import 'package:flutter/material.dart';

void main() {
  runApp(ValleduparTurismoApp());
}

class ValleduparTurismoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo Sostenible Valledupar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> atractivos = [
    {
      'titulo': 'Río Guatapurí',
      'descripcion': 'Un balneario natural popular, ideal para ecoturismo.',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'titulo': 'Parque de la Leyenda Vallenata',
      'descripcion': 'Escenario del Festival de la Leyenda Vallenata.',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'titulo': 'Glorieta del Cacique Upar',
      'descripcion': 'Monumento emblemático que representa la historia indígena.',
      'imagen': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turismo Sostenible en Valledupar'),
      ),
      body: ListView.builder(
        itemCount: atractivos.length,
        itemBuilder: (context, index) {
          final item = atractivos[index];
          return ListTile(
            leading: Image.network(item['imagen']!),
            title: Text(item['titulo']!),
            subtitle: Text(item['descripcion']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleAtractivo(
                    titulo: item['titulo']!,
                    descripcion: item['descripcion']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetalleAtractivo extends StatelessWidget {
  final String titulo;
  final String descripcion;

  DetalleAtractivo({required this.titulo, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(descripcion, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Simulación de RA"),
                    content: Text("Aquí se visualizaría el modelo 3D usando RA."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cerrar"),
                      )
                    ],
                  ),
                );
              },
              child: Text('Ver en realidad aumentada'),
            ),
          ],
        ),
      ),
    );
  }
}
