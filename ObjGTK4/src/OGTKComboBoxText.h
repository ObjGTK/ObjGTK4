/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKComboBox.h"

@class OGTKWidget;

/**
 * A `GtkComboBoxText` is a simple variant of `GtkComboBox` for text-only
 * use cases.
 * 
 * ![An example GtkComboBoxText](combo-box-text.png)
 * 
 * `GtkComboBoxText` hides the model-view complexity of `GtkComboBox`.
 * 
 * To create a `GtkComboBoxText`, use [ctor@Gtk.ComboBoxText.new] or
 * [ctor@Gtk.ComboBoxText.new_with_entry].
 * 
 * You can add items to a `GtkComboBoxText` with
 * [method@Gtk.ComboBoxText.append_text],
 * [method@Gtk.ComboBoxText.insert_text] or
 * [method@Gtk.ComboBoxText.prepend_text] and remove options with
 * [method@Gtk.ComboBoxText.remove].
 * 
 * If the `GtkComboBoxText` contains an entry (via the
 * [property@Gtk.ComboBox:has-entry] property), its contents can be retrieved
 * using [method@Gtk.ComboBoxText.get_active_text].
 * 
 * You should not call [method@Gtk.ComboBox.set_model] or attempt to pack more
 * cells into this combo box via its [iface@Gtk.CellLayout] interface.
 * 
 * ## GtkComboBoxText as GtkBuildable
 * 
 * The `GtkComboBoxText` implementation of the `GtkBuildable` interface supports
 * adding items directly using the `<items>` element and specifying `<item>`
 * elements for each item. Each `<item>` element can specify the “id”
 * corresponding to the appended text and also supports the regular
 * translation attributes “translatable”, “context” and “comments”.
 * 
 * Here is a UI definition fragment specifying `GtkComboBoxText` items:
 * ```xml
 * <object class="GtkComboBoxText">
 *   <items>
 *     <item translatable="yes" id="factory">Factory</item>
 *     <item translatable="yes" id="home">Home</item>
 *     <item translatable="yes" id="subway">Subway</item>
 *   </items>
 * </object>
 * ```
 * 
 * ## CSS nodes
 * 
 * ```
 * combobox
 * ╰── box.linked
 *     ├── entry.combo
 *     ├── button.combo
 *     ╰── window.popup
 * ```
 * 
 * `GtkComboBoxText` has a single CSS node with name combobox. It adds
 * the style class .combo to the main CSS nodes of its entry and button
 * children, and the .linked class to the node of its internal box.
 *
 */
@interface OGTKComboBoxText : OGTKComboBox
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithEntry;

/**
 * Methods
 */

- (GtkComboBoxText*)castedGObject;

/**
 * Appends @text to the list of strings stored in @combo_box.
 * 
 * If @id is non-%NULL then it is used as the ID of the row.
 * 
 * This is the same as calling [method@Gtk.ComboBoxText.insert]
 * with a position of -1.
 *
 * @param id a string ID for this value
 * @param text A string
 */
- (void)appendWithId:(OFString*)id text:(OFString*)text;

/**
 * Appends @text to the list of strings stored in @combo_box.
 * 
 * This is the same as calling [method@Gtk.ComboBoxText.insert_text]
 * with a position of -1.
 *
 * @param text A string
 */
- (void)appendText:(OFString*)text;

/**
 * Returns the currently active string in @combo_box.
 * 
 * If no row is currently selected, %NULL is returned.
 * If @combo_box contains an entry, this function will
 * return its contents (which will not necessarily
 * be an item from the list).
 *
 * @return a newly allocated
 *   string containing the currently active text.
 *   Must be freed with g_free().
 */
- (char*)activeText;

/**
 * Inserts @text at @position in the list of strings stored in @combo_box.
 * 
 * If @id is non-%NULL then it is used as the ID of the row.
 * See [property@Gtk.ComboBox:id-column].
 * 
 * If @position is negative then @text is appended.
 *
 * @param position An index to insert @text
 * @param id a string ID for this value
 * @param text A string to display
 */
- (void)insertWithPosition:(int)position id:(OFString*)id text:(OFString*)text;

/**
 * Inserts @text at @position in the list of strings stored in @combo_box.
 * 
 * If @position is negative then @text is appended.
 * 
 * This is the same as calling [method@Gtk.ComboBoxText.insert]
 * with a %NULL ID string.
 *
 * @param position An index to insert @text
 * @param text A string
 */
- (void)insertTextWithPosition:(int)position text:(OFString*)text;

/**
 * Prepends @text to the list of strings stored in @combo_box.
 * 
 * If @id is non-%NULL then it is used as the ID of the row.
 * 
 * This is the same as calling [method@Gtk.ComboBoxText.insert]
 * with a position of 0.
 *
 * @param id a string ID for this value
 * @param text a string
 */
- (void)prependWithId:(OFString*)id text:(OFString*)text;

/**
 * Prepends @text to the list of strings stored in @combo_box.
 * 
 * This is the same as calling [method@Gtk.ComboBoxText.insert_text]
 * with a position of 0.
 *
 * @param text A string
 */
- (void)prependText:(OFString*)text;

/**
 * Removes the string at @position from @combo_box.
 *
 * @param position Index of the item to remove
 */
- (void)remove:(int)position;

/**
 * Removes all the text entries from the combo box.
 *
 */
- (void)removeAll;

@end