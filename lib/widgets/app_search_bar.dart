import 'dart:async';

import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounceTimer;

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus && _searchController.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_focusNode.hasFocus && _searchController.text.isEmpty) {
          context.read<WorkplaceProvider>().clearSearch();

          setState(() => _isVisible = false);

          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) widget.onClose?.call();
          });
        }
      });
    } else {
      if (!_isVisible) setState(() => _isVisible = true);
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        context.read<WorkplaceProvider>().updateSearchQuery(query);
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<WorkplaceProvider>().clearSearch();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInCirc,
        switchOutCurve: Curves.easeInOutCubic,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1.0,
              child: child,
            ),
          );
        },
        child: _isVisible
            ? Consumer<WorkplaceProvider>(
                builder: (context, workplaceProvider, child) {
                  return Container(
                    color: JobsyColors.blackColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            focusNode: _focusNode,
                            autofocus: true,
                            onChanged: _onSearchChanged,
                            onSubmitted: (_) => _focusNode.unfocus(),
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: JobsyColors.scaffoldColor,
                              hintText: 'search'.tr(),
                              hintStyle: TextStyle(
                                color: JobsyColors.greyColor.withValues(
                                  alpha: 0.6,
                                ),
                                fontSize: 16,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: JobsyColors.primaryColor,
                              ),
                              suffixIcon: workplaceProvider.hasActiveSearch
                                  ? IconButton(
                                      onPressed: _clearSearch,
                                      icon: const Icon(
                                        Icons.clear,
                                        color: JobsyColors.greyColor,
                                      ),
                                      tooltip: 'clear'.tr(),
                                    )
                                  : null,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(34),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.tune, size: 20),
                          label: Text(
                            'sort_search'.tr(),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: JobsyColors.greyColor,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: JobsyColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
