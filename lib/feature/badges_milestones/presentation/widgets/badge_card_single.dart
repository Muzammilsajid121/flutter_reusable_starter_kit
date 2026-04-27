//--Badge Card Single
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BadgeCardSingle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isUnlocked;

  const BadgeCardSingle(this.title, this.imageUrl, this.isUnlocked);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.widgetbgwhitepale,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          //-- Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor:  isUnlocked ? Colors.amber.shade100 : Colors.grey.shade300,
                  child: 
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    color: isUnlocked ? Colors.brown : Colors.grey,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                  // Image.network(imageUrl, color: isUnlocked ? Colors.brown : Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isUnlocked ? Color(0xff1C1B1B) : Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          //-- Check mark
          if (isUnlocked)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 12),
              ),
            ),
        ],
      ),
    );
  }
}

