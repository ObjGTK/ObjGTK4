/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkSearchBar` is a container made to have a search entry.
 * 
 * ![An example GtkSearchBar](search-bar.png)
 * 
 * It can also contain additional widgets, such as drop-down menus,
 * or buttons.  The search bar would appear when a search is started
 * through typing on the keyboard, or the application’s search mode
 * is toggled on.
 * 
 * For keyboard presses to start a search, the search bar must be told
 * of a widget to capture key events from through
 * [method@Gtk.SearchBar.set_key_capture_widget]. This widget will
 * typically be the top-level window, or a parent container of the
 * search bar. Common shortcuts such as Ctrl+F should be handled as an
 * application action, or through the menu items.
 * 
 * You will also need to tell the search bar about which entry you
 * are using as your search entry using [method@Gtk.SearchBar.connect_entry].
 * 
 * ## Creating a search bar
 * 
 * The following example shows you how to create a more complex search
 * entry.
 * 
 * [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/search-bar.c)
 * 
 * # CSS nodes
 * 
 * ```
 * searchbar
 * ╰── revealer
 *     ╰── box
 *          ├── [child]
 *          ╰── [button.close]
 * ```
 * 
 * `GtkSearchBar` has a main CSS node with name searchbar. It has a child
 * node with name revealer that contains a node with name box. The box node
 * contains both the CSS node of the child widget as well as an optional button
 * node which gets the .close style class applied.
 * 
 * # Accessibility
 * 
 * `GtkSearchBar` uses the %GTK_ACCESSIBLE_ROLE_SEARCH role.
 *
 */
@interface OGTKSearchBar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkSearchBar*)castedGObject;

/**
 * Connects the `GtkEditable` widget passed as the one to be used in
 * this search bar.
 * 
 * The entry should be a descendant of the search bar. Calling this
 * function manually is only required if the entry isn’t the direct
 * child of the search bar (as in our main example).
 *
 * @param entry a `GtkEditable`
 */
- (void)connectEntry:(GtkEditable*)entry;

/**
 * Gets the child widget of @bar.
 *
 * @return the child widget of @bar
 */
- (OGTKWidget*)child;

/**
 * Gets the widget that @bar is capturing key events from.
 *
 * @return The key capture widget.
 */
- (OGTKWidget*)keyCaptureWidget;

/**
 * Returns whether the search mode is on or off.
 *
 * @return whether search mode is toggled on
 */
- (bool)searchMode;

/**
 * Returns whether the close button is shown.
 *
 * @return whether the close button is shown
 */
- (bool)showCloseButton;

/**
 * Sets the child widget of @bar.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets @widget as the widget that @bar will capture key events
 * from.
 * 
 * If key events are handled by the search bar, the bar will
 * be shown, and the entry populated with the entered text.
 * 
 * Note that despite the name of this function, the events
 * are only 'captured' in the bubble phase, which means that
 * editable child widgets of @widget will receive text input
 * before it gets captured. If that is not desired, you can
 * capture and forward the events yourself with
 * [method@Gtk.EventControllerKey.forward].
 *
 * @param widget a `GtkWidget`
 */
- (void)setKeyCaptureWidget:(OGTKWidget*)widget;

/**
 * Switches the search mode on or off.
 *
 * @param searchMode the new state of the search mode
 */
- (void)setSearchMode:(bool)searchMode;

/**
 * Shows or hides the close button.
 * 
 * Applications that already have a “search” toggle button should not
 * show a close button in their search bar, as it duplicates the role
 * of the toggle button.
 *
 * @param visible whether the close button will be shown or not
 */
- (void)setShowCloseButton:(bool)visible;

@end