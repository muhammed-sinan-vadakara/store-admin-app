import 'package:flutter/material.dart';
import 'package:store_admin_app/core/theme/extentions/boxshadow_extention.dart';
import 'package:store_admin_app/core/theme/extentions/color_extention.dart';
import 'package:store_admin_app/core/theme/extentions/space_extention.dart';
import 'package:store_admin_app/core/theme/extentions/typograpy_extention.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }

  AppBoxShadowExtension get boxShadow {
    return Theme.of(context).extension<AppBoxShadowExtension>()!;
  }
}
