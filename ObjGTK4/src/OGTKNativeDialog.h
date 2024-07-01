/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWindow;

/**
 * Native dialogs are platform dialogs that don't use `GtkDialog`.
 * 
 * They are used in order to integrate better with a platform, by
 * looking the same as other native applications and supporting
 * platform specific features.
 * 
 * The [class@Gtk.Dialog] functions cannot be used on such objects,
 * but we need a similar API in order to drive them. The `GtkNativeDialog`
 * object is an API that allows you to do this. It allows you to set
 * various common properties on the dialog, as well as show and hide
 * it and get a [signal@Gtk.NativeDialog::response] signal when the user
 * finished with the dialog.
 * 
 * Note that unlike `GtkDialog`, `GtkNativeDialog` objects are not
 * toplevel widgets, and GTK does not keep them alive. It is your
 * responsibility to keep a reference until you are done with the
 * object.
 *
 */
@interface OGTKNativeDialog : OGObject
{

}


/**
 * Methods
 */

- (GtkNativeDialog*)castedGObject;

/**
 * Destroys a dialog.
 * 
 * When a dialog is destroyed, it will break any references it holds
 * to other objects.
 * 
 * If it is visible it will be hidden and any underlying window system
 * resources will be destroyed.
 * 
 * Note that this does not release any reference to the object (as opposed
 * to destroying a `GtkWindow`) because there is no reference from the
 * windowing system to the `GtkNativeDialog`.
 *
 */
- (void)destroy;

/**
 * Returns whether the dialog is modal.
 *
 * @return %TRUE if the dialog is set to be modal
 */
- (bool)modal;

/**
 * Gets the title of the `GtkNativeDialog`.
 *
 * @return the title of the dialog, or %NULL if none has
 *    been set explicitly. The returned string is owned by the widget
 *    and must not be modified or freed.
 */
- (OFString*)title;

/**
 * Fetches the transient parent for this window.
 *
 * @return the transient parent for this window,
 *   or %NULL if no transient parent has been set.
 */
- (OGTKWindow*)transientFor;

/**
 * Determines whether the dialog is visible.
 *
 * @return %TRUE if the dialog is visible
 */
- (bool)visible;

/**
 * Hides the dialog if it is visible, aborting any interaction.
 * 
 * Once this is called the [signal@Gtk.NativeDialog::response] signal
 * will *not* be emitted until after the next call to
 * [method@Gtk.NativeDialog.show].
 * 
 * If the dialog is not visible this does nothing.
 *
 */
- (void)hide;

/**
 * Sets a dialog modal or non-modal.
 * 
 * Modal dialogs prevent interaction with other windows in the same
 * application. To keep modal dialogs on top of main application
 * windows, use [method@Gtk.NativeDialog.set_transient_for] to make
 * the dialog transient for the parent; most window managers will
 * then disallow lowering the dialog below the parent.
 *
 * @param modal whether the window is modal
 */
- (void)setModal:(bool)modal;

/**
 * Sets the title of the `GtkNativeDialog.`
 *
 * @param title title of the dialog
 */
- (void)setTitle:(OFString*)title;

/**
 * Dialog windows should be set transient for the main application
 * window they were spawned from.
 * 
 * This allows window managers to e.g. keep the dialog on top of the
 * main window, or center the dialog over the main window.
 * 
 * Passing %NULL for @parent unsets the current transient window.
 *
 * @param parent parent window
 */
- (void)setTransientFor:(OGTKWindow*)parent;

/**
 * Shows the dialog on the display.
 * 
 * When the user accepts the state of the dialog the dialog will
 * be automatically hidden and the [signal@Gtk.NativeDialog::response]
 * signal will be emitted.
 * 
 * Multiple calls while the dialog is visible will be ignored.
 *
 */
- (void)show;

@end