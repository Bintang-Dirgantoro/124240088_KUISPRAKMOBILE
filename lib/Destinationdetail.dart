import 'package:flutter/material.dart';
import 'Models/destinationModels.dart';

class DetailPage extends StatefulWidget {
  final DestinationModel destination;
  final VoidCallback onFavoriteChanged;

  const DetailPage({
    super.key,
    required this.destination,
    required this.onFavoriteChanged,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void toggleFavorite() {
    setState(() {
      widget.destination.isFavorite = 
        !widget.destination.isFavorite;
    });

    widget.onFavoriteChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.name),

        actions: [
          IconButton(
            icon: Icon(
              widget.destination.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border, color: Colors.red
            ),
            onPressed: () {
              setState(() {
                widget.destination.isFavorite = !widget.destination.isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(widget.destination.isFavorite ? 'Ditambahkan ke Favorit!' : 'Dihapus dari Favorit!'),
                  duration: const Duration(seconds: 1),
                )
              );
            }
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Center(
              child: Image.network(
                widget.destination.imageUrl,
                width: 180,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              widget.destination.name,

              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Kategori Wisata: ${widget.destination.category}',
            ),

            Text(
              'Lokasi Wisata : ${widget.destination.location}',
            ),

            Text(
              'Jam Buka : ${widget.destination.openingHours}',
            ),

            Text(
              'Info Tiket : ${widget.destination.ticketInfo}',
            ),

            Text(
              'Daya Tarik : ${widget.destination.attraction}',
            ),

            const SizedBox(height: 20),

            const Text(
              'Deskripsi',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(widget.destination.description),
          ],
        ),
      ),
    );
  }
}