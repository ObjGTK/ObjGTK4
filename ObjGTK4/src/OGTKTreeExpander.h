/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKTreeListRow;

/**
 * `GtkTreeExpander` is a widget that provides an expander for a list.
 * 
 * It is typically placed as a bottommost child into a `GtkListView`
 * to allow users to expand and collapse children in a list with a
 * [class@Gtk.TreeListModel]. `GtkTreeExpander` provides the common UI
 * elements, gestures and keybindings for this purpose.
 * 
 * On top of this, the "listitem.expand", "listitem.collapse" and
 * "listitem.toggle-expand" actions are provided to allow adding custom
 * UI for managing expanded state.
 * 
 * It is important to mention that you want to set the
 * [property@Gtk.ListItem:focusable] property to FALSE when using this
 * widget, as you want the keyboard focus to be in the treexpander, and not
 * inside the list to make use of the keybindings.
 * 
 * The `GtkTreeListModel` must be set to not be passthrough. Then it
 * will provide [class@Gtk.TreeListRow] items which can be set via
 * [method@Gtk.TreeExpander.set_list_row] on the expander.
 * The expander will then watch that row item automatically.
 * [method@Gtk.TreeExpander.set_child] sets the widget that displays
 * the actual row contents.
 * 
 * `GtkTreeExpander` can be modified with properties such as
 * [property@Gtk.TreeExpander:indent-for-icon],
 * [property@Gtk.TreeExpander:indent-for-depth], and
 * [property@Gtk.TreeExpander:hide-expander] to achieve a different appearance.
 * This can even be done to influence individual rows, for example by binding
 * the [property@Gtk.TreeExpander:hide-expander] property to the item count of
 * the model of the treelistrow, to hide the expander for rows without children,
 * even if the row is expandable.
 * 
 * ## CSS nodes
 * 
 * ```
 * treeexpander
 * ├── [indent]*
 * ├── [expander]
 * ╰── <child>
 * ```
 * 
 * `GtkTreeExpander` has zero or one CSS nodes with the name "expander" that
 * should display the expander icon. The node will be `:checked` when it
 * is expanded. If the node is not expandable, an "indent" node will be
 * displayed instead.
 * 
 * For every level of depth, another "indent" node is prepended.
 * 
 * ## Accessibility
 * 
 * Until GTK 4.10, `GtkTreeExpander` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Since GTK 4.12, `GtkTreeExpander` uses the `GTK_ACCESSIBLE_ROLE_BUTTON` role.
 * Toggling it will change the `GTK_ACCESSIBLE_STATE_EXPANDED` state.
 *
 */
@interface OGTKTreeExpander : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkTreeExpander*)castedGObject;

/**
 * Gets the child widget displayed by @self.
 *
 * @return The child displayed by @self
 */
- (OGTKWidget*)child;

/**
 * Gets whether the TreeExpander should be hidden in a GtkTreeListRow.
 *
 * @return TRUE if the expander icon should be hidden. Otherwise FALSE.
 */
- (bool)hideExpander;

/**
 * TreeExpander indents each level of depth with an additional indent.
 *
 * @return TRUE if the child should be indented . Otherwise FALSE.
 */
- (bool)indentForDepth;

/**
 * TreeExpander indents the child by the width of an expander-icon if it is not expandable.
 *
 * @return TRUE if the child should be indented when not expandable. Otherwise FALSE.
 */
- (bool)indentForIcon;

/**
 * Forwards the item set on the `GtkTreeListRow` that @self is managing.
 * 
 * This call is essentially equivalent to calling:
 * 
 * ```c
 * gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (@self));
 * ```
 *
 * @return The item of the row
 */
- (gpointer)item;

/**
 * Gets the list row managed by @self.
 *
 * @return The list row displayed by @self
 */
- (OGTKTreeListRow*)listRow;

/**
 * Sets the content widget to display.
 *
 * @param child a `GtkWidget`
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets whether the expander icon should be visible in a GtkTreeListRow.
 *
 * @param hideExpander TRUE if the expander should be hidden. Otherwise FALSE.
 */
- (void)setHideExpander:(bool)hideExpander;

/**
 * Sets if the TreeExpander should indent the child according to its depth.
 *
 * @param indentForDepth TRUE if the child should be indented. Otherwise FALSE.
 */
- (void)setIndentForDepth:(bool)indentForDepth;

/**
 * Sets if the TreeExpander should indent the child by the width of an expander-icon when it is not expandable.
 *
 * @param indentForIcon TRUE if the child should be indented without expander. Otherwise FALSE.
 */
- (void)setIndentForIcon:(bool)indentForIcon;

/**
 * Sets the tree list row that this expander should manage.
 *
 * @param listRow a `GtkTreeListRow`
 */
- (void)setListRow:(OGTKTreeListRow*)listRow;

@end