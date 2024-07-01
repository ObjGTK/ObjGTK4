/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkListBoxRow` is the kind of widget that can be added to a `GtkListBox`.
 *
 */
@interface OGTKListBoxRow : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkListBoxRow*)castedGObject;

/**
 * Marks @row as changed, causing any state that depends on this
 * to be updated.
 * 
 * This affects sorting, filtering and headers.
 * 
 * Note that calls to this method must be in sync with the data
 * used for the row functions. For instance, if the list is
 * mirroring some external data set, and *two* rows changed in the
 * external data set then when you call gtk_list_box_row_changed()
 * on the first row the sort function must only read the new data
 * for the first of the two changed rows, otherwise the resorting
 * of the rows will be wrong.
 * 
 * This generally means that if you don’t fully control the data
 * model you have to duplicate the data that affects the listbox
 * row functions into the row widgets themselves. Another alternative
 * is to call [method@Gtk.ListBox.invalidate_sort] on any model change,
 * but that is more expensive.
 *
 */
- (void)changed;

/**
 * Gets whether the row is activatable.
 *
 * @return %TRUE if the row is activatable
 */
- (bool)activatable;

/**
 * Gets the child widget of @row.
 *
 * @return the child widget of @row
 */
- (OGTKWidget*)child;

/**
 * Returns the current header of the @row.
 * 
 * This can be used
 * in a [callback@Gtk.ListBoxUpdateHeaderFunc] to see if
 * there is a header set already, and if so to update
 * the state of it.
 *
 * @return the current header
 */
- (OGTKWidget*)header;

/**
 * Gets the current index of the @row in its `GtkListBox` container.
 *
 * @return the index of the @row, or -1 if the @row is not in a listbox
 */
- (int)index;

/**
 * Gets whether the row can be selected.
 *
 * @return %TRUE if the row is selectable
 */
- (bool)selectable;

/**
 * Returns whether the child is currently selected in its
 * `GtkListBox` container.
 *
 * @return %TRUE if @row is selected
 */
- (bool)isSelected;

/**
 * Set whether the row is activatable.
 *
 * @param activatable %TRUE to mark the row as activatable
 */
- (void)setActivatable:(bool)activatable;

/**
 * Sets the child widget of @self.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets the current header of the @row.
 * 
 * This is only allowed to be called
 * from a [callback@Gtk.ListBoxUpdateHeaderFunc].
 * It will replace any existing header in the row,
 * and be shown in front of the row in the listbox.
 *
 * @param header the header
 */
- (void)setHeader:(OGTKWidget*)header;

/**
 * Set whether the row can be selected.
 *
 * @param selectable %TRUE to mark the row as selectable
 */
- (void)setSelectable:(bool)selectable;

@end