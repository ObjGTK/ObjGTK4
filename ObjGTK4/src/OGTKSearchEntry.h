/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkSearchEntry` is an entry widget that has been tailored for use
 * as a search entry.
 * 
 * The main API for interacting with a `GtkSearchEntry` as entry
 * is the `GtkEditable` interface.
 * 
 * ![An example GtkSearchEntry](search-entry.png)
 * 
 * It will show an inactive symbolic “find” icon when the search
 * entry is empty, and a symbolic “clear” icon when there is text.
 * Clicking on the “clear” icon will empty the search entry.
 * 
 * To make filtering appear more reactive, it is a good idea to
 * not react to every change in the entry text immediately, but
 * only after a short delay. To support this, `GtkSearchEntry`
 * emits the [signal@Gtk.SearchEntry::search-changed] signal which
 * can be used instead of the [signal@Gtk.Editable::changed] signal.
 * 
 * The [signal@Gtk.SearchEntry::previous-match],
 * [signal@Gtk.SearchEntry::next-match] and
 * [signal@Gtk.SearchEntry::stop-search] signals can be used to
 * implement moving between search results and ending the search.
 * 
 * Often, `GtkSearchEntry` will be fed events by means of being
 * placed inside a [class@Gtk.SearchBar]. If that is not the case,
 * you can use [method@Gtk.SearchEntry.set_key_capture_widget] to
 * let it capture key input from another widget.
 * 
 * `GtkSearchEntry` provides only minimal API and should be used with
 * the [iface@Gtk.Editable] API.
 * 
 * ## CSS Nodes
 * 
 * ```
 * entry.search
 * ╰── text
 * ```
 * 
 * `GtkSearchEntry` has a single CSS node with name entry that carries
 * a `.search` style class, and the text node is a child of that.
 * 
 * ## Accessibility
 * 
 * `GtkSearchEntry` uses the %GTK_ACCESSIBLE_ROLE_SEARCH_BOX role.
 *
 */
@interface OGTKSearchEntry : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkSearchEntry*)castedGObject;

/**
 * Gets the input purpose for @entry.
 *
 * @return The input hints
 */
- (GtkInputHints)inputHints;

/**
 * Gets the input purpose of @entry.
 *
 * @return The input hints
 */
- (GtkInputPurpose)inputPurpose;

/**
 * Gets the widget that @entry is capturing key events from.
 *
 * @return The key capture widget.
 */
- (OGTKWidget*)keyCaptureWidget;

/**
 * Gets the placeholder text associated with @entry.
 *
 * @return The placeholder text.
 */
- (OFString*)placeholderText;

/**
 * Get the delay to be used between the last keypress and the
 * [signal@Gtk.SearchEntry::search-changed] signal being emitted.
 *
 * @return a delay in milliseconds.
 */
- (guint)searchDelay;

/**
 * Sets the input hints for @entry.
 *
 * @param hints the new input hints
 */
- (void)setInputHints:(GtkInputHints)hints;

/**
 * Sets the input purpose of @entry.
 *
 * @param purpose the new input purpose
 */
- (void)setInputPurpose:(GtkInputPurpose)purpose;

/**
 * Sets @widget as the widget that @entry will capture key
 * events from.
 * 
 * Key events are consumed by the search entry to start or
 * continue a search.
 * 
 * If the entry is part of a `GtkSearchBar`, it is preferable
 * to call [method@Gtk.SearchBar.set_key_capture_widget] instead,
 * which will reveal the entry in addition to triggering the
 * search entry.
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
 * Sets the placeholder text associated with @entry.
 *
 * @param text the text to set as a placeholder
 */
- (void)setPlaceholderText:(OFString*)text;

/**
 * Set the delay to be used between the last keypress and the
 * [signal@Gtk.SearchEntry::search-changed] signal being emitted.
 *
 * @param delay a delay in milliseconds
 */
- (void)setSearchDelay:(guint)delay;

@end