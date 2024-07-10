/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;
@class OGTKSnapshot;
@class OGTKCellRenderer;
@class OGTKCellAreaContext;

/**
 * An abstract class for laying out `GtkCellRenderer`s
 * 
 * The `GtkCellArea` is an abstract class for [iface@Gtk.CellLayout]
 * widgets (also referred to as "layouting widgets") to interface with
 * an arbitrary number of [class@Gtk.CellRenderer]s and interact with the user
 * for a given [iface@Gtk.TreeModel] row.
 * 
 * The cell area handles events, focus navigation, drawing and
 * size requests and allocations for a given row of data.
 * 
 * Usually users dont have to interact with the `GtkCellArea` directly
 * unless they are implementing a cell-layouting widget themselves.
 * 
 * # Requesting area sizes
 * 
 * As outlined in
 * [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management),
 * GTK uses a height-for-width
 * geometry management system to compute the sizes of widgets and user
 * interfaces. `GtkCellArea` uses the same semantics to calculate the
 * size of an area for an arbitrary number of `GtkTreeModel` rows.
 * 
 * When requesting the size of a cell area one needs to calculate
 * the size for a handful of rows, and this will be done differently by
 * different layouting widgets. For instance a [class@Gtk.TreeViewColumn]
 * always lines up the areas from top to bottom while a [class@Gtk.IconView]
 * on the other hand might enforce that all areas received the same
 * width and wrap the areas around, requesting height for more cell
 * areas when allocated less width.
 * 
 * It’s also important for areas to maintain some cell
 * alignments with areas rendered for adjacent rows (cells can
 * appear “columnized” inside an area even when the size of
 * cells are different in each row). For this reason the `GtkCellArea`
 * uses a [class@Gtk.CellAreaContext] object to store the alignments
 * and sizes along the way (as well as the overall largest minimum
 * and natural size for all the rows which have been calculated
 * with the said context).
 * 
 * The [class@Gtk.CellAreaContext] is an opaque object specific to the
 * `GtkCellArea` which created it (see [method@Gtk.CellArea.create_context]).
 * 
 * The owning cell-layouting widget can create as many contexts as
 * it wishes to calculate sizes of rows which should receive the
 * same size in at least one orientation (horizontally or vertically),
 * However, it’s important that the same [class@Gtk.CellAreaContext] which
 * was used to request the sizes for a given `GtkTreeModel` row be
 * used when rendering or processing events for that row.
 * 
 * In order to request the width of all the rows at the root level
 * of a `GtkTreeModel` one would do the following:
 * 
 * ```c
 * GtkTreeIter iter;
 * int minimum_width;
 * int natural_width;
 * 
 * valid = gtk_tree_model_get_iter_first (model, &iter);
 * while (valid)
 *   {
 *     gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
 *     gtk_cell_area_get_preferred_width (area, context, widget, NULL, NULL);
 * 
 *     valid = gtk_tree_model_iter_next (model, &iter);
 *   }
 * 
 * gtk_cell_area_context_get_preferred_width (context, &minimum_width, &natural_width);
 * ```
 * 
 * Note that in this example it’s not important to observe the
 * returned minimum and natural width of the area for each row
 * unless the cell-layouting object is actually interested in the
 * widths of individual rows. The overall width is however stored
 * in the accompanying `GtkCellAreaContext` object and can be consulted
 * at any time.
 * 
 * This can be useful since `GtkCellLayout` widgets usually have to
 * support requesting and rendering rows in treemodels with an
 * exceedingly large amount of rows. The `GtkCellLayout` widget in
 * that case would calculate the required width of the rows in an
 * idle or timeout source (see [func@GLib.timeout_add]) and when the widget
 * is requested its actual width in [vfunc@Gtk.Widget.measure]
 * it can simply consult the width accumulated so far in the
 * `GtkCellAreaContext` object.
 * 
 * A simple example where rows are rendered from top to bottom and
 * take up the full width of the layouting widget would look like:
 * 
 * ```c
 * static void
 * foo_get_preferred_width (GtkWidget *widget,
 *                          int       *minimum_size,
 *                          int       *natural_size)
 * {
 *   Foo *self = FOO (widget);
 *   FooPrivate *priv = foo_get_instance_private (self);
 * 
 *   foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);
 * 
 *   gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, natural_size);
 * }
 * ```
 * 
 * In the above example the `Foo` widget has to make sure that some
 * row sizes have been calculated (the amount of rows that `Foo` judged
 * was appropriate to request space for in a single timeout iteration)
 * before simply returning the amount of space required by the area via
 * the `GtkCellAreaContext`.
 * 
 * Requesting the height for width (or width for height) of an area is
 * a similar task except in this case the `GtkCellAreaContext` does not
 * store the data (actually, it does not know how much space the layouting
 * widget plans to allocate it for every row. It’s up to the layouting
 * widget to render each row of data with the appropriate height and
 * width which was requested by the `GtkCellArea`).
 * 
 * In order to request the height for width of all the rows at the
 * root level of a `GtkTreeModel` one would do the following:
 * 
 * ```c
 * GtkTreeIter iter;
 * int minimum_height;
 * int natural_height;
 * int full_minimum_height = 0;
 * int full_natural_height = 0;
 * 
 * valid = gtk_tree_model_get_iter_first (model, &iter);
 * while (valid)
 *   {
 *     gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
 *     gtk_cell_area_get_preferred_height_for_width (area, context, widget,
 *                                                   width, &minimum_height, &natural_height);
 * 
 *     if (width_is_for_allocation)
 *        cache_row_height (&iter, minimum_height, natural_height);
 * 
 *     full_minimum_height += minimum_height;
 *     full_natural_height += natural_height;
 * 
 *     valid = gtk_tree_model_iter_next (model, &iter);
 *   }
 * ```
 * 
 * Note that in the above example we would need to cache the heights
 * returned for each row so that we would know what sizes to render the
 * areas for each row. However we would only want to really cache the
 * heights if the request is intended for the layouting widgets real
 * allocation.
 * 
 * In some cases the layouting widget is requested the height for an
 * arbitrary for_width, this is a special case for layouting widgets
 * who need to request size for tens of thousands  of rows. For this
 * case it’s only important that the layouting widget calculate
 * one reasonably sized chunk of rows and return that height
 * synchronously. The reasoning here is that any layouting widget is
 * at least capable of synchronously calculating enough height to fill
 * the screen height (or scrolled window height) in response to a single
 * call to [vfunc@Gtk.Widget.measure]. Returning
 * a perfect height for width that is larger than the screen area is
 * inconsequential since after the layouting receives an allocation
 * from a scrolled window it simply continues to drive the scrollbar
 * values while more and more height is required for the row heights
 * that are calculated in the background.
 * 
 * # Rendering Areas
 * 
 * Once area sizes have been acquired at least for the rows in the
 * visible area of the layouting widget they can be rendered at
 * [vfunc@Gtk.Widget.snapshot] time.
 * 
 * A crude example of how to render all the rows at the root level
 * runs as follows:
 * 
 * ```c
 * GtkAllocation allocation;
 * GdkRectangle cell_area = { 0, };
 * GtkTreeIter iter;
 * int minimum_width;
 * int natural_width;
 * 
 * gtk_widget_get_allocation (widget, &allocation);
 * cell_area.width = allocation.width;
 * 
 * valid = gtk_tree_model_get_iter_first (model, &iter);
 * while (valid)
 *   {
 *     cell_area.height = get_cached_height_for_row (&iter);
 * 
 *     gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
 *     gtk_cell_area_render (area, context, widget, cr,
 *                           &cell_area, &cell_area, state_flags, FALSE);
 * 
 *     cell_area.y += cell_area.height;
 * 
 *     valid = gtk_tree_model_iter_next (model, &iter);
 *   }
 * ```
 * 
 * Note that the cached height in this example really depends on how
 * the layouting widget works. The layouting widget might decide to
 * give every row its minimum or natural height or, if the model content
 * is expected to fit inside the layouting widget without scrolling, it
 * would make sense to calculate the allocation for each row at
 * the time the widget is allocated using [func@Gtk.distribute_natural_allocation].
 * 
 * # Handling Events and Driving Keyboard Focus
 * 
 * Passing events to the area is as simple as handling events on any
 * normal widget and then passing them to the [method@Gtk.CellArea.event]
 * API as they come in. Usually `GtkCellArea` is only interested in
 * button events, however some customized derived areas can be implemented
 * who are interested in handling other events. Handling an event can
 * trigger the [`signal@Gtk.CellArea::focus-changed`] signal to fire; as well
 * as [`signal@GtkCellArea::add-editable`] in the case that an editable cell
 * was clicked and needs to start editing. You can call
 * [method@Gtk.CellArea.stop_editing] at any time to cancel any cell editing
 * that is currently in progress.
 * 
 * The `GtkCellArea` drives keyboard focus from cell to cell in a way
 * similar to `GtkWidget`. For layouting widgets that support giving
 * focus to cells it’s important to remember to pass `GTK_CELL_RENDERER_FOCUSED`
 * to the area functions for the row that has focus and to tell the
 * area to paint the focus at render time.
 * 
 * Layouting widgets that accept focus on cells should implement the
 * [vfunc@Gtk.Widget.focus] virtual method. The layouting widget is always
 * responsible for knowing where `GtkTreeModel` rows are rendered inside
 * the widget, so at [vfunc@Gtk.Widget.focus] time the layouting widget
 * should use the `GtkCellArea` methods to navigate focus inside the area
 * and then observe the [enum@Gtk.DirectionType] to pass the focus to adjacent
 * rows and areas.
 * 
 * A basic example of how the [vfunc@Gtk.Widget.focus] virtual method
 * should be implemented:
 * 
 * ```
 * static gboolean
 * foo_focus (GtkWidget       *widget,
 *            GtkDirectionType direction)
 * {
 *   Foo *self = FOO (widget);
 *   FooPrivate *priv = foo_get_instance_private (self);
 *   int focus_row = priv->focus_row;
 *   gboolean have_focus = FALSE;
 * 
 *   if (!gtk_widget_has_focus (widget))
 *     gtk_widget_grab_focus (widget);
 * 
 *   valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, priv->focus_row);
 *   while (valid)
 *     {
 *       gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, FALSE, FALSE);
 * 
 *       if (gtk_cell_area_focus (priv->area, direction))
 *         {
 *            priv->focus_row = focus_row;
 *            have_focus = TRUE;
 *            break;
 *         }
 *       else
 *         {
 *           if (direction == GTK_DIR_RIGHT ||
 *               direction == GTK_DIR_LEFT)
 *             break;
 *           else if (direction == GTK_DIR_UP ||
 *                    direction == GTK_DIR_TAB_BACKWARD)
 *            {
 *               if (focus_row == 0)
 *                 break;
 *               else
 *                {
 *                   focus_row--;
 *                   valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, focus_row);
 *                }
 *             }
 *           else
 *             {
 *               if (focus_row == last_row)
 *                 break;
 *               else
 *                 {
 *                   focus_row++;
 *                   valid = gtk_tree_model_iter_next (priv->model, &iter);
 *                 }
 *             }
 *         }
 *     }
 *     return have_focus;
 * }
 * ```
 * 
 * Note that the layouting widget is responsible for matching the
 * `GtkDirectionType` values to the way it lays out its cells.
 * 
 * # Cell Properties
 * 
 * The `GtkCellArea` introduces cell properties for `GtkCellRenderer`s.
 * This provides some general interfaces for defining the relationship
 * cell areas have with their cells. For instance in a [class@Gtk.CellAreaBox]
 * a cell might “expand” and receive extra space when the area is allocated
 * more than its full natural request, or a cell might be configured to “align”
 * with adjacent rows which were requested and rendered with the same
 * `GtkCellAreaContext`.
 * 
 * Use [method@Gtk.CellAreaClass.install_cell_property] to install cell
 * properties for a cell area class and [method@Gtk.CellAreaClass.find_cell_property]
 * or [method@Gtk.CellAreaClass.list_cell_properties] to get information about
 * existing cell properties.
 * 
 * To set the value of a cell property, use [method@Gtk.CellArea.cell_set_property],
 * [method@Gtk.CellArea.cell_set] or [method@Gtk.CellArea.cell_set_valist]. To obtain
 * the value of a cell property, use [method@Gtk.CellArea.cell_get_property]
 * [method@Gtk.CellArea.cell_get] or [method@Gtk.CellArea.cell_get_valist].
 *
 */
@interface OGTKCellArea : OGObject
{

}


/**
 * Methods
 */

- (GtkCellArea*)castedGObject;

/**
 * Activates @area, usually by activating the currently focused
 * cell, however some subclasses which embed widgets in the area
 * can also activate a widget if it currently has the focus.
 *
 * @param context the `GtkCellArea`Context in context with the current row data
 * @param widget the `GtkWidget` that @area is rendering on
 * @param cellArea the size and location of @area relative to @widget’s allocation
 * @param flags the `GtkCellRenderer`State flags for @area for this row of data.
 * @param editOnly if %TRUE then only cell renderers that are %GTK_CELL_RENDERER_MODE_EDITABLE
 *             will be activated.
 * @return Whether @area was successfully activated.
 */
- (bool)activateWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags editOnly:(bool)editOnly;

/**
 * This is used by `GtkCellArea` subclasses when handling events
 * to activate cells, the base `GtkCellArea` class activates cells
 * for keyboard events for free in its own GtkCellArea->activate()
 * implementation.
 *
 * @param widget the `GtkWidget` that @area is rendering onto
 * @param renderer the `GtkCellRenderer` in @area to activate
 * @param event the `GdkEvent` for which cell activation should occur
 * @param cellArea the `GdkRectangle` in @widget relative coordinates
 *             of @renderer for the current row.
 * @param flags the `GtkCellRenderer`State for @renderer
 * @return whether cell activation was successful
 */
- (bool)activateCellWithWidget:(OGTKWidget*)widget renderer:(OGTKCellRenderer*)renderer event:(GdkEvent*)event cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags;

/**
 * Adds @renderer to @area with the default child cell properties.
 *
 * @param renderer the `GtkCellRenderer` to add to @area
 */
- (void)add:(OGTKCellRenderer*)renderer;

/**
 * Adds @sibling to @renderer’s focusable area, focus will be drawn
 * around @renderer and all of its siblings if @renderer can
 * focus for a given row.
 * 
 * Events handled by focus siblings can also activate the given
 * focusable @renderer.
 *
 * @param renderer the `GtkCellRenderer` expected to have focus
 * @param sibling the `GtkCellRenderer` to add to @renderer’s focus area
 */
- (void)addFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling;

/**
 * Applies any connected attributes to the renderers in
 * @area by pulling the values from @tree_model.
 *
 * @param treeModel the `GtkTreeModel` to pull values from
 * @param iter the `GtkTreeIter` in @tree_model to apply values for
 * @param isExpander whether @iter has children
 * @param isExpanded whether @iter is expanded in the view and
 *               children are visible
 */
- (void)applyAttributesWithTreeModel:(GtkTreeModel*)treeModel iter:(GtkTreeIter*)iter isExpander:(bool)isExpander isExpanded:(bool)isExpanded;

/**
 * Connects an @attribute to apply values from @column for the
 * `GtkTreeModel` in use.
 *
 * @param renderer the `GtkCellRenderer` to connect an attribute for
 * @param attribute the attribute name
 * @param column the `GtkTreeModel` column to fetch attribute values from
 */
- (void)attributeConnectWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute column:(int)column;

/**
 * Disconnects @attribute for the @renderer in @area so that
 * attribute will no longer be updated with values from the
 * model.
 *
 * @param renderer the `GtkCellRenderer` to disconnect an attribute for
 * @param attribute the attribute name
 */
- (void)attributeDisconnectWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute;

/**
 * Returns the model column that an attribute has been mapped to,
 * or -1 if the attribute is not mapped.
 *
 * @param renderer a `GtkCellRenderer`
 * @param attribute an attribute on the renderer
 * @return the model column, or -1
 */
- (int)attributeGetColumnWithRenderer:(OGTKCellRenderer*)renderer attribute:(OFString*)attribute;

/**
 * Gets the value of a cell property for @renderer in @area.
 *
 * @param renderer a `GtkCellRenderer` inside @area
 * @param propertyName the name of the property to get
 * @param value a location to return the value
 */
- (void)cellGetPropertyWithRenderer:(OGTKCellRenderer*)renderer propertyName:(OFString*)propertyName value:(GValue*)value;

/**
 * Gets the values of one or more cell properties for @renderer in @area.
 *
 * @param renderer a `GtkCellRenderer` inside @area
 * @param firstPropertyName the name of the first property to get
 * @param varArgs return location for the first property, followed
 *     optionally by more name/return location pairs, followed by %NULL
 */
- (void)cellGetValistWithRenderer:(OGTKCellRenderer*)renderer firstPropertyName:(OFString*)firstPropertyName varArgs:(va_list)varArgs;

/**
 * Sets a cell property for @renderer in @area.
 *
 * @param renderer a `GtkCellRenderer` inside @area
 * @param propertyName the name of the cell property to set
 * @param value the value to set the cell property to
 */
- (void)cellSetPropertyWithRenderer:(OGTKCellRenderer*)renderer propertyName:(OFString*)propertyName value:(const GValue*)value;

/**
 * Sets one or more cell properties for @renderer in @area.
 *
 * @param renderer a `GtkCellRenderer` which inside @area
 * @param firstPropertyName the name of the first cell property to set
 * @param varArgs a %NULL-terminated list of property names and values, starting
 *           with @first_prop_name
 */
- (void)cellSetValistWithRenderer:(OGTKCellRenderer*)renderer firstPropertyName:(OFString*)firstPropertyName varArgs:(va_list)varArgs;

/**
 * This is sometimes needed for cases where rows need to share
 * alignments in one orientation but may be separately grouped
 * in the opposing orientation.
 * 
 * For instance, `GtkIconView` creates all icons (rows) to have
 * the same width and the cells theirin to have the same
 * horizontal alignments. However each row of icons may have
 * a separate collective height. `GtkIconView` uses this to
 * request the heights of each row based on a context which
 * was already used to request all the row widths that are
 * to be displayed.
 *
 * @param context the `GtkCellArea`Context to copy
 * @return a newly created `GtkCellArea`Context copy of @context.
 */
- (OGTKCellAreaContext*)copyContext:(OGTKCellAreaContext*)context;

/**
 * Creates a `GtkCellArea`Context to be used with @area for
 * all purposes. `GtkCellArea`Context stores geometry information
 * for rows for which it was operated on, it is important to use
 * the same context for the same row of data at all times (i.e.
 * one should render and handle events with the same `GtkCellArea`Context
 * which was used to request the size of those rows of data).
 *
 * @return a newly created `GtkCellArea`Context which can be used with @area.
 */
- (OGTKCellAreaContext*)createContext;

/**
 * Delegates event handling to a `GtkCellArea`.
 *
 * @param context the `GtkCellArea`Context for this row of data.
 * @param widget the `GtkWidget` that @area is rendering to
 * @param event the `GdkEvent` to handle
 * @param cellArea the @widget relative coordinates for @area
 * @param flags the `GtkCellRenderer`State for @area in this row.
 * @return %TRUE if the event was handled by @area.
 */
- (int)eventWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget event:(GdkEvent*)event cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags;

/**
 * This should be called by the @area’s owning layout widget
 * when focus is to be passed to @area, or moved within @area
 * for a given @direction and row data.
 * 
 * Implementing `GtkCellArea` classes should implement this
 * method to receive and navigate focus in its own way particular
 * to how it lays out cells.
 *
 * @param direction the `GtkDirectionType`
 * @return %TRUE if focus remains inside @area as a result of this call.
 */
- (bool)focus:(GtkDirectionType)direction;

/**
 * Calls @callback for every `GtkCellRenderer` in @area.
 *
 * @param callback the `GtkCellCallback` to call
 * @param callbackData user provided data pointer
 */
- (void)foreachWithCallback:(GtkCellCallback)callback callbackData:(gpointer)callbackData;

/**
 * Calls @callback for every `GtkCellRenderer` in @area with the
 * allocated rectangle inside @cell_area.
 *
 * @param context the `GtkCellArea`Context for this row of data.
 * @param widget the `GtkWidget` that @area is rendering to
 * @param cellArea the @widget relative coordinates and size for @area
 * @param backgroundArea the @widget relative coordinates of the background area
 * @param callback the `GtkCellAllocCallback` to call
 * @param callbackData user provided data pointer
 */
- (void)foreachAllocWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea backgroundArea:(const GdkRectangle*)backgroundArea callback:(GtkCellAllocCallback)callback callbackData:(gpointer)callbackData;

/**
 * Derives the allocation of @renderer inside @area if @area
 * were to be renderered in @cell_area.
 *
 * @param context the `GtkCellArea`Context used to hold sizes for @area.
 * @param widget the `GtkWidget` that @area is rendering on
 * @param renderer the `GtkCellRenderer` to get the allocation for
 * @param cellArea the whole allocated area for @area in @widget
 *             for this row
 * @param allocation where to store the allocation for @renderer
 */
- (void)cellAllocationWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget renderer:(OGTKCellRenderer*)renderer cellArea:(const GdkRectangle*)cellArea allocation:(GdkRectangle*)allocation;

/**
 * Gets the `GtkCellRenderer` at @x and @y coordinates inside @area and optionally
 * returns the full cell allocation for it inside @cell_area.
 *
 * @param context the `GtkCellArea`Context used to hold sizes for @area.
 * @param widget the `GtkWidget` that @area is rendering on
 * @param cellArea the whole allocated area for @area in @widget
 *   for this row
 * @param x the x position
 * @param y the y position
 * @param allocArea where to store the inner allocated area of the
 *   returned cell renderer
 * @return the `GtkCellRenderer` at @x and @y.
 */
- (OGTKCellRenderer*)cellAtPositionWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea x:(int)x y:(int)y allocArea:(GdkRectangle*)allocArea;

/**
 * Gets the current `GtkTreePath` string for the currently
 * applied `GtkTreeIter`, this is implicitly updated when
 * gtk_cell_area_apply_attributes() is called and can be
 * used to interact with renderers from `GtkCellArea`
 * subclasses.
 *
 * @return The current `GtkTreePath` string for the current
 * attributes applied to @area. This string belongs to the area and
 * should not be freed.
 */
- (OFString*)currentPathString;

/**
 * Gets the `GtkCellEditable` widget currently used
 * to edit the currently edited cell.
 *
 * @return The currently active `GtkCellEditable` widget
 */
- (GtkCellEditable*)editWidget;

/**
 * Gets the `GtkCellRenderer` in @area that is currently
 * being edited.
 *
 * @return The currently edited `GtkCellRenderer`
 */
- (OGTKCellRenderer*)editedCell;

/**
 * Retrieves the currently focused cell for @area
 *
 * @return the currently focused cell in @area.
 */
- (OGTKCellRenderer*)focusCell;

/**
 * Gets the `GtkCellRenderer` which is expected to be focusable
 * for which @renderer is, or may be a sibling.
 * 
 * This is handy for `GtkCellArea` subclasses when handling events,
 * after determining the renderer at the event location it can
 * then chose to activate the focus cell for which the event
 * cell may have been a sibling.
 *
 * @param renderer the `GtkCellRenderer`
 * @return the `GtkCellRenderer`
 *   for which @renderer is a sibling
 */
- (OGTKCellRenderer*)focusFromSibling:(OGTKCellRenderer*)renderer;

/**
 * Gets the focus sibling cell renderers for @renderer.
 *
 * @param renderer the `GtkCellRenderer` expected to have focus
 * @return A `GList` of `GtkCellRenderer`s.
 *       The returned list is internal and should not be freed.
 */
- (const GList*)focusSiblings:(OGTKCellRenderer*)renderer;

/**
 * Retrieves a cell area’s initial minimum and natural height.
 * 
 * @area will store some geometrical information in @context along the way;
 * when requesting sizes over an arbitrary number of rows, it’s not important
 * to check the @minimum_height and @natural_height of this call but rather to
 * consult gtk_cell_area_context_get_preferred_height() after a series of
 * requests.
 *
 * @param context the `GtkCellArea`Context to perform this request with
 * @param widget the `GtkWidget` where @area will be rendering
 * @param minimumHeight location to store the minimum height
 * @param naturalHeight location to store the natural height
 */
- (void)preferredHeightWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight;

/**
 * Retrieves a cell area’s minimum and natural height if it would be given
 * the specified @width.
 * 
 * @area stores some geometrical information in @context along the way
 * while calling gtk_cell_area_get_preferred_width(). It’s important to
 * perform a series of gtk_cell_area_get_preferred_width() requests with
 * @context first and then call gtk_cell_area_get_preferred_height_for_width()
 * on each cell area individually to get the height for width of each
 * fully requested row.
 * 
 * If at some point, the width of a single row changes, it should be
 * requested with gtk_cell_area_get_preferred_width() again and then
 * the full width of the requested rows checked again with
 * gtk_cell_area_context_get_preferred_width().
 *
 * @param context the `GtkCellArea`Context which has already been requested for widths.
 * @param widget the `GtkWidget` where @area will be rendering
 * @param width the width for which to check the height of this area
 * @param minimumHeight location to store the minimum height
 * @param naturalHeight location to store the natural height
 */
- (void)preferredHeightForWidthWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget width:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight;

/**
 * Retrieves a cell area’s initial minimum and natural width.
 * 
 * @area will store some geometrical information in @context along the way;
 * when requesting sizes over an arbitrary number of rows, it’s not important
 * to check the @minimum_width and @natural_width of this call but rather to
 * consult gtk_cell_area_context_get_preferred_width() after a series of
 * requests.
 *
 * @param context the `GtkCellArea`Context to perform this request with
 * @param widget the `GtkWidget` where @area will be rendering
 * @param minimumWidth location to store the minimum width
 * @param naturalWidth location to store the natural width
 */
- (void)preferredWidthWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth;

/**
 * Retrieves a cell area’s minimum and natural width if it would be given
 * the specified @height.
 * 
 * @area stores some geometrical information in @context along the way
 * while calling gtk_cell_area_get_preferred_height(). It’s important to
 * perform a series of gtk_cell_area_get_preferred_height() requests with
 * @context first and then call gtk_cell_area_get_preferred_width_for_height()
 * on each cell area individually to get the height for width of each
 * fully requested row.
 * 
 * If at some point, the height of a single row changes, it should be
 * requested with gtk_cell_area_get_preferred_height() again and then
 * the full height of the requested rows checked again with
 * gtk_cell_area_context_get_preferred_height().
 *
 * @param context the `GtkCellArea`Context which has already been requested for widths.
 * @param widget the `GtkWidget` where @area will be rendering
 * @param height the height for which to check the width of this area
 * @param minimumWidth location to store the minimum width
 * @param naturalWidth location to store the natural width
 */
- (void)preferredWidthForHeightWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget height:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth;

/**
 * Gets whether the area prefers a height-for-width layout
 * or a width-for-height layout.
 *
 * @return The `GtkSizeRequestMode` preferred by @area.
 */
- (GtkSizeRequestMode)requestMode;

/**
 * Checks if @area contains @renderer.
 *
 * @param renderer the `GtkCellRenderer` to check
 * @return %TRUE if @renderer is in the @area.
 */
- (bool)hasRenderer:(OGTKCellRenderer*)renderer;

/**
 * This is a convenience function for `GtkCellArea` implementations
 * to get the inner area where a given `GtkCellRenderer` will be
 * rendered. It removes any padding previously added by gtk_cell_area_request_renderer().
 *
 * @param widget the `GtkWidget` that @area is rendering onto
 * @param cellArea the @widget relative coordinates where one of @area’s cells
 *             is to be placed
 * @param innerArea the return location for the inner cell area
 */
- (void)innerCellAreaWithWidget:(OGTKWidget*)widget cellArea:(const GdkRectangle*)cellArea innerArea:(GdkRectangle*)innerArea;

/**
 * Returns whether the area can do anything when activated,
 * after applying new attributes to @area.
 *
 * @return whether @area can do anything when activated.
 */
- (bool)isActivatable;

/**
 * Returns whether @sibling is one of @renderer’s focus siblings
 * (see gtk_cell_area_add_focus_sibling()).
 *
 * @param renderer the `GtkCellRenderer` expected to have focus
 * @param sibling the `GtkCellRenderer` to check against @renderer’s sibling list
 * @return %TRUE if @sibling is a focus sibling of @renderer
 */
- (bool)isFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling;

/**
 * Removes @renderer from @area.
 *
 * @param renderer the `GtkCellRenderer` to remove from @area
 */
- (void)remove:(OGTKCellRenderer*)renderer;

/**
 * Removes @sibling from @renderer’s focus sibling list
 * (see gtk_cell_area_add_focus_sibling()).
 *
 * @param renderer the `GtkCellRenderer` expected to have focus
 * @param sibling the `GtkCellRenderer` to remove from @renderer’s focus area
 */
- (void)removeFocusSiblingWithRenderer:(OGTKCellRenderer*)renderer sibling:(OGTKCellRenderer*)sibling;

/**
 * This is a convenience function for `GtkCellArea` implementations
 * to request size for cell renderers. It’s important to use this
 * function to request size and then use gtk_cell_area_inner_cell_area()
 * at render and event time since this function will add padding
 * around the cell for focus painting.
 *
 * @param renderer the `GtkCellRenderer` to request size for
 * @param orientation the `GtkOrientation` in which to request size
 * @param widget the `GtkWidget` that @area is rendering onto
 * @param forSize the allocation contextual size to request for, or -1 if
 * the base request for the orientation is to be returned.
 * @param minimumSize location to store the minimum size
 * @param naturalSize location to store the natural size
 */
- (void)requestRendererWithRenderer:(OGTKCellRenderer*)renderer orientation:(GtkOrientation)orientation widget:(OGTKWidget*)widget forSize:(int)forSize minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize;

/**
 * Explicitly sets the currently focused cell to @renderer.
 * 
 * This is generally called by implementations of
 * `GtkCellAreaClass.focus()` or `GtkCellAreaClass.event()`,
 * however it can also be used to implement functions such
 * as gtk_tree_view_set_cursor_on_cell().
 *
 * @param renderer the `GtkCellRenderer` to give focus to
 */
- (void)setFocusCell:(OGTKCellRenderer*)renderer;

/**
 * Snapshots @area’s cells according to @area’s layout onto at
 * the given coordinates.
 *
 * @param context the `GtkCellArea`Context for this row of data.
 * @param widget the `GtkWidget` that @area is rendering to
 * @param snapshot the `GtkSnapshot` to draw to
 * @param backgroundArea the @widget relative coordinates for @area’s background
 * @param cellArea the @widget relative coordinates for @area
 * @param flags the `GtkCellRenderer`State for @area in this row.
 * @param paintFocus whether @area should paint focus on focused cells for focused rows or not.
 */
- (void)snapshotWithContext:(OGTKCellAreaContext*)context widget:(OGTKWidget*)widget snapshot:(OGTKSnapshot*)snapshot backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags paintFocus:(bool)paintFocus;

/**
 * Explicitly stops the editing of the currently edited cell.
 * 
 * If @canceled is %TRUE, the currently edited cell renderer
 * will emit the ::editing-canceled signal, otherwise the
 * the ::editing-done signal will be emitted on the current
 * edit widget.
 * 
 * See gtk_cell_area_get_edited_cell() and gtk_cell_area_get_edit_widget().
 *
 * @param canceled whether editing was canceled.
 */
- (void)stopEditing:(bool)canceled;

@end