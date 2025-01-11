/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGMenuModel;
@class OGTKColumnView;
@class OGTKListItemFactory;
@class OGTKSorter;

/**
 * `GtkColumnViewColumn` represents the columns being added to a `GtkColumnView`.
 * 
 * The main ingredient for a `GtkColumnViewColumn` is the `GtkListItemFactory`
 * that tells the columnview how to create cells for this column from items in
 * the model.
 * 
 * Columns have a title, and can optionally have a header menu set
 * with [method@Gtk.ColumnViewColumn.set_header_menu].
 * 
 * A sorter can be associated with a column using
 * [method@Gtk.ColumnViewColumn.set_sorter], to let users influence sorting
 * by clicking on the column header.
 *
 */
@interface OGTKColumnViewColumn : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)columnViewColumnWithTitle:(OFString*)title factory:(OGTKListItemFactory*)factory;

/**
 * Methods
 */

- (GtkColumnViewColumn*)castedGObject;

/**
 * Gets the column view that's currently displaying this column.
 * 
 * If @self has not been added to a column view yet, %NULL is returned.
 *
 * @return The column view displaying @self.
 */
- (OGTKColumnView*)columnView;

/**
 * Returns whether this column should expand.
 *
 * @return %TRUE if this column expands
 */
- (bool)expand;

/**
 * Gets the factory that's currently used to populate list items for
 * this column.
 *
 * @return The factory in use
 */
- (OGTKListItemFactory*)factory;

/**
 * Gets the fixed width of the column.
 *
 * @return the fixed with of the column
 */
- (int)fixedWidth;

/**
 * Gets the menu model that is used to create the context menu
 * for the column header.
 *
 * @return the `GMenuModel`
 */
- (OGMenuModel*)headerMenu;

/**
 * Returns the ID set with gtk_column_view_column_set_id().
 *
 * @return The column's ID
 */
- (OFString*)id;

/**
 * Returns whether this column is resizable.
 *
 * @return %TRUE if this column is resizable
 */
- (bool)resizable;

/**
 * Returns the sorter that is associated with the column.
 *
 * @return the `GtkSorter` of @self
 */
- (OGTKSorter*)sorter;

/**
 * Returns the title set with gtk_column_view_column_set_title().
 *
 * @return The column's title
 */
- (OFString*)title;

/**
 * Returns whether this column is visible.
 *
 * @return %TRUE if this column is visible
 */
- (bool)visible;

/**
 * Sets the column to take available extra space.
 * 
 * The extra space is shared equally amongst all columns that
 * have the expand set to %TRUE.
 *
 * @param expand %TRUE if this column should expand to fill available sace
 */
- (void)setExpand:(bool)expand;

/**
 * Sets the `GtkListItemFactory` to use for populating list items for this
 * column.
 *
 * @param factory the factory to use
 */
- (void)setFactory:(OGTKListItemFactory*)factory;

/**
 * If @fixed_width is not -1, sets the fixed width of @column;
 * otherwise unsets it.
 * 
 * Setting a fixed width overrides the automatically calculated
 * width. Interactive resizing also sets the “fixed-width” property.
 *
 * @param fixedWidth the new fixed width, or -1
 */
- (void)setFixedWidth:(int)fixedWidth;

/**
 * Sets the menu model that is used to create the context menu
 * for the column header.
 *
 * @param menu a `GMenuModel`
 */
- (void)setHeaderMenu:(OGMenuModel*)menu;

/**
 * Sets the id of this column.
 * 
 * GTK makes no use of this, but applications can use it when
 * storing column view configuration.
 * 
 * It is up to callers to ensure uniqueness of IDs.
 *
 * @param identifier ID to use for this column
 */
- (void)setId:(OFString*)identifier;

/**
 * Sets whether this column should be resizable by dragging.
 *
 * @param resizable whether this column should be resizable
 */
- (void)setResizable:(bool)resizable;

/**
 * Associates a sorter with the column.
 * 
 * If @sorter is %NULL, the column will not let users change
 * the sorting by clicking on its header.
 * 
 * This sorter can be made active by clicking on the column
 * header, or by calling [method@Gtk.ColumnView.sort_by_column].
 * 
 * See [method@Gtk.ColumnView.get_sorter] for the necessary steps
 * for setting up customizable sorting for [class@Gtk.ColumnView].
 *
 * @param sorter the `GtkSorter` to associate with @column
 */
- (void)setSorter:(OGTKSorter*)sorter;

/**
 * Sets the title of this column.
 * 
 * The title is displayed in the header of a `GtkColumnView`
 * for this column and is therefore user-facing text that should
 * be translated.
 *
 * @param title Title to use for this column
 */
- (void)setTitle:(OFString*)title;

/**
 * Sets whether this column should be visible in views.
 *
 * @param visible whether this column should be visible
 */
- (void)setVisible:(bool)visible;

@end