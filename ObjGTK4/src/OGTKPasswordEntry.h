/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;

/**
 * `GtkPasswordEntry` is an entry that has been tailored for entering secrets.
 * 
 * ![An example GtkPasswordEntry](password-entry.png)
 * 
 * It does not show its contents in clear text, does not allow to copy it
 * to the clipboard, and it shows a warning when Caps Lock is engaged. If
 * the underlying platform allows it, `GtkPasswordEntry` will also place
 * the text in a non-pageable memory area, to avoid it being written out
 * to disk by the operating system.
 * 
 * Optionally, it can offer a way to reveal the contents in clear text.
 * 
 * `GtkPasswordEntry` provides only minimal API and should be used with
 * the [iface@Gtk.Editable] API.
 * 
 * # CSS Nodes
 * 
 * ```
 * entry.password
 * ╰── text
 *     ├── image.caps-lock-indicator
 *     ┊
 * ```
 * 
 * `GtkPasswordEntry` has a single CSS node with name entry that carries
 * a .passwordstyle class. The text Css node below it has a child with
 * name image and style class .caps-lock-indicator for the Caps Lock
 * icon, and possibly other children.
 * 
 * # Accessibility
 * 
 * `GtkPasswordEntry` uses the %GTK_ACCESSIBLE_ROLE_TEXT_BOX role.
 *
 */
@interface OGTKPasswordEntry : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkPasswordEntry*)castedGObject;

/**
 * Gets the menu model set with gtk_password_entry_set_extra_menu().
 *
 * @return the menu model
 */
- (OGMenuModel*)extraMenu;

/**
 * Returns whether the entry is showing an icon to
 * reveal the contents.
 *
 * @return %TRUE if an icon is shown
 */
- (bool)showPeekIcon;

/**
 * Sets a menu model to add when constructing
 * the context menu for @entry.
 *
 * @param model a `GMenuModel`
 */
- (void)setExtraMenu:(OGMenuModel*)model;

/**
 * Sets whether the entry should have a clickable icon
 * to reveal the contents.
 * 
 * Setting this to %FALSE also hides the text again.
 *
 * @param showPeekIcon whether to show the peek icon
 */
- (void)setShowPeekIcon:(bool)showPeekIcon;

@end