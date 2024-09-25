/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKFontDialog;

/**
 * The `GtkFontDialogButton` is wrapped around a [class@Gtk.FontDialog]
 * and allows to open a font chooser dialog to change the font.
 * 
 * ![An example GtkFontDialogButton](font-button.png)
 * 
 * It is suitable widget for selecting a font in a preference dialog.
 * 
 * # CSS nodes
 * 
 * ```
 * fontbutton
 * ╰── button.font
 *     ╰── [content]
 * ```
 * 
 * `GtkFontDialogButton` has a single CSS node with name fontbutton which
 * contains a button node with the .font style class.
 *
 */
@interface OGTKFontDialogButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKFontDialog*)dialog;

/**
 * Methods
 */

- (GtkFontDialogButton*)castedGObject;

/**
 * Returns the `GtkFontDialog` of @self.
 *
 * @return the `GtkFontDialog`
 */
- (OGTKFontDialog*)dialog;

/**
 * Returns the font of the button.
 * 
 * This function is what should be used to obtain
 * the font that was chosen by the user. To get
 * informed about changes, listen to "notify::font-desc".
 *
 * @return the font
 */
- (PangoFontDescription*)fontDesc;

/**
 * Returns the font features of the button.
 * 
 * This function is what should be used to obtain the font features
 * that were chosen by the user. To get informed about changes, listen
 * to "notify::font-features".
 * 
 * Note that the button will only let users choose font features
 * if [property@Gtk.FontDialogButton:level] is set to
 * `GTK_FONT_LEVEL_FEATURES`.
 *
 * @return the font features
 */
- (OFString*)fontFeatures;

/**
 * Returns the language that is used for font features.
 *
 * @return the language
 */
- (PangoLanguage*)language;

/**
 * Returns the level of detail at which this dialog
 * lets the user select fonts.
 *
 * @return the level of detail
 */
- (GtkFontLevel)level;

/**
 * Returns whether the selected font is used in the label.
 *
 * @return whether the selected font is used in the label
 */
- (bool)useFont;

/**
 * Returns whether the selected font size is used in the label.
 *
 * @return whether the selected font size is used in the label
 */
- (bool)useSize;

/**
 * Sets a `GtkFontDialog` object to use for
 * creating the font chooser dialog that is
 * presented when the user clicks the button.
 *
 * @param dialog the new `GtkFontDialog`
 */
- (void)setDialog:(OGTKFontDialog*)dialog;

/**
 * Sets the font of the button.
 *
 * @param fontDesc the new font
 */
- (void)setFontDesc:(const PangoFontDescription*)fontDesc;

/**
 * Sets the font features of the button.
 *
 * @param fontFeatures the font features
 */
- (void)setFontFeatures:(OFString*)fontFeatures;

/**
 * Sets the language to use for font features.
 *
 * @param language the new language
 */
- (void)setLanguage:(PangoLanguage*)language;

/**
 * Sets the level of detail at which this dialog
 * lets the user select fonts.
 *
 * @param level the level of detail
 */
- (void)setLevel:(GtkFontLevel)level;

/**
 * If @use_font is `TRUE`, the font name will be written
 * using the selected font.
 *
 * @param useFont If `TRUE`, font name will be written using
 *   the chosen font
 */
- (void)setUseFont:(bool)useFont;

/**
 * If @use_size is `TRUE`, the font name will be written
 * using the selected font size.
 *
 * @param useSize If `TRUE`, font name will be written using
 *   the chosen font size
 */
- (void)setUseSize:(bool)useSize;

@end