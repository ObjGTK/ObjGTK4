/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKAdjustment;
@class OGTKFlowBoxChild;

/**
 * A `GtkFlowBox` puts child widgets in reflowing grid.
 * 
 * For instance, with the horizontal orientation, the widgets will be
 * arranged from left to right, starting a new row under the previous
 * row when necessary. Reducing the width in this case will require more
 * rows, so a larger height will be requested.
 * 
 * Likewise, with the vertical orientation, the widgets will be arranged
 * from top to bottom, starting a new column to the right when necessary.
 * Reducing the height will require more columns, so a larger width will
 * be requested.
 * 
 * The size request of a `GtkFlowBox` alone may not be what you expect;
 * if you need to be able to shrink it along both axes and dynamically
 * reflow its children, you may have to wrap it in a `GtkScrolledWindow`
 * to enable that.
 * 
 * The children of a `GtkFlowBox` can be dynamically sorted and filtered.
 * 
 * Although a `GtkFlowBox` must have only `GtkFlowBoxChild` children, you
 * can add any kind of widget to it via [method@Gtk.FlowBox.insert], and a
 * `GtkFlowBoxChild` widget will automatically be inserted between the box
 * and the widget.
 * 
 * Also see [class@Gtk.ListBox].
 * 
 * # CSS nodes
 * 
 * ```
 * flowbox
 * ├── flowboxchild
 * │   ╰── <child>
 * ├── flowboxchild
 * │   ╰── <child>
 * ┊
 * ╰── [rubberband]
 * ```
 * 
 * `GtkFlowBox` uses a single CSS node with name flowbox. `GtkFlowBoxChild`
 * uses a single CSS node with name flowboxchild. For rubberband selection,
 * a subnode with name rubberband is used.
 * 
 * # Accessibility
 * 
 * `GtkFlowBox` uses the %GTK_ACCESSIBLE_ROLE_GRID role, and `GtkFlowBoxChild`
 * uses the %GTK_ACCESSIBLE_ROLE_GRID_CELL role.
 *
 */
@interface OGTKFlowBox : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkFlowBox*)castedGObject;

/**
 * Adds @child to the end of @self.
 * 
 * If a sort function is set, the widget will
 * actually be inserted at the calculated position.
 * 
 * See also: [method@Gtk.FlowBox.insert].
 *
 * @param child the `GtkWidget` to add
 */
- (void)append:(OGTKWidget*)child;

/**
 * Binds @model to @box.
 * 
 * If @box was already bound to a model, that previous binding is
 * destroyed.
 * 
 * The contents of @box are cleared and then filled with widgets that
 * represent items from @model. @box is updated whenever @model changes.
 * If @model is %NULL, @box is left empty.
 * 
 * It is undefined to add or remove widgets directly (for example, with
 * [method@Gtk.FlowBox.insert]) while @box is bound to a model.
 * 
 * Note that using a model is incompatible with the filtering and sorting
 * functionality in `GtkFlowBox`. When using a model, filtering and sorting
 * should be implemented by the model.
 *
 * @param model the `GListModel` to be bound to @box
 * @param createWidgetFunc a function that creates widgets for items
 * @param userData user data passed to @create_widget_func
 * @param userDataFreeFunc function for freeing @user_data
 */
- (void)bindModelWithModel:(GListModel*)model createWidgetFunc:(GtkFlowBoxCreateWidgetFunc)createWidgetFunc userData:(gpointer)userData userDataFreeFunc:(GDestroyNotify)userDataFreeFunc;

/**
 * Returns whether children activate on single clicks.
 *
 * @return %TRUE if children are activated on single click,
 *   %FALSE otherwise
 */
- (bool)activateOnSingleClick;

/**
 * Gets the nth child in the @box.
 *
 * @param idx the position of the child
 * @return the child widget, which will
 *   always be a `GtkFlowBoxChild` or %NULL in case no child widget
 *   with the given index exists.
 */
- (OGTKFlowBoxChild*)childAtIndex:(int)idx;

/**
 * Gets the child in the (@x, @y) position.
 * 
 * Both @x and @y are assumed to be relative to the origin of @box.
 *
 * @param x the x coordinate of the child
 * @param y the y coordinate of the child
 * @return the child widget, which will
 *   always be a `GtkFlowBoxChild` or %NULL in case no child widget
 *   exists for the given x and y coordinates.
 */
- (OGTKFlowBoxChild*)childAtPosWithX:(int)x y:(int)y;

/**
 * Gets the horizontal spacing.
 *
 * @return the horizontal spacing
 */
- (guint)columnSpacing;

/**
 * Returns whether the box is homogeneous.
 *
 * @return %TRUE if the box is homogeneous.
 */
- (bool)homogeneous;

/**
 * Gets the maximum number of children per line.
 *
 * @return the maximum number of children per line
 */
- (guint)maxChildrenPerLine;

/**
 * Gets the minimum number of children per line.
 *
 * @return the minimum number of children per line
 */
- (guint)minChildrenPerLine;

/**
 * Gets the vertical spacing.
 *
 * @return the vertical spacing
 */
- (guint)rowSpacing;

/**
 * Creates a list of all selected children.
 *
 * @return A `GList` containing the `GtkWidget` for each selected child.
 *   Free with g_list_free() when done.
 */
- (GList*)selectedChildren;

/**
 * Gets the selection mode of @box.
 *
 * @return the `GtkSelectionMode`
 */
- (GtkSelectionMode)selectionMode;

/**
 * Inserts the @widget into @box at @position.
 * 
 * If a sort function is set, the widget will actually be inserted
 * at the calculated position.
 * 
 * If @position is -1, or larger than the total number of children
 * in the @box, then the @widget will be appended to the end.
 *
 * @param widget the `GtkWidget` to add
 * @param position the position to insert @child in
 */
- (void)insertWithWidget:(OGTKWidget*)widget position:(int)position;

/**
 * Updates the filtering for all children.
 * 
 * Call this function when the result of the filter
 * function on the @box is changed due to an external
 * factor. For instance, this would be used if the
 * filter function just looked for a specific search
 * term, and the entry with the string has changed.
 *
 */
- (void)invalidateFilter;

/**
 * Updates the sorting for all children.
 * 
 * Call this when the result of the sort function on
 * @box is changed due to an external factor.
 *
 */
- (void)invalidateSort;

/**
 * Adds @child to the start of @self.
 * 
 * If a sort function is set, the widget will
 * actually be inserted at the calculated position.
 * 
 * See also: [method@Gtk.FlowBox.insert].
 *
 * @param child the `GtkWidget` to add
 */
- (void)prepend:(OGTKWidget*)child;

/**
 * Removes a child from @box.
 *
 * @param widget the child widget to remove
 */
- (void)remove:(OGTKWidget*)widget;

/**
 * Removes all children from @box.
 * 
 * This function does nothing if @box is backed by a model.
 *
 */
- (void)removeAll;

/**
 * Select all children of @box, if the selection
 * mode allows it.
 *
 */
- (void)selectAll;

/**
 * Selects a single child of @box, if the selection
 * mode allows it.
 *
 * @param child a child of @box
 */
- (void)selectChild:(OGTKFlowBoxChild*)child;

/**
 * Calls a function for each selected child.
 * 
 * Note that the selection cannot be modified from within
 * this function.
 *
 * @param func the function to call for each selected child
 * @param data user data to pass to the function
 */
- (void)selectedForeachWithFunc:(GtkFlowBoxForeachFunc)func data:(gpointer)data;

/**
 * If @single is %TRUE, children will be activated when you click
 * on them, otherwise you need to double-click.
 *
 * @param single %TRUE to emit child-activated on a single click
 */
- (void)setActivateOnSingleClick:(bool)single;

/**
 * Sets the horizontal space to add between children.
 *
 * @param spacing the spacing to use
 */
- (void)setColumnSpacing:(guint)spacing;

/**
 * By setting a filter function on the @box one can decide dynamically
 * which of the children to show.
 * 
 * For instance, to implement a search function that only shows the
 * children matching the search terms.
 * 
 * The @filter_func will be called for each child after the call, and
 * it will continue to be called each time a child changes (via
 * [method@Gtk.FlowBoxChild.changed]) or when
 * [method@Gtk.FlowBox.invalidate_filter] is called.
 * 
 * Note that using a filter function is incompatible with using a model
 * (see [method@Gtk.FlowBox.bind_model]).
 *
 * @param filterFunc callback that
 *   lets you filter which children to show
 * @param userData user data passed to @filter_func
 * @param destroy destroy notifier for @user_data
 */
- (void)setFilterFuncWithFilterFunc:(GtkFlowBoxFilterFunc)filterFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy;

/**
 * Hooks up an adjustment to focus handling in @box.
 * 
 * The adjustment is also used for autoscrolling during
 * rubberband selection. See [method@Gtk.ScrolledWindow.get_hadjustment]
 * for a typical way of obtaining the adjustment, and
 * [method@Gtk.FlowBox.set_vadjustment] for setting the vertical
 * adjustment.
 * 
 * The adjustments have to be in pixel units and in the same
 * coordinate system as the allocation for immediate children
 * of the box.
 *
 * @param adjustment an adjustment which should be adjusted
 *    when the focus is moved among the descendents of @container
 */
- (void)setHadjustment:(OGTKAdjustment*)adjustment;

/**
 * Sets whether or not all children of @box are given
 * equal space in the box.
 *
 * @param homogeneous %TRUE to create equal allotments,
 *   %FALSE for variable allotments
 */
- (void)setHomogeneous:(bool)homogeneous;

/**
 * Sets the maximum number of children to request and
 * allocate space for in @box’s orientation.
 * 
 * Setting the maximum number of children per line
 * limits the overall natural size request to be no more
 * than @n_children children long in the given orientation.
 *
 * @param nchildren the maximum number of children per line
 */
- (void)setMaxChildrenPerLine:(guint)nchildren;

/**
 * Sets the minimum number of children to line up
 * in @box’s orientation before flowing.
 *
 * @param nchildren the minimum number of children per line
 */
- (void)setMinChildrenPerLine:(guint)nchildren;

/**
 * Sets the vertical space to add between children.
 *
 * @param spacing the spacing to use
 */
- (void)setRowSpacing:(guint)spacing;

/**
 * Sets how selection works in @box.
 *
 * @param mode the new selection mode
 */
- (void)setSelectionMode:(GtkSelectionMode)mode;

/**
 * By setting a sort function on the @box, one can dynamically
 * reorder the children of the box, based on the contents of
 * the children.
 * 
 * The @sort_func will be called for each child after the call,
 * and will continue to be called each time a child changes (via
 * [method@Gtk.FlowBoxChild.changed]) and when
 * [method@Gtk.FlowBox.invalidate_sort] is called.
 * 
 * Note that using a sort function is incompatible with using a model
 * (see [method@Gtk.FlowBox.bind_model]).
 *
 * @param sortFunc the sort function
 * @param userData user data passed to @sort_func
 * @param destroy destroy notifier for @user_data
 */
- (void)setSortFuncWithSortFunc:(GtkFlowBoxSortFunc)sortFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy;

/**
 * Hooks up an adjustment to focus handling in @box.
 * 
 * The adjustment is also used for autoscrolling during
 * rubberband selection. See [method@Gtk.ScrolledWindow.get_vadjustment]
 * for a typical way of obtaining the adjustment, and
 * [method@Gtk.FlowBox.set_hadjustment] for setting the horizontal
 * adjustment.
 * 
 * The adjustments have to be in pixel units and in the same
 * coordinate system as the allocation for immediate children
 * of the box.
 *
 * @param adjustment an adjustment which should be adjusted
 *    when the focus is moved among the descendents of @container
 */
- (void)setVadjustment:(OGTKAdjustment*)adjustment;

/**
 * Unselect all children of @box, if the selection
 * mode allows it.
 *
 */
- (void)unselectAll;

/**
 * Unselects a single child of @box, if the selection
 * mode allows it.
 *
 * @param child a child of @box
 */
- (void)unselectChild:(OGTKFlowBoxChild*)child;

@end