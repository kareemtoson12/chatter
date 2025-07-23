import 'package:flutter/material.dart';

class InstagramPost extends StatefulWidget {
  final String username;
  final String userAvatarAsset;
  final String location;
  final List<String> imageAssets;
  final String caption;
  final String likedByUser;
  final int likeCount;
  final bool isVerified;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final VoidCallback? onSave;

  const InstagramPost({
    Key? key,
    required this.username,
    required this.userAvatarAsset,
    this.location = '',
    required this.imageAssets,
    required this.caption,
    this.likedByUser = '',
    this.likeCount = 0,
    this.isVerified = false,
    this.onLike,
    this.onComment,
    this.onShare,
    this.onSave,
  }) : super(key: key);

  @override
  State<InstagramPost> createState() => _InstagramPostState();
}

class _InstagramPostState extends State<InstagramPost> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(),

          // Image carousel
          _buildImageCarousel(),

          // Action buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Profile picture
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(widget.userAvatarAsset),
          ),
          const SizedBox(width: 12),

          // Username and location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    if (widget.isVerified) ...[
                      const SizedBox(width: 4),
                      const Icon(Icons.verified, color: Colors.blue, size: 14),
                    ],
                  ],
                ),
                if (widget.location.isNotEmpty)
                  Text(
                    widget.location,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
          ),

          // More options
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: widget.imageAssets.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imageAssets[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),

        // Page indicator
        if (widget.imageAssets.length > 1)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_currentIndex + 1}/${widget.imageAssets.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

        // Dots indicator
        if (widget.imageAssets.length > 1)
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageAssets.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Like button
          GestureDetector(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              widget.onLike?.call();
            },
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),

          // Comment button
          GestureDetector(
            onTap: widget.onComment,
            child: const Icon(Icons.chat_bubble_outline, size: 24),
          ),
          const SizedBox(width: 16),

          // Share button
          GestureDetector(
            onTap: widget.onShare,
            child: const Icon(Icons.send_outlined, size: 24),
          ),

          const Spacer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
