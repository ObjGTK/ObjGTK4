/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkColumnViewRow` is used by [class@Gtk.ColumnView] to allow configuring
 * how rows are displayed.
 * 
 * It is not used to set the widgets displayed in the individual cells. For that
 * see [method@GtkColumnViewColumn.set_factory] and [class@GtkColumnViewCell].
 *
 */
@interface OGTKColumnViewRow : OGObject
{

}


/**
 * Methods
 */

- (GtkColumnViewRow*)castedGObject;

/**
 * Gets the accessible description of @self.
 *
 * @return the accessible description
 */
- (OFString*)accessibleDescription;

/**
 * Gets the accessible label of @self.
 *
 * @return the accessible label
 */
- (OFString*)accessibleLabel;

/**
 * Checks if the row has been set to be activatable via
 * gtk_column_view_row_set_activatable().
 *
 * @return %TRUE if the row is activatable
 */
- (bool)activatable;

/**
 * Checks if a row item has been set to be focusable via
 * gtk_column_view_row_set_focusable().
 *
 * @return %TRUE if the row is focusable
 */
- (bool)focusable;

/**
 * Gets the model item that associated with @self.
 * 
 * If @self is unbound, this function returns %NULL.
 *
 * @return The item displayed
 */
- (gpointer)item;

/**
 * Gets the position in the model that @self currently displays.
 * 
 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
 *
 * @return The position of this row
 */
- (guint)position;

/**
 * Checks if the row has been set to be selectable via
 * gtk_column_view_row_set_selectable().
 * 
 * Do not confuse this function with [method@Gtk.ColumnViewRow.get_selected].
 *
 * @return %TRUE if the row is selectable
 */
- (bool)selectable;

/**
 * Checks if the item is selected that this row corresponds to.
 * 
 * The selected state is maintained by the list widget and its model
 * and cannot be set otherwise.
 *
 * @return %TRUE if the item is selected.
 */
- (bool)selected;

/**
 * Sets the accessible description for the row,
 * which may be used by e.g. screen readers.
 *
 * @param description the description
 */
- (void)setAccessibleDescription:(OFString*)description;

/**
 * Sets the accessible label for the row,
 * which may be used by e.g. screen readers.
 *
 * @param label the label
 */
- (void)setAccessibleLabel:(OFString*)label;

/**
 * Sets @self to be activatable.
 * 
 * If a row is activatable, double-clicking on the row, using
 * the Return key or calling gtk_widget_activate() will activate
 * the row. Activating instructs the containing columnview to
 * emit the [signal@Gtk.ColumnView::activate] signal.
 * 
 * By default, row are activatable.
 *
 * @param activatable if the row should be activatable
 */
- (void)setActivatable:(bool)activatable;

/**
 * Sets @self to be focusable.
 * 
 * If a row is focusable, it can be focused using the keyboard.
 * This works similar to [method@Gtk.Widget.set_focusable].
 * 
 * Note that if row are not focusable, the contents of cells can still be focused if
 * they are focusable.
 * 
 * By default, rows are focusable.
 *
 * @param focusable if the row should be focusable
 */
- (void)setFocusable:(bool)focusable;

/**
 * Sets @self to be selectable.
 * 
 * If a row is selectable, clicking on the row or using the keyboard
 * will try to select or unselect the row. Whether this succeeds is up to
 * the model to determine, as it is managing the selected state.
 * 
 * Note that this means that making a row non-selectable has no
 * influence on the selected state at all. A non-selectable row
 * may still be selected.
 * 
 * By default, rows are selectable.
 *
 * @param selectable if the row should be selectable
 */
- (void)setSelectable:(bool)selectable;

@end