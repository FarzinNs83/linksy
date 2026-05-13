import 'package:flutter/material.dart';
import 'package:front/gen/fonts.gen.dart';
import '../../constant/app_constants.dart';

class AppTheme {
  AppTheme._();

  // ============================================================================
  // PUBLIC THEMES
  // ============================================================================

  static ThemeData get lightTheme => theme(lightScheme());

  static ThemeData get darkTheme => theme(darkScheme());

  // ============================================================================
  // COLOR SCHEMES
  // ============================================================================

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF6366F1),
      surfaceTint: Color(0xFF6366F1),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFb3b6ff),
      onPrimaryContainer: Color(0xFF6A6CC3),
      secondary: Color(0xFF8846ec),
      onSecondary: Color(0xFF9E9E9E),
      secondaryContainer: Color(0xFFd896ff),
      onSecondaryContainer: Color(0xFF601ec4),
      tertiary: Color(0xFF10B981),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF60ffd1),
      onTertiaryContainer: Color(0xFF009159),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF93000A),
      surface: Color(0xFFE0E0E0),
      onSurface: Color(0xFF1C1B1F),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFFCAC4D0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFF4f52dd),
      primaryFixed: Color(0xFFb3b6ff),
      onPrimaryFixed: Color(0xFF272ab5),
      primaryFixedDim: Color(0xFF9fa2ff),
      onPrimaryFixedVariant: Color(0xFF4f52dd),
      secondaryFixed: Color(0xFFd896ff),
      onSecondaryFixed: Color(0xFF4c0ab0),
      secondaryFixedDim: Color(0xFFc482ff),
      onSecondaryFixedVariant: Color(0xFF7432d8),
      tertiaryFixed: Color(0xFF60ffd1),
      onTertiaryFixed: Color(0xFF007d45),
      tertiaryFixedDim: Color(0xFF4cf5bd),
      onTertiaryFixedVariant: Color(0xFF00a56d),
      surfaceDim: Color(0xFFE6E0E9),
      surfaceBright: Color(0xFFFFFBFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF7F2FA),
      surfaceContainer: Color(0xFFF3EDF7),
      surfaceContainerHigh: Color(0xFFECE6F0),
      surfaceContainerHighest: Color(0xFFE6E0E9),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF4f52dd),
      surfaceTint: Color(0xFF4f52dd),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF272ab5),
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFF7432d8),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF4c0ab0),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFF00a56d),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF007d45),
      onTertiaryContainer: Color(0xFFFFFFFF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF000000),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFFFFF),
      surface: Color(0xFF282C34),
      onSurface: Color(0xFFE6E0E9),
      onSurfaceVariant: Color(0xFFCAC4D0),
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E0E9),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFF6366F1),
      primaryFixed: Color(0xFFb3b6ff),
      onPrimaryFixed: Color(0xFF272ab5),
      primaryFixedDim: Color(0xFF9fa2ff),
      onPrimaryFixedVariant: Color(0xFF4f52dd),
      secondaryFixed: Color(0xFFd896ff),
      onSecondaryFixed: Color(0xFF4c0ab0),
      secondaryFixedDim: Color(0xFFc482ff),
      onSecondaryFixedVariant: Color(0xFF7432d8),
      tertiaryFixed: Color(0xFF60ffd1),
      onTertiaryFixed: Color(0xFF007d45),
      tertiaryFixedDim: Color(0xFF4cf5bd),
      onTertiaryFixedVariant: Color(0xFF00a56d),
      surfaceDim: Color(0xFF10090D),
      surfaceBright: Color(0xFF362F33),
      surfaceContainerLowest: Color(0xFF0B0509),
      surfaceContainerLow: Color(0xFF1D1418),
      surfaceContainer: Color(0xFF211A1E),
      surfaceContainerHigh: Color(0xFF2B2329),
      surfaceContainerHighest: Color(0xFF362F33),
    );
  }
  // ============================================================================
  // MAIN THEME
  // ============================================================================

  static ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,

      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,

      splashColor: colorScheme.primary.withValues(alpha: 0.08),
      highlightColor: Colors.transparent,

      dividerColor: colorScheme.outlineVariant,
      disabledColor: colorScheme.onSurface.withValues(alpha: 0.38),

      textTheme: textTheme(colorScheme),

      appBarTheme: appBarTheme(colorScheme),

      cardTheme: cardTheme(colorScheme),

      inputDecorationTheme: inputDecorationTheme(colorScheme),

      elevatedButtonTheme: elevatedButtonTheme(colorScheme),

      filledButtonTheme: filledButtonTheme(colorScheme),

      outlinedButtonTheme: outlinedButtonTheme(colorScheme),

      textButtonTheme: textButtonTheme(colorScheme),

      iconButtonTheme: iconButtonTheme(colorScheme),

      chipTheme: chipTheme(colorScheme),

      dividerTheme: dividerTheme(colorScheme),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
      ),

      switchTheme: switchTheme(colorScheme),

      checkboxTheme: checkboxTheme(colorScheme),

      radioTheme: radioTheme(colorScheme),

      sliderTheme: sliderTheme(colorScheme),

      bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),

      navigationBarTheme: navigationBarTheme(colorScheme),

      tabBarTheme: tabBarTheme(colorScheme),

      snackBarTheme: snackBarTheme(colorScheme),

      dialogTheme: dialogTheme(colorScheme),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        modalBackgroundColor: colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.radiusXL),
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // TEXT THEME
  // ============================================================================

  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: AppConstants.fontSizeDisplayLarge,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      displayMedium: TextStyle(
        fontSize: AppConstants.fontSizeDisplayMedium,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      displaySmall: TextStyle(
        fontSize: AppConstants.fontSizeDisplaySmall,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      headlineLarge: TextStyle(
        fontSize: AppConstants.fontSizeHeadlineLarge,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      headlineMedium: TextStyle(
        fontSize: AppConstants.fontSizeHeadlineMedium,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      headlineSmall: TextStyle(
        fontSize: AppConstants.fontSizeHeadlineSmall,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      titleLarge: TextStyle(
        fontSize: AppConstants.fontSizeTitleLarge,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      titleMedium: TextStyle(
        fontSize: AppConstants.fontSizeTitleMedium,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      titleSmall: TextStyle(
        fontSize: AppConstants.fontSizeTitleSmall,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      bodyLarge: TextStyle(
        fontSize: AppConstants.fontSizeBodyLarge,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      bodyMedium: TextStyle(
        fontSize: AppConstants.fontSizeBodyMedium,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      bodySmall: TextStyle(
        fontSize: AppConstants.fontSizeBodySmall,
        color: colorScheme.onSurfaceVariant,
        fontFamily: FontFamily.gillSans,
      ),
      labelLarge: TextStyle(
        fontSize: AppConstants.fontSizeLabelLarge,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      labelMedium: TextStyle(
        fontSize: AppConstants.fontSizeLabelMedium,
        color: colorScheme.onSurface,
        fontFamily: FontFamily.gillSans,
      ),
      labelSmall: TextStyle(
        fontSize: AppConstants.fontSizeLabelSmall,
        color: colorScheme.onSurfaceVariant,
        fontFamily: FontFamily.gillSans,
      ),
    );
  }

  // ============================================================================
  // INPUT
  // ============================================================================

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.onPrimary,
      
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: 18,
      ),

      hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withValues(alpha: .4)),

      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),

      floatingLabelStyle: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),

      prefixIconColor: colorScheme.primary,
      suffixIconColor: colorScheme.primary,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        borderSide: BorderSide(color: colorScheme.outline),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        borderSide: BorderSide(color: colorScheme.onSecondary,width: 1.3),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        borderSide: BorderSide(color: colorScheme.onPrimaryContainer, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        borderSide: BorderSide(color: colorScheme.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
    );
  }

  // ============================================================================
  // APPBAR
  // ============================================================================

  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: colorScheme.onPrimary,
        fontSize: AppConstants.fontSizeTitleLarge,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
      centerTitle: false,
    );
  }

  // ============================================================================
  // CARD
  // ============================================================================

  static CardThemeData cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surfaceContainer,
      shadowColor: colorScheme.shadow.withValues(alpha: 0.15),
      elevation: AppConstants.elevationLevel1,
      margin: EdgeInsets.all(AppConstants.spacingSM),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLG),
      ),
    );
  }

  // ============================================================================
  // BUTTONS
  // ============================================================================

  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
        disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spacingLG,
          vertical: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        ),
      ),
    );
  }

  static FilledButtonThemeData filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        ),
      ),
    );
  }

  static TextButtonThemeData textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colorScheme.primary),
    );
  }

  static IconButtonThemeData iconButtonTheme(ColorScheme colorScheme) {
    return IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(colorScheme.onSurfaceVariant),
      ),
    );
  }

  // ============================================================================
  // CHIP
  // ============================================================================

  static ChipThemeData chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainerHigh,
      selectedColor: colorScheme.secondaryContainer,
      disabledColor: colorScheme.surfaceContainerHighest,
      secondarySelectedColor: colorScheme.primaryContainer,

      labelStyle: TextStyle(color: colorScheme.onSurface),

      secondaryLabelStyle: TextStyle(color: colorScheme.onSecondaryContainer),

      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingMD,
        vertical: AppConstants.spacingSM,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusFull),
      ),
    );
  }

  // ============================================================================
  // DIVIDER
  // ============================================================================

  static DividerThemeData dividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.outlineVariant,
      thickness: AppConstants.borderWidthThin,
      space: AppConstants.spacingMD,
    );
  }

  // ============================================================================
  // SWITCH
  // ============================================================================

  static SwitchThemeData switchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primaryContainer;
        }
        return colorScheme.surfaceContainerHighest;
      }),
    );
  }

  // ============================================================================
  // CHECKBOX
  // ============================================================================

  static CheckboxThemeData checkboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStatePropertyAll(colorScheme.onPrimary),
      side: BorderSide(color: colorScheme.outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXS),
      ),
    );
  }

  // ============================================================================
  // RADIO
  // ============================================================================

  static RadioThemeData radioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: WidgetStatePropertyAll(colorScheme.primary),
    );
  }

  // ============================================================================
  // SLIDER
  // ============================================================================

  static SliderThemeData sliderTheme(ColorScheme colorScheme) {
    return SliderThemeData(
      activeTrackColor: colorScheme.primary,
      inactiveTrackColor: colorScheme.surfaceContainerHighest,
      thumbColor: colorScheme.primary,
      overlayColor: colorScheme.primary.withValues(alpha: 0.12),
    );
  }

  // ============================================================================
  // NAVIGATION
  // ============================================================================

  static BottomNavigationBarThemeData bottomNavigationBarTheme(
    ColorScheme colorScheme,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    );
  }

  static NavigationBarThemeData navigationBarTheme(ColorScheme colorScheme) {
    return NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(color: colorScheme.onSurface),
      ),
    );
  }

  static TabBarThemeData tabBarTheme(ColorScheme colorScheme) {
    return TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorColor: colorScheme.primary,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
    );
  }

  // ============================================================================
  // SNACKBAR
  // ============================================================================

  static SnackBarThemeData snackBarTheme(ColorScheme colorScheme) {
    return SnackBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
      actionTextColor: colorScheme.primary,
      behavior: SnackBarBehavior.floating,
    );
  }

  // ============================================================================
  // DIALOG
  // ============================================================================

  static DialogThemeData dialogTheme(ColorScheme colorScheme) {
    return DialogThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      ),
    );
  }
}

extension CustomColors on ColorScheme {
  Color get success => const Color(0xFF2E7D32);

  Color get warning => const Color(0xFFF57C00);

  Color get info => const Color(0xFF1976D2);
}
