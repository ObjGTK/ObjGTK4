/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkAppChooserButton` lets the user select an application.
 * 
 * ![An example GtkAppChooserButton](appchooserbutton.png)
 * 
 * Initially, a `GtkAppChooserButton` selects the first application
 * in its list, which will either be the most-recently used application
 * or, if [property@Gtk.AppChooserButton:show-default-item] is %TRUE, the
 * default application.
 * 
 * The list of applications shown in a `GtkAppChooserButton` includes
 * the recommended applications for the given content type. When
 * [property@Gtk.AppChooserButton:show-default-item] is set, the default
 * application is also included. To let the user chooser other applications,
 * you can set the [property@Gtk.AppChooserButton:show-dialog-item] property,
 * which allows to open a full [class@Gtk.AppChooserDialog].
 * 
 * It is possible to add custom items to the list, using
 * [method@Gtk.AppChooserButton.append_custom_item]. These items cause
 * the [signal@Gtk.AppChooserButton::custom-item-activated] signal to be
 * emitted when they are selected.
 * 
 * To track changes in the selected application, use the
 * [signal@Gtk.AppChooserButton::changed] signal.
 * 
 * ## CSS nodes
 * 
 * `GtkAppChooserButton` has a single CSS node with the name “appchooserbutton”.
 *
 */
@interface OGTKAppChooserButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)contentType;

/**
 * Methods
 */

- (GtkAppChooserButton*)castedGObject;

/**
 * Appends a custom item to the list of applications that is shown
 * in the popup.
 * 
 * The item name must be unique per-widget. Clients can use the
 * provided name as a detail for the
 * [signal@Gtk.AppChooserButton::custom-item-activated] signal, to add a
 * callback for the activation of a particular custom item in the list.
 * 
 * See also [method@Gtk.AppChooserButton.append_separator].
 *
 * @param name the name of the custom item
 * @param label the label for the custom item
 * @param icon the icon for the custom item
 */
- (void)appendCustomItemWithName:(OFString*)name label:(OFString*)label icon:(GIcon*)icon;

/**
 * Appends a separator to the list of applications that is shown
 * in the popup.
 *
 */
- (void)appendSeparator;

/**
 * Returns the text to display at the top of the dialog.
 *
 * @return the text to display at the top of the dialog,
 *   or %NULL, in which case a default text is displayed
 */
- (OFString*)heading;

/**
 * Gets whether the dialog is modal.
 *
 * @return %TRUE if the dialog is modal
 */
- (bool)modal;

/**
 * Returns whether the dropdown menu should show the default
 * application at the top.
 *
 * @return the value of [property@Gtk.AppChooserButton:show-default-item]
 */
- (bool)showDefaultItem;

/**
 * Returns whether the dropdown menu shows an item
 * for a `GtkAppChooserDialog`.
 *
 * @return the value of [property@Gtk.AppChooserButton:show-dialog-item]
 */
- (bool)showDialogItem;

/**
 * Selects a custom item.
 * 
 * See [method@Gtk.AppChooserButton.append_custom_item].
 * 
 * Use [method@Gtk.AppChooser.refresh] to bring the selection
 * to its initial state.
 *
 * @param name the name of the custom item
 */
- (void)setActiveCustomItem:(OFString*)name;

/**
 * Sets the text to display at the top of the dialog.
 * 
 * If the heading is not set, the dialog displays a default text.
 *
 * @param heading a string containing Pango markup
 */
- (void)setHeading:(OFString*)heading;

/**
 * Sets whether the dialog should be modal.
 *
 * @param modal %TRUE to make the dialog modal
 */
- (void)setModal:(bool)modal;

/**
 * Sets whether the dropdown menu of this button should show the
 * default application for the given content type at top.
 *
 * @param setting the new value for [property@Gtk.AppChooserButton:show-default-item]
 */
- (void)setShowDefaultItem:(bool)setting;

/**
 * Sets whether the dropdown menu of this button should show an
 * entry to trigger a `GtkAppChooserDialog`.
 *
 * @param setting the new value for [property@Gtk.AppChooserButton:show-dialog-item]
 */
- (void)setShowDialogItem:(bool)setting;

@end