/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGTKFilter;
@class OGTKWindow;
@class OGPangoFontFace;
@class OGPangoFontFamily;
@class OGPangoFontMap;

/**
 * A `GtkFontDialog` object collects the arguments that
 * are needed to present a font chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * 
 * The dialog is shown with the [method@Gtk.FontDialog.choose_font]
 * function or its variants. This API follows the GIO async pattern,
 * and the result can be obtained by calling the corresponding
 * finish function, such as [method@Gtk.FontDialog.choose_font_finish].
 * 
 * See [class@Gtk.FontDialogButton] for a convenient control
 * that uses `GtkFontDialog` and presents the results.
 *
 */
@interface OGTKFontDialog : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)fontDialog;

/**
 * Methods
 */

- (GtkFontDialog*)castedGObject;

/**
 * This function initiates a font selection operation by
 * presenting a dialog to the user for selecting a font face
 * (i.e. a font family and style, but not a specific font size).
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FontDialog.choose_face_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param initialValue the initial value
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)chooseFaceWithParent:(OGTKWindow*)parent initialValue:(OGPangoFontFace*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FontDialog.choose_face] call
 * and returns the resulting font face.
 *
 * @param result a `GAsyncResult`
 * @return the selected font face
 */
- (OGPangoFontFace*)chooseFaceFinish:(GAsyncResult*)result;

/**
 * This function initiates a font selection operation by
 * presenting a dialog to the user for selecting a font family.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FontDialog.choose_family_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param initialValue the initial value
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)chooseFamilyWithParent:(OGTKWindow*)parent initialValue:(OGPangoFontFamily*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FontDialog.choose_family] call
 * and returns the resulting family.
 * 
 * This function never returns an error. If the operation is
 * not finished successfully, the value passed as @initial_value
 * to [method@Gtk.FontDialog.choose_family] is returned.
 *
 * @param result a `GAsyncResult`
 * @return the selected family
 */
- (OGPangoFontFamily*)chooseFamilyFinish:(GAsyncResult*)result;

/**
 * This function initiates a font selection operation by
 * presenting a dialog to the user for selecting a font.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FontDialog.choose_font_finish]
 * to obtain the result.
 * 
 * If you want to let the user select font features as well,
 * use [method@Gtk.FontDialog.choose_font_and_features] instead.
 *
 * @param parent the parent `GtkWindow`
 * @param initialValue the font to select initially
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)chooseFontWithParent:(OGTKWindow*)parent initialValue:(PangoFontDescription*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * This function initiates a font selection operation by
 * presenting a dialog to the user for selecting a font and
 * font features.
 * 
 * Font features affect how the font is rendered, for example
 * enabling glyph variants or ligatures.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FontDialog.choose_font_and_features_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param initialValue the font to select initially
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)chooseFontAndFeaturesWithParent:(OGTKWindow*)parent initialValue:(PangoFontDescription*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FontDialog.choose_font_and_features]
 * call and returns the resulting font description and font features.
 *
 * @param result a `GAsyncResult`
 * @param fontDesc return location for font description
 * @param fontFeatures return location for font features
 * @param language return location for the language
 * @return `TRUE` if a font was selected. Otherwise `FALSE` is returned
 *   and @error is set
 */
- (bool)chooseFontAndFeaturesFinishWithResult:(GAsyncResult*)result fontDesc:(PangoFontDescription**)fontDesc fontFeatures:(char**)fontFeatures language:(PangoLanguage**)language;

/**
 * Finishes the [method@Gtk.FontDialog.choose_font] call
 * and returns the resulting font description.
 *
 * @param result a `GAsyncResult`
 * @return the selected font
 */
- (PangoFontDescription*)chooseFontFinish:(GAsyncResult*)result;

/**
 * Returns the filter that decides which fonts to display
 * in the font chooser dialog.
 *
 * @return the filter
 */
- (OGTKFilter*)filter;

/**
 * Returns the fontmap from which fonts are selected,
 * or `NULL` for the default fontmap.
 *
 * @return the fontmap
 */
- (OGPangoFontMap*)fontMap;

/**
 * Returns the language for which font features are applied.
 *
 * @return the language for font features
 */
- (PangoLanguage*)language;

/**
 * Returns whether the font chooser dialog
 * blocks interaction with the parent window
 * while it is presented.
 *
 * @return `TRUE` if the font chooser dialog is modal
 */
- (bool)modal;

/**
 * Returns the title that will be shown on the
 * font chooser dialog.
 *
 * @return the title
 */
- (OFString*)title;

/**
 * Adds a filter that decides which fonts to display
 * in the font chooser dialog.
 * 
 * The `GtkFilter` must be able to handle both `PangoFontFamily`
 * and `PangoFontFace` objects.
 *
 * @param filter a `GtkFilter`
 */
- (void)setFilter:(OGTKFilter*)filter;

/**
 * Sets the fontmap from which fonts are selected.
 * 
 * If @fontmap is `NULL`, the default fontmap is used.
 *
 * @param fontmap the fontmap
 */
- (void)setFontMap:(OGPangoFontMap*)fontmap;

/**
 * Sets the language for which font features are applied.
 *
 * @param language the language for font features
 */
- (void)setLanguage:(PangoLanguage*)language;

/**
 * Sets whether the font chooser dialog
 * blocks interaction with the parent window
 * while it is presented.
 *
 * @param modal the new value
 */
- (void)setModal:(bool)modal;

/**
 * Sets the title that will be shown on the
 * font chooser dialog.
 *
 * @param title the new title
 */
- (void)setTitle:(OFString*)title;

@end