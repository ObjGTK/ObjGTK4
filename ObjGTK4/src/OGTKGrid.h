/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkGrid` is a container which arranges its child widgets in
 * rows and columns.
 * 
 * ![An example GtkGrid](grid.png)
 * 
 * It supports arbitrary positions and horizontal/vertical spans.
 * 
 * Children are added using [method@Gtk.Grid.attach]. They can span multiple
 * rows or columns. It is also possible to add a child next to an existing
 * child, using [method@Gtk.Grid.attach_next_to]. To remove a child from the
 * grid, use [method@Gtk.Grid.remove].
 * 
 * The behaviour of `GtkGrid` when several children occupy the same grid
 * cell is undefined.
 * 
 * # GtkGrid as GtkBuildable
 * 
 * Every child in a `GtkGrid` has access to a custom [iface@Gtk.Buildable]
 * element, called `<layout>`. It can by used to specify a position in the
 * grid and optionally spans. All properties that can be used in the `<layout>`
 * element are implemented by [class@Gtk.GridLayoutChild].
 * 
 * It is implemented by `GtkWidget` using [class@Gtk.LayoutManager].
 * 
 * To showcase it, here is a simple example:
 * 
 * ```xml
 * <object class="GtkGrid" id="my_grid">
 *   <child>
 *     <object class="GtkButton" id="button1">
 *       <property name="label">Button 1</property>
 *       <layout>
 *         <property name="column">0</property>
 *         <property name="row">0</property>
 *       </layout>
 *     </object>
 *   </child>
 *   <child>
 *     <object class="GtkButton" id="button2">
 *       <property name="label">Button 2</property>
 *       <layout>
 *         <property name="column">1</property>
 *         <property name="row">0</property>
 *       </layout>
 *     </object>
 *   </child>
 *   <child>
 *     <object class="GtkButton" id="button3">
 *       <property name="label">Button 3</property>
 *       <layout>
 *         <property name="column">2</property>
 *         <property name="row">0</property>
 *         <property name="row-span">2</property>
 *       </layout>
 *     </object>
 *   </child>
 *   <child>
 *     <object class="GtkButton" id="button4">
 *       <property name="label">Button 4</property>
 *       <layout>
 *         <property name="column">0</property>
 *         <property name="row">1</property>
 *         <property name="column-span">2</property>
 *       </layout>
 *     </object>
 *   </child>
 * </object>
 * ```
 * 
 * It organizes the first two buttons side-by-side in one cell each.
 * The third button is in the last column but spans across two rows.
 * This is defined by the `row-span` property. The last button is
 * located in the second row and spans across two columns, which is
 * defined by the `column-span` property.
 * 
 * # CSS nodes
 * 
 * `GtkGrid` uses a single CSS node with name `grid`.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkGrid` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Starting from GTK 4.12, `GtkGrid` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 *
 */
@interface OGTKGrid : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGrid*)castedGObject;

/**
 * Adds a widget to the grid.
 * 
 * The position of @child is determined by @column and @row.
 * The number of “cells” that @child will occupy is determined
 * by @width and @height.
 *
 * @param child the widget to add
 * @param column the column number to attach the left side of @child to
 * @param row the row number to attach the top side of @child to
 * @param width the number of columns that @child will span
 * @param height the number of rows that @child will span
 */
- (void)attachWithChild:(OGTKWidget*)child column:(int)column row:(int)row width:(int)width height:(int)height;

/**
 * Adds a widget to the grid.
 * 
 * The widget is placed next to @sibling, on the side determined by
 * @side. When @sibling is %NULL, the widget is placed in row (for
 * left or right placement) or column 0 (for top or bottom placement),
 * at the end indicated by @side.
 * 
 * Attaching widgets labeled `[1]`, `[2]`, `[3]` with `@sibling == %NULL` and
 * `@side == %GTK_POS_LEFT` yields a layout of `[3][2][1]`.
 *
 * @param child the widget to add
 * @param sibling the child of @grid that @child will be placed
 *   next to, or %NULL to place @child at the beginning or end
 * @param side the side of @sibling that @child is positioned next to
 * @param width the number of columns that @child will span
 * @param height the number of rows that @child will span
 */
- (void)attachNextToWithChild:(OGTKWidget*)child sibling:(OGTKWidget*)sibling side:(GtkPositionType)side width:(int)width height:(int)height;

/**
 * Returns which row defines the global baseline of @grid.
 *
 * @return the row index defining the global baseline
 */
- (int)baselineRow;

/**
 * Gets the child of @grid whose area covers the grid
 * cell at @column, @row.
 *
 * @param column the left edge of the cell
 * @param row the top edge of the cell
 * @return the child at the given position
 */
- (OGTKWidget*)childAtWithColumn:(int)column row:(int)row;

/**
 * Returns whether all columns of @grid have the same width.
 *
 * @return whether all columns of @grid have the same width.
 */
- (bool)columnHomogeneous;

/**
 * Returns the amount of space between the columns of @grid.
 *
 * @return the column spacing of @grid
 */
- (guint)columnSpacing;

/**
 * Returns the baseline position of @row.
 * 
 * See [method@Gtk.Grid.set_row_baseline_position].
 *
 * @param row a row index
 * @return the baseline position of @row
 */
- (GtkBaselinePosition)rowBaselinePosition:(int)row;

/**
 * Returns whether all rows of @grid have the same height.
 *
 * @return whether all rows of @grid have the same height.
 */
- (bool)rowHomogeneous;

/**
 * Returns the amount of space between the rows of @grid.
 *
 * @return the row spacing of @grid
 */
- (guint)rowSpacing;

/**
 * Inserts a column at the specified position.
 * 
 * Children which are attached at or to the right of this position
 * are moved one column to the right. Children which span across this
 * position are grown to span the new column.
 *
 * @param position the position to insert the column at
 */
- (void)insertColumn:(int)position;

/**
 * Inserts a row or column at the specified position.
 * 
 * The new row or column is placed next to @sibling, on the side
 * determined by @side. If @side is %GTK_POS_TOP or %GTK_POS_BOTTOM,
 * a row is inserted. If @side is %GTK_POS_LEFT of %GTK_POS_RIGHT,
 * a column is inserted.
 *
 * @param sibling the child of @grid that the new row or column will be
 *   placed next to
 * @param side the side of @sibling that @child is positioned next to
 */
- (void)insertNextToWithSibling:(OGTKWidget*)sibling side:(GtkPositionType)side;

/**
 * Inserts a row at the specified position.
 * 
 * Children which are attached at or below this position
 * are moved one row down. Children which span across this
 * position are grown to span the new row.
 *
 * @param position the position to insert the row at
 */
- (void)insertRow:(int)position;

/**
 * Queries the attach points and spans of @child inside the given `GtkGrid`.
 *
 * @param child a `GtkWidget` child of @grid
 * @param column the column used to attach the left side of @child
 * @param row the row used to attach the top side of @child
 * @param width the number of columns @child spans
 * @param height the number of rows @child spans
 */
- (void)queryChildWithChild:(OGTKWidget*)child column:(int*)column row:(int*)row width:(int*)width height:(int*)height;

/**
 * Removes a child from @grid.
 * 
 * The child must have been added with
 * [method@Gtk.Grid.attach] or [method@Gtk.Grid.attach_next_to].
 *
 * @param child the child widget to remove
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Removes a column from the grid.
 * 
 * Children that are placed in this column are removed,
 * spanning children that overlap this column have their
 * width reduced by one, and children after the column
 * are moved to the left.
 *
 * @param position the position of the column to remove
 */
- (void)removeColumn:(int)position;

/**
 * Removes a row from the grid.
 * 
 * Children that are placed in this row are removed,
 * spanning children that overlap this row have their
 * height reduced by one, and children below the row
 * are moved up.
 *
 * @param position the position of the row to remove
 */
- (void)removeRow:(int)position;

/**
 * Sets which row defines the global baseline for the entire grid.
 * 
 * Each row in the grid can have its own local baseline, but only
 * one of those is global, meaning it will be the baseline in the
 * parent of the @grid.
 *
 * @param row the row index
 */
- (void)setBaselineRow:(int)row;

/**
 * Sets whether all columns of @grid will have the same width.
 *
 * @param homogeneous %TRUE to make columns homogeneous
 */
- (void)setColumnHomogeneous:(bool)homogeneous;

/**
 * Sets the amount of space between columns of @grid.
 *
 * @param spacing the amount of space to insert between columns
 */
- (void)setColumnSpacing:(guint)spacing;

/**
 * Sets how the baseline should be positioned on @row of the
 * grid, in case that row is assigned more space than is requested.
 * 
 * The default baseline position is %GTK_BASELINE_POSITION_CENTER.
 *
 * @param row a row index
 * @param pos a `GtkBaselinePosition`
 */
- (void)setRowBaselinePositionWithRow:(int)row pos:(GtkBaselinePosition)pos;

/**
 * Sets whether all rows of @grid will have the same height.
 *
 * @param homogeneous %TRUE to make rows homogeneous
 */
- (void)setRowHomogeneous:(bool)homogeneous;

/**
 * Sets the amount of space between rows of @grid.
 *
 * @param spacing the amount of space to insert between rows
 */
- (void)setRowSpacing:(guint)spacing;

@end