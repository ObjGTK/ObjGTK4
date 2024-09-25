/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGTKWindow;

/**
 * A `GtkColorDialog` object collects the arguments that
 * are needed to present a color chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * 
 * The dialog is shown with the [method@Gtk.ColorDialog.choose_rgba]
 * function. This API follows the GIO async pattern, and the
 * result can be obtained by calling
 * [method@Gtk.ColorDialog.choose_rgba_finish].
 * 
 * See [class@Gtk.ColorDialogButton] for a convenient control
 * that uses `GtkColorDialog` and presents the results.
 *
 */
@interface OGTKColorDialog : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkColorDialog*)castedGObject;

/**
 * This function initiates a color choice operation by
 * presenting a color chooser dialog to the user.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.ColorDialog.choose_rgba_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param initialColor the color to select initially
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)chooseRgbaWithParent:(OGTKWindow*)parent initialColor:(const GdkRGBA*)initialColor cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.ColorDialog.choose_rgba] call and
 * returns the resulting color.
 *
 * @param result a `GAsyncResult`
 * @return the selected color, or
 *   `NULL` and @error is set
 */
- (GdkRGBA*)chooseRgbaFinish:(GAsyncResult*)result;

/**
 * Returns whether the color chooser dialog
 * blocks interaction with the parent window
 * while it is presented.
 *
 * @return `TRUE` if the color chooser dialog is modal
 */
- (bool)modal;

/**
 * Returns the title that will be shown on the
 * color chooser dialog.
 *
 * @return the title
 */
- (OFString*)title;

/**
 * Returns whether colors may have alpha.
 *
 * @return `TRUE` if colors may have alpha
 */
- (bool)withAlpha;

/**
 * Sets whether the color chooser dialog
 * blocks interaction with the parent window
 * while it is presented.
 *
 * @param modal the new value
 */
- (void)setModal:(bool)modal;

/**
 * Sets the title that will be shown on the
 * color chooser dialog.
 *
 * @param title the new title
 */
- (void)setTitle:(OFString*)title;

/**
 * Sets whether colors may have alpha.
 *
 * @param withAlpha the new value
 */
- (void)setWithAlpha:(bool)withAlpha;

@end