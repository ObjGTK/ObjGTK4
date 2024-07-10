/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKSnapshot;
@class OGTKWidget;

/**
 * An object for rendering a single cell
 * 
 * The `GtkCellRenderer` is a base class of a set of objects used for
 * rendering a cell to a `cairo_t`.  These objects are used primarily by
 * the `GtkTreeView` widget, though they aren’t tied to them in any
 * specific way.  It is worth noting that `GtkCellRenderer` is not a
 * `GtkWidget` and cannot be treated as such.
 * 
 * The primary use of a `GtkCellRenderer` is for drawing a certain graphical
 * elements on a `cairo_t`. Typically, one cell renderer is used to
 * draw many cells on the screen.  To this extent, it isn’t expected that a
 * CellRenderer keep any permanent state around.  Instead, any state is set
 * just prior to use using `GObject`s property system.  Then, the
 * cell is measured using gtk_cell_renderer_get_preferred_size(). Finally, the cell
 * is rendered in the correct location using gtk_cell_renderer_snapshot().
 * 
 * There are a number of rules that must be followed when writing a new
 * `GtkCellRenderer`.  First and foremost, it’s important that a certain set
 * of properties will always yield a cell renderer of the same size,
 * barring a style change. The `GtkCellRenderer` also has a number of
 * generic properties that are expected to be honored by all children.
 * 
 * Beyond merely rendering a cell, cell renderers can optionally
 * provide active user interface elements. A cell renderer can be
 * “activatable” like `GtkCellRenderer`Toggle,
 * which toggles when it gets activated by a mouse click, or it can be
 * “editable” like `GtkCellRenderer`Text, which
 * allows the user to edit the text using a widget implementing the
 * `GtkCellEditable` interface, e.g. `GtkEntry`.
 * To make a cell renderer activatable or editable, you have to
 * implement the `GtkCellRenderer`Class.activate or
 * `GtkCellRenderer`Class.start_editing virtual functions, respectively.
 * 
 * Many properties of `GtkCellRenderer` and its subclasses have a
 * corresponding “set” property, e.g. “cell-background-set” corresponds
 * to “cell-background”. These “set” properties reflect whether a property
 * has been set or not. You should not set them independently.
 *
 */
@interface OGTKCellRenderer : OGObject
{

}


/**
 * Methods
 */

- (GtkCellRenderer*)castedGObject;

/**
 * Passes an activate event to the cell renderer for possible processing.
 * Some cell renderers may use events; for example, `GtkCellRendererToggle`
 * toggles when it gets a mouse click.
 *
 * @param event a `GdkEvent`
 * @param widget widget that received the event
 * @param path widget-dependent string representation of the event location;
 *    e.g. for `GtkTreeView`, a string representation of `GtkTreePath`
 * @param backgroundArea background area as passed to gtk_cell_renderer_render()
 * @param cellArea cell area as passed to gtk_cell_renderer_render()
 * @param flags render flags
 * @return %TRUE if the event was consumed/handled
 */
- (bool)activateWithEvent:(GdkEvent*)event widget:(OGTKWidget*)widget path:(OFString*)path backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags;

/**
 * Gets the aligned area used by @cell inside @cell_area. Used for finding
 * the appropriate edit and focus rectangle.
 *
 * @param widget the `GtkWidget` this cell will be rendering to
 * @param flags render flags
 * @param cellArea cell area which would be passed to gtk_cell_renderer_render()
 * @param alignedArea the return location for the space inside @cell_area
 *                that would actually be used to render.
 */
- (void)alignedAreaWithWidget:(OGTKWidget*)widget flags:(GtkCellRendererState)flags cellArea:(const GdkRectangle*)cellArea alignedArea:(GdkRectangle*)alignedArea;

/**
 * Fills in @xalign and @yalign with the appropriate values of @cell.
 *
 * @param xalign location to fill in with the x alignment of the cell
 * @param yalign location to fill in with the y alignment of the cell
 */
- (void)alignmentWithXalign:(float*)xalign yalign:(float*)yalign;

/**
 * Fills in @width and @height with the appropriate size of @cell.
 *
 * @param width location to fill in with the fixed width of the cell
 * @param height location to fill in with the fixed height of the cell
 */
- (void)fixedSizeWithWidth:(int*)width height:(int*)height;

/**
 * Checks whether the given `GtkCellRenderer` is expanded.
 *
 * @return %TRUE if the cell renderer is expanded
 */
- (bool)isExpanded;

/**
 * Checks whether the given `GtkCellRenderer` is an expander.
 *
 * @return %TRUE if @cell is an expander, and %FALSE otherwise
 */
- (bool)isExpander;

/**
 * Fills in @xpad and @ypad with the appropriate values of @cell.
 *
 * @param xpad location to fill in with the x padding of the cell
 * @param ypad location to fill in with the y padding of the cell
 */
- (void)paddingWithXpad:(int*)xpad ypad:(int*)ypad;

/**
 * Retrieves a renderer’s natural size when rendered to @widget.
 *
 * @param widget the `GtkWidget` this cell will be rendering to
 * @param minimumSize location to store the minimum size
 * @param naturalSize location to store the natural size
 */
- (void)preferredHeightWithWidget:(OGTKWidget*)widget minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize;

/**
 * Retrieves a cell renderers’s minimum and natural height if it were rendered to
 * @widget with the specified @width.
 *
 * @param widget the `GtkWidget` this cell will be rendering to
 * @param width the size which is available for allocation
 * @param minimumHeight location for storing the minimum size
 * @param naturalHeight location for storing the preferred size
 */
- (void)preferredHeightForWidthWithWidget:(OGTKWidget*)widget width:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight;

/**
 * Retrieves the minimum and natural size of a cell taking
 * into account the widget’s preference for height-for-width management.
 *
 * @param widget the `GtkWidget` this cell will be rendering to
 * @param minimumSize location for storing the minimum size
 * @param naturalSize location for storing the natural size
 */
- (void)preferredSizeWithWidget:(OGTKWidget*)widget minimumSize:(GtkRequisition*)minimumSize naturalSize:(GtkRequisition*)naturalSize;

/**
 * Retrieves a renderer’s natural size when rendered to @widget.
 *
 * @param widget the `GtkWidget` this cell will be rendering to
 * @param minimumSize location to store the minimum size
 * @param naturalSize location to store the natural size
 */
- (void)preferredWidthWithWidget:(OGTKWidget*)widget minimumSize:(int*)minimumSize naturalSize:(int*)naturalSize;

/**
 * Retrieves a cell renderers’s minimum and natural width if it were rendered to
 * @widget with the specified @height.
 *
 * @param widget the `GtkWidget` this cell will be rendering to
 * @param height the size which is available for allocation
 * @param minimumWidth location for storing the minimum size
 * @param naturalWidth location for storing the preferred size
 */
- (void)preferredWidthForHeightWithWidget:(OGTKWidget*)widget height:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth;

/**
 * Gets whether the cell renderer prefers a height-for-width layout
 * or a width-for-height layout.
 *
 * @return The `GtkSizeRequestMode` preferred by this renderer.
 */
- (GtkSizeRequestMode)requestMode;

/**
 * Returns the cell renderer’s sensitivity.
 *
 * @return %TRUE if the cell renderer is sensitive
 */
- (bool)sensitive;

/**
 * Translates the cell renderer state to `GtkStateFlags`,
 * based on the cell renderer and widget sensitivity, and
 * the given `GtkCellRenderer`State.
 *
 * @param widget a `GtkWidget`
 * @param cellState cell renderer state
 * @return the widget state flags applying to @cell
 */
- (GtkStateFlags)stateWithWidget:(OGTKWidget*)widget cellState:(GtkCellRendererState)cellState;

/**
 * Returns the cell renderer’s visibility.
 *
 * @return %TRUE if the cell renderer is visible
 */
- (bool)visible;

/**
 * Checks whether the cell renderer can do something when activated.
 *
 * @return %TRUE if the cell renderer can do anything when activated
 */
- (bool)isActivatable;

/**
 * Sets the renderer’s alignment within its available space.
 *
 * @param xalign the x alignment of the cell renderer
 * @param yalign the y alignment of the cell renderer
 */
- (void)setAlignmentWithXalign:(float)xalign yalign:(float)yalign;

/**
 * Sets the renderer size to be explicit, independent of the properties set.
 *
 * @param width the width of the cell renderer, or -1
 * @param height the height of the cell renderer, or -1
 */
- (void)setFixedSizeWithWidth:(int)width height:(int)height;

/**
 * Sets whether the given `GtkCellRenderer` is expanded.
 *
 * @param isExpanded whether @cell should be expanded
 */
- (void)setIsExpanded:(bool)isExpanded;

/**
 * Sets whether the given `GtkCellRenderer` is an expander.
 *
 * @param isExpander whether @cell is an expander
 */
- (void)setIsExpander:(bool)isExpander;

/**
 * Sets the renderer’s padding.
 *
 * @param xpad the x padding of the cell renderer
 * @param ypad the y padding of the cell renderer
 */
- (void)setPaddingWithXpad:(int)xpad ypad:(int)ypad;

/**
 * Sets the cell renderer’s sensitivity.
 *
 * @param sensitive the sensitivity of the cell
 */
- (void)setSensitive:(bool)sensitive;

/**
 * Sets the cell renderer’s visibility.
 *
 * @param visible the visibility of the cell
 */
- (void)setVisible:(bool)visible;

/**
 * Invokes the virtual render function of the `GtkCellRenderer`. The three
 * passed-in rectangles are areas in @cr. Most renderers will draw within
 * @cell_area; the xalign, yalign, xpad, and ypad fields of the `GtkCellRenderer`
 * should be honored with respect to @cell_area. @background_area includes the
 * blank space around the cell, and also the area containing the tree expander;
 * so the @background_area rectangles for all cells tile to cover the entire
 * @window.
 *
 * @param snapshot a `GtkSnapshot` to draw to
 * @param widget the widget owning @window
 * @param backgroundArea entire cell area (including tree expanders and maybe
 *    padding on the sides)
 * @param cellArea area normally rendered by a cell renderer
 * @param flags flags that affect rendering
 */
- (void)snapshotWithSnapshot:(OGTKSnapshot*)snapshot widget:(OGTKWidget*)widget backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags;

/**
 * Starts editing the contents of this @cell, through a new `GtkCellEditable`
 * widget created by the `GtkCellRenderer`Class.start_editing virtual function.
 *
 * @param event a `GdkEvent`
 * @param widget widget that received the event
 * @param path widget-dependent string representation of the event location;
 *    e.g. for `GtkTreeView`, a string representation of `GtkTreePath`
 * @param backgroundArea background area as passed to gtk_cell_renderer_render()
 * @param cellArea cell area as passed to gtk_cell_renderer_render()
 * @param flags render flags
 * @return A new `GtkCellEditable` for editing this
 *   @cell, or %NULL if editing is not possible
 */
- (GtkCellEditable*)startEditingWithEvent:(GdkEvent*)event widget:(OGTKWidget*)widget path:(OFString*)path backgroundArea:(const GdkRectangle*)backgroundArea cellArea:(const GdkRectangle*)cellArea flags:(GtkCellRendererState)flags;

/**
 * Informs the cell renderer that the editing is stopped.
 * If @canceled is %TRUE, the cell renderer will emit the
 * `GtkCellRenderer`::editing-canceled signal.
 * 
 * This function should be called by cell renderer implementations
 * in response to the `GtkCellEditable::editing-done` signal of
 * `GtkCellEditable`.
 *
 * @param canceled %TRUE if the editing has been canceled
 */
- (void)stopEditing:(bool)canceled;

@end