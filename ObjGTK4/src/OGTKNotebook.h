/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKNotebookPage;

/**
 * `GtkNotebook` is a container whose children are pages switched
 * between using tabs.
 * 
 * ![An example GtkNotebook](notebook.png)
 * 
 * There are many configuration options for `GtkNotebook`. Among
 * other things, you can choose on which edge the tabs appear
 * (see [method@Gtk.Notebook.set_tab_pos]), whether, if there are
 * too many tabs to fit the notebook should be made bigger or scrolling
 * arrows added (see [method@Gtk.Notebook.set_scrollable]), and whether
 * there will be a popup menu allowing the users to switch pages.
 * (see [method@Gtk.Notebook.popup_enable]).
 * 
 * # GtkNotebook as GtkBuildable
 * 
 * The `GtkNotebook` implementation of the `GtkBuildable` interface
 * supports placing children into tabs by specifying “tab” as the
 * “type” attribute of a `<child>` element. Note that the content
 * of the tab must be created before the tab can be filled.
 * A tab child can be specified without specifying a `<child>`
 * type attribute.
 * 
 * To add a child widget in the notebooks action area, specify
 * "action-start" or “action-end” as the “type” attribute of the
 * `<child>` element.
 * 
 * An example of a UI definition fragment with `GtkNotebook`:
 * 
 * ```xml
 * <object class="GtkNotebook">
 *   <child>
 *     <object class="GtkLabel" id="notebook-content">
 *       <property name="label">Content</property>
 *     </object>
 *   </child>
 *   <child type="tab">
 *     <object class="GtkLabel" id="notebook-tab">
 *       <property name="label">Tab</property>
 *     </object>
 *   </child>
 * </object>
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * notebook
 * ├── header.top
 * │   ├── [<action widget>]
 * │   ├── tabs
 * │   │   ├── [arrow]
 * │   │   ├── tab
 * │   │   │   ╰── <tab label>
 * ┊   ┊   ┊
 * │   │   ├── tab[.reorderable-page]
 * │   │   │   ╰── <tab label>
 * │   │   ╰── [arrow]
 * │   ╰── [<action widget>]
 * │
 * ╰── stack
 *     ├── <child>
 *     ┊
 *     ╰── <child>
 * ```
 * 
 * `GtkNotebook` has a main CSS node with name `notebook`, a subnode
 * with name `header` and below that a subnode with name `tabs` which
 * contains one subnode per tab with name `tab`.
 * 
 * If action widgets are present, their CSS nodes are placed next
 * to the `tabs` node. If the notebook is scrollable, CSS nodes with
 * name `arrow` are placed as first and last child of the `tabs` node.
 * 
 * The main node gets the `.frame` style class when the notebook
 * has a border (see [method@Gtk.Notebook.set_show_border]).
 * 
 * The header node gets one of the style class `.top`, `.bottom`,
 * `.left` or `.right`, depending on where the tabs are placed. For
 * reorderable pages, the tab node gets the `.reorderable-page` class.
 * 
 * A `tab` node gets the `.dnd` style class while it is moved with drag-and-drop.
 * 
 * The nodes are always arranged from left-to-right, regardless of text direction.
 * 
 * # Accessibility
 * 
 * `GtkNotebook` uses the following roles:
 * 
 *  - %GTK_ACCESSIBLE_ROLE_GROUP for the notebook widget
 *  - %GTK_ACCESSIBLE_ROLE_TAB_LIST for the list of tabs
 *  - %GTK_ACCESSIBLE_ROLE_TAB role for each tab
 *  - %GTK_ACCESSIBLE_ROLE_TAB_PANEL for each page
 *
 */
@interface OGTKNotebook : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkNotebook*)castedGObject;

/**
 * Appends a page to @notebook.
 *
 * @param child the `GtkWidget` to use as the contents of the page
 * @param tabLabel the `GtkWidget` to be used as the label
 *   for the page, or %NULL to use the default label, “page N”
 * @return the index (starting from 0) of the appended
 *   page in the notebook, or -1 if function fails
 */
- (int)appendPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel;

/**
 * Appends a page to @notebook, specifying the widget to use as the
 * label in the popup menu.
 *
 * @param child the `GtkWidget` to use as the contents of the page
 * @param tabLabel the `GtkWidget` to be used as the label
 *   for the page, or %NULL to use the default label, “page N”
 * @param menuLabel the widget to use as a label for the
 *   page-switch menu, if that is enabled. If %NULL, and @tab_label
 *   is a `GtkLabel` or %NULL, then the menu label will be a newly
 *   created label with the same text as @tab_label; if @tab_label
 *   is not a `GtkLabel`, @menu_label must be specified if the
 *   page-switch menu is to be used.
 * @return the index (starting from 0) of the appended
 *   page in the notebook, or -1 if function fails
 */
- (int)appendPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel;

/**
 * Removes the child from the notebook.
 * 
 * This function is very similar to [method@Gtk.Notebook.remove_page],
 * but additionally informs the notebook that the removal
 * is happening as part of a tab DND operation, which should
 * not be cancelled.
 *
 * @param child a child
 */
- (void)detachTab:(OGTKWidget*)child;

/**
 * Gets one of the action widgets.
 * 
 * See [method@Gtk.Notebook.set_action_widget].
 *
 * @param packType pack type of the action widget to receive
 * @return The action widget
 *   with the given @pack_type or %NULL when this action
 *   widget has not been set
 */
- (OGTKWidget*)actionWidget:(GtkPackType)packType;

/**
 * Returns the page number of the current page.
 *
 * @return the index (starting from 0) of the current
 *   page in the notebook. If the notebook has no pages,
 *   then -1 will be returned.
 */
- (int)currentPage;

/**
 * Gets the current group name for @notebook.
 *
 * @return the group name,
 *   or %NULL if none is set
 */
- (OFString*)groupName;

/**
 * Retrieves the menu label widget of the page containing @child.
 *
 * @param child a widget contained in a page of @notebook
 * @return the menu label, or %NULL
 *   if the notebook page does not have a menu label other than
 *   the default (the tab label).
 */
- (OGTKWidget*)menuLabel:(OGTKWidget*)child;

/**
 * Retrieves the text of the menu label for the page containing
 * @child.
 *
 * @param child the child widget of a page of the notebook.
 * @return the text of the tab label, or %NULL if
 *   the widget does not have a menu label other than the default
 *   menu label, or the menu label widget is not a `GtkLabel`.
 *   The string is owned by the widget and must not be freed.
 */
- (OFString*)menuLabelText:(OGTKWidget*)child;

/**
 * Gets the number of pages in a notebook.
 *
 * @return the number of pages in the notebook
 */
- (int)npages;

/**
 * Returns the child widget contained in page number @page_num.
 *
 * @param pageNum the index of a page in the notebook, or -1
 *   to get the last page
 * @return the child widget, or %NULL if @page_num
 * is out of bounds
 */
- (OGTKWidget*)nthPage:(int)pageNum;

/**
 * Returns the `GtkNotebookPage` for @child.
 *
 * @param child a child of @notebook
 * @return the `GtkNotebookPage` for @child
 */
- (OGTKNotebookPage*)page:(OGTKWidget*)child;

/**
 * Returns a `GListModel` that contains the pages of the notebook.
 * 
 * This can be used to keep an up-to-date view. The model also
 * implements [iface@Gtk.SelectionModel] and can be used to track
 * and modify the visible page.
 *
 * @return a
 *   `GListModel` for the notebook's children
 */
- (GListModel*)pages;

/**
 * Returns whether the tab label area has arrows for scrolling.
 *
 * @return %TRUE if arrows for scrolling are present
 */
- (bool)scrollable;

/**
 * Returns whether a bevel will be drawn around the notebook pages.
 *
 * @return %TRUE if the bevel is drawn
 */
- (bool)showBorder;

/**
 * Returns whether the tabs of the notebook are shown.
 *
 * @return %TRUE if the tabs are shown
 */
- (bool)showTabs;

/**
 * Returns whether the tab contents can be detached from @notebook.
 *
 * @param child a child `GtkWidget`
 * @return %TRUE if the tab is detachable.
 */
- (bool)tabDetachable:(OGTKWidget*)child;

/**
 * Returns the tab label widget for the page @child.
 * 
 * %NULL is returned if @child is not in @notebook or
 * if no tab label has specifically been set for @child.
 *
 * @param child the page
 * @return the tab label
 */
- (OGTKWidget*)tabLabel:(OGTKWidget*)child;

/**
 * Retrieves the text of the tab label for the page containing
 * @child.
 *
 * @param child a widget contained in a page of @notebook
 * @return the text of the tab label, or %NULL if
 *   the tab label widget is not a `GtkLabel`. The string is owned
 *   by the widget and must not be freed.
 */
- (OFString*)tabLabelText:(OGTKWidget*)child;

/**
 * Gets the edge at which the tabs are drawn.
 *
 * @return the edge at which the tabs are drawn
 */
- (GtkPositionType)tabPos;

/**
 * Gets whether the tab can be reordered via drag and drop or not.
 *
 * @param child a child `GtkWidget`
 * @return %TRUE if the tab is reorderable.
 */
- (bool)tabReorderable:(OGTKWidget*)child;

/**
 * Insert a page into @notebook at the given position.
 *
 * @param child the `GtkWidget` to use as the contents of the page
 * @param tabLabel the `GtkWidget` to be used as the label
 *   for the page, or %NULL to use the default label, “page N”
 * @param position the index (starting at 0) at which to insert the page,
 *   or -1 to append the page after all other pages
 * @return the index (starting from 0) of the inserted
 *   page in the notebook, or -1 if function fails
 */
- (int)insertPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel position:(int)position;

/**
 * Insert a page into @notebook at the given position, specifying
 * the widget to use as the label in the popup menu.
 *
 * @param child the `GtkWidget` to use as the contents of the page
 * @param tabLabel the `GtkWidget` to be used as the label
 *   for the page, or %NULL to use the default label, “page N”
 * @param menuLabel the widget to use as a label for the
 *   page-switch menu, if that is enabled. If %NULL, and @tab_label
 *   is a `GtkLabel` or %NULL, then the menu label will be a newly
 *   created label with the same text as @tab_label; if @tab_label
 *   is not a `GtkLabel`, @menu_label must be specified if the
 *   page-switch menu is to be used.
 * @param position the index (starting at 0) at which to insert the page,
 *   or -1 to append the page after all other pages.
 * @return the index (starting from 0) of the inserted
 *   page in the notebook
 */
- (int)insertPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel position:(int)position;

/**
 * Switches to the next page.
 * 
 * Nothing happens if the current page is the last page.
 *
 */
- (void)nextPage;

/**
 * Finds the index of the page which contains the given child
 * widget.
 *
 * @param child a `GtkWidget`
 * @return the index of the page containing @child, or
 *   -1 if @child is not in the notebook
 */
- (int)pageNum:(OGTKWidget*)child;

/**
 * Disables the popup menu.
 *
 */
- (void)popupDisable;

/**
 * Enables the popup menu.
 * 
 * If the user clicks with the right mouse button on the tab labels,
 * a menu with all the pages will be popped up.
 *
 */
- (void)popupEnable;

/**
 * Prepends a page to @notebook.
 *
 * @param child the `GtkWidget` to use as the contents of the page
 * @param tabLabel the `GtkWidget` to be used as the label
 *   for the page, or %NULL to use the default label, “page N”
 * @return the index (starting from 0) of the prepended
 *   page in the notebook, or -1 if function fails
 */
- (int)prependPageWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel;

/**
 * Prepends a page to @notebook, specifying the widget to use as the
 * label in the popup menu.
 *
 * @param child the `GtkWidget` to use as the contents of the page
 * @param tabLabel the `GtkWidget` to be used as the label
 *   for the page, or %NULL to use the default label, “page N”
 * @param menuLabel the widget to use as a label for the
 *   page-switch menu, if that is enabled. If %NULL, and @tab_label
 *   is a `GtkLabel` or %NULL, then the menu label will be a newly
 *   created label with the same text as @tab_label; if @tab_label
 *   is not a `GtkLabel`, @menu_label must be specified if the
 *   page-switch menu is to be used.
 * @return the index (starting from 0) of the prepended
 *   page in the notebook, or -1 if function fails
 */
- (int)prependPageMenuWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel menuLabel:(OGTKWidget*)menuLabel;

/**
 * Switches to the previous page.
 * 
 * Nothing happens if the current page is the first page.
 *
 */
- (void)prevPage;

/**
 * Removes a page from the notebook given its index
 * in the notebook.
 *
 * @param pageNum the index of a notebook page, starting
 *   from 0. If -1, the last page will be removed.
 */
- (void)removePage:(int)pageNum;

/**
 * Reorders the page containing @child, so that it appears in position
 * @position.
 * 
 * If @position is greater than or equal to the number of children in
 * the list or negative, @child will be moved to the end of the list.
 *
 * @param child the child to move
 * @param position the new position, or -1 to move to the end
 */
- (void)reorderChildWithChild:(OGTKWidget*)child position:(int)position;

/**
 * Sets @widget as one of the action widgets.
 * 
 * Depending on the pack type the widget will be placed before
 * or after the tabs. You can use a `GtkBox` if you need to pack
 * more than one widget on the same side.
 *
 * @param widget a `GtkWidget`
 * @param packType pack type of the action widget
 */
- (void)setActionWidgetWithWidget:(OGTKWidget*)widget packType:(GtkPackType)packType;

/**
 * Switches to the page number @page_num.
 * 
 * Note that due to historical reasons, GtkNotebook refuses
 * to switch to a page unless the child widget is visible.
 * Therefore, it is recommended to show child widgets before
 * adding them to a notebook.
 *
 * @param pageNum index of the page to switch to, starting from 0.
 *   If negative, the last page will be used. If greater
 *   than the number of pages in the notebook, nothing
 *   will be done.
 */
- (void)setCurrentPage:(int)pageNum;

/**
 * Sets a group name for @notebook.
 * 
 * Notebooks with the same name will be able to exchange tabs
 * via drag and drop. A notebook with a %NULL group name will
 * not be able to exchange tabs with any other notebook.
 *
 * @param groupName the name of the notebook group,
 *   or %NULL to unset it
 */
- (void)setGroupName:(OFString*)groupName;

/**
 * Changes the menu label for the page containing @child.
 *
 * @param child the child widget
 * @param menuLabel the menu label, or %NULL for default
 */
- (void)setMenuLabelWithChild:(OGTKWidget*)child menuLabel:(OGTKWidget*)menuLabel;

/**
 * Creates a new label and sets it as the menu label of @child.
 *
 * @param child the child widget
 * @param menuText the label text
 */
- (void)setMenuLabelTextWithChild:(OGTKWidget*)child menuText:(OFString*)menuText;

/**
 * Sets whether the tab label area will have arrows for
 * scrolling if there are too many tabs to fit in the area.
 *
 * @param scrollable %TRUE if scroll arrows should be added
 */
- (void)setScrollable:(bool)scrollable;

/**
 * Sets whether a bevel will be drawn around the notebook pages.
 * 
 * This only has a visual effect when the tabs are not shown.
 *
 * @param showBorder %TRUE if a bevel should be drawn around the notebook
 */
- (void)setShowBorder:(bool)showBorder;

/**
 * Sets whether to show the tabs for the notebook or not.
 *
 * @param showTabs %TRUE if the tabs should be shown
 */
- (void)setShowTabs:(bool)showTabs;

/**
 * Sets whether the tab can be detached from @notebook to another
 * notebook or widget.
 * 
 * Note that two notebooks must share a common group identifier
 * (see [method@Gtk.Notebook.set_group_name]) to allow automatic tabs
 * interchange between them.
 * 
 * If you want a widget to interact with a notebook through DnD
 * (i.e.: accept dragged tabs from it) it must be set as a drop
 * destination by adding to it a [class@Gtk.DropTarget] controller that accepts
 * the GType `GTK_TYPE_NOTEBOOK_PAGE`. The `:value` of said drop target will be
 * preloaded with a [class@Gtk.NotebookPage] object that corresponds to the
 * dropped tab, so you can process the value via `::accept` or `::drop` signals.
 * 
 * Note that you should use [method@Gtk.Notebook.detach_tab] instead
 * of [method@Gtk.Notebook.remove_page] if you want to remove the tab
 * from the source notebook as part of accepting a drop. Otherwise,
 * the source notebook will think that the dragged tab was removed
 * from underneath the ongoing drag operation, and will initiate a
 * drag cancel animation.
 * 
 * ```c
 * static void
 * on_drag_data_received (GtkWidget        *widget,
 *                        GdkDrop          *drop,
 *                        GtkSelectionData *data,
 *                        guint             time,
 *                        gpointer          user_data)
 * {
 *   GtkDrag *drag;
 *   GtkWidget *notebook;
 *   GtkWidget **child;
 * 
 *   drag = gtk_drop_get_drag (drop);
 *   notebook = g_object_get_data (drag, "gtk-notebook-drag-origin");
 *   child = (void*) gtk_selection_data_get_data (data);
 * 
 *   // process_widget (*child);
 * 
 *   gtk_notebook_detach_tab (GTK_NOTEBOOK (notebook), *child);
 * }
 * ```
 * 
 * If you want a notebook to accept drags from other widgets,
 * you will have to set your own DnD code to do it.
 *
 * @param child a child `GtkWidget`
 * @param detachable whether the tab is detachable or not
 */
- (void)setTabDetachableWithChild:(OGTKWidget*)child detachable:(bool)detachable;

/**
 * Changes the tab label for @child.
 * 
 * If %NULL is specified for @tab_label, then the page will
 * have the label “page N”.
 *
 * @param child the page
 * @param tabLabel the tab label widget to use, or %NULL
 *   for default tab label
 */
- (void)setTabLabelWithChild:(OGTKWidget*)child tabLabel:(OGTKWidget*)tabLabel;

/**
 * Creates a new label and sets it as the tab label for the page
 * containing @child.
 *
 * @param child the page
 * @param tabText the label text
 */
- (void)setTabLabelTextWithChild:(OGTKWidget*)child tabText:(OFString*)tabText;

/**
 * Sets the edge at which the tabs are drawn.
 *
 * @param pos the edge to draw the tabs at
 */
- (void)setTabPos:(GtkPositionType)pos;

/**
 * Sets whether the notebook tab can be reordered
 * via drag and drop or not.
 *
 * @param child a child `GtkWidget`
 * @param reorderable whether the tab is reorderable or not
 */
- (void)setTabReorderableWithChild:(OGTKWidget*)child reorderable:(bool)reorderable;

@end