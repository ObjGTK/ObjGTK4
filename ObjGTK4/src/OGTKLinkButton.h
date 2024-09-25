/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKButton.h"

@class OGTKWidget;

/**
 * A `GtkLinkButton` is a button with a hyperlink.
 * 
 * ![An example GtkLinkButton](link-button.png)
 * 
 * It is useful to show quick links to resources.
 * 
 * A link button is created by calling either [ctor@Gtk.LinkButton.new] or
 * [ctor@Gtk.LinkButton.new_with_label]. If using the former, the URI you
 * pass to the constructor is used as a label for the widget.
 * 
 * The URI bound to a `GtkLinkButton` can be set specifically using
 * [method@Gtk.LinkButton.set_uri].
 * 
 * By default, `GtkLinkButton` calls [method@Gtk.FileLauncher.launch] when the button
 * is clicked. This behaviour can be overridden by connecting to the
 * [signal@Gtk.LinkButton::activate-link] signal and returning %TRUE from
 * the signal handler.
 * 
 * # CSS nodes
 * 
 * `GtkLinkButton` has a single CSS node with name button. To differentiate
 * it from a plain `GtkButton`, it gets the .link style class.
 * 
 * # Accessibility
 * 
 * `GtkLinkButton` uses the %GTK_ACCESSIBLE_ROLE_LINK role.
 *
 */
@interface OGTKLinkButton : OGTKButton
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)uri;
- (instancetype)initWithLabelWithUri:(OFString*)uri label:(OFString*)label;

/**
 * Methods
 */

- (GtkLinkButton*)castedGObject;

/**
 * Retrieves the URI of the `GtkLinkButton`.
 *
 * @return a valid URI. The returned string is owned by the link button
 *   and should not be modified or freed.
 */
- (OFString*)uri;

/**
 * Retrieves the “visited” state of the `GtkLinkButton`.
 * 
 * The button becomes visited when it is clicked. If the URI
 * is changed on the button, the “visited” state is unset again.
 * 
 * The state may also be changed using [method@Gtk.LinkButton.set_visited].
 *
 * @return %TRUE if the link has been visited, %FALSE otherwise
 */
- (bool)visited;

/**
 * Sets @uri as the URI where the `GtkLinkButton` points.
 * 
 * As a side-effect this unsets the “visited” state of the button.
 *
 * @param uri a valid URI
 */
- (void)setUri:(OFString*)uri;

/**
 * Sets the “visited” state of the `GtkLinkButton`.
 * 
 * See [method@Gtk.LinkButton.get_visited] for more details.
 *
 * @param visited the new “visited” state
 */
- (void)setVisited:(bool)visited;

@end