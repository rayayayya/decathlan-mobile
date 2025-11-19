import 'package:flutter/material.dart';
import 'package:decathlan_mobile/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final f = product.fields; // biar pendek

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: f.image.isNotEmpty
                      ? Image.network(
                          'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(f.image)}',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            height: 150,
                            color: Colors.grey[300],
                            child:
                                const Center(child: Icon(Icons.broken_image)),
                          ),
                        )
                      : Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.image)),
                        ),
                ),

                const SizedBox(height: 8),

                // Product Name
                Text(
                  f.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Price (plain integer)
                Text(
                  "Rp ${f.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                // Category
                Text("Category: ${f.category}"),

                const SizedBox(height: 6),

                // Description preview
                Text(
                  f.description.length > 100
                      ? '${f.description.substring(0, 100)}...'
                      : f.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 6),

                // Hot product indicator (views > 20)
                if (f.views > 20)
                  const Text(
                    '🔥 Hot Product',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 6),

                // Views
                Text(
                  "Views: ${f.views}",
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
