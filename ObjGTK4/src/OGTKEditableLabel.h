/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A `GtkEditableLabel` is a label that allows users to
 * edit the text by switching to an “edit mode”.
 * 
 * ![An example GtkEditableLabel](editable-label.png)
 * 
 * `GtkEditableLabel` does not have API of its own, but it
 * implements the [iface@Gtk.Editable] interface.
 * 
 * The default bindings for activating the edit mode is
 * to click or press the Enter key. The default bindings
 * for leaving the edit mode are the Enter key (to save
 * the results) or the Escape key (to cancel the editing).
 * 
 * # CSS nodes
 * 
 * ```
 * editablelabel[.editing]
 * ╰── stack
 *     ├── label
 *     ╰── text
 * ```
 * 
 * `GtkEditableLabel` has a main node with the name editablelabel.
 * When the entry is in editing mode, it gets the .editing style
 * class.
 * 
 * For all the subnodes added to the text node in various situations,
 * see [class@Gtk.Text].
 *
 */
@interface OGTKEditableLabel : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)str;

/**
 * Methods
 */

- (GtkEditableLabel*)castedGObject;

/**
 * Returns whether the label is currently in “editing mode”.
 *
 * @return %TRUE if @self is currently in editing mode
 */
- (bool)editing;

/**
 * Switches the label into “editing mode”.
 *
 */
- (void)startEditing;

/**
 * Switches the label out of “editing mode”.
 * 
 * If @commit is %TRUE, the resulting text is kept as the
 * [property@Gtk.Editable:text] property value, otherwise the
 * resulting text is discarded and the label will keep its
 * previous [property@Gtk.Editable:text] property value.
 *
 * @param commit whether to set the edited text on the label
 */
- (void)stopEditing:(bool)commit;

@end