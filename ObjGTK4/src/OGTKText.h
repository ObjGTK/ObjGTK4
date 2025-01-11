/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;
@class OGTKEntryBuffer;

/**
 * The `GtkText` widget is a single-line text entry widget.
 * 
 * `GtkText` is the common implementation of single-line text editing
 * that is shared between [class@Gtk.Entry], [class@Gtk.PasswordEntry],
 * [class@Gtk.SpinButton], and other widgets. In all of these, `GtkText` is
 * used as the delegate for the [iface@Gtk.Editable] implementation.
 * 
 * A fairly large set of key bindings are supported by default. If the
 * entered text is longer than the allocation of the widget, the widget
 * will scroll so that the cursor position is visible.
 * 
 * When using an entry for passwords and other sensitive information,
 * it can be put into “password mode” using [method@Gtk.Text.set_visibility].
 * In this mode, entered text is displayed using a “invisible” character.
 * By default, GTK picks the best invisible character that is available
 * in the current font, but it can be changed with
 * [method@Gtk.Text.set_invisible_char].
 * 
 * If you are looking to add icons or progress display in an entry, look
 * at [class@Gtk.Entry]. There other alternatives for more specialized use
 * cases, such as [class@Gtk.SearchEntry].
 * 
 * If you need multi-line editable text, look at [class@Gtk.TextView].
 * 
 * # CSS nodes
 * 
 * ```
 * text[.read-only]
 * ├── placeholder
 * ├── undershoot.left
 * ├── undershoot.right
 * ├── [selection]
 * ├── [block-cursor]
 * ╰── [window.popup]
 * ```
 * 
 * `GtkText` has a main node with the name `text`. Depending on the properties
 * of the widget, the `.read-only` style class may appear.
 * 
 * When the entry has a selection, it adds a subnode with the name `selection`.
 * 
 * When the entry is in overwrite mode, it adds a subnode with the name
 * `block-cursor` that determines how the block cursor is drawn.
 * 
 * The CSS node for a context menu is added as a subnode with the name `popup`.
 * 
 * The `undershoot` nodes are used to draw the underflow indication when content
 * is scrolled out of view. These nodes get the `.left` or `.right` style class
 * added depending on where the indication is drawn.
 * 
 * When touch is used and touch selection handles are shown, they are using
 * CSS nodes with name `cursor-handle`. They get the `.top` or `.bottom` style
 * class depending on where they are shown in relation to the selection. If
 * there is just a single handle for the text cursor, it gets the style class
 * `.insertion-cursor`.
 * 
 * # Accessibility
 * 
 * `GtkText` uses the %GTK_ACCESSIBLE_ROLE_NONE role, which causes it to be
 * skipped for accessibility. This is because `GtkText` is expected to be used
 * as a delegate for a `GtkEditable` implementation that will be represented
 * to accessibility.
 *
 */
@interface OGTKText : OGTKWidget
{

}


/**
 * Constructors
 */
+ (instancetype)text;
+ (instancetype)textWithBuffer:(OGTKEntryBuffer*)buffer;

/**
 * Methods
 */

- (GtkText*)castedGObject;

/**
 * Determine the positions of the strong and weak cursors if the
 * insertion point in the layout is at @position.
 * 
 * The position of each cursor is stored as a zero-width rectangle.
 * The strong cursor location is the location where characters of
 * the directionality equal to the base direction are inserted.
 * The weak cursor location is the location where characters of
 * the directionality opposite to the base direction are inserted.
 * 
 * The rectangle positions are in widget coordinates.
 *
 * @param position the character position
 * @param strong location to store the strong cursor position
 * @param weak location to store the weak cursor position
 */
- (void)computeCursorExtentsWithPosition:(gsize)position strong:(graphene_rect_t*)strong weak:(graphene_rect_t*)weak;

/**
 * Returns whether pressing Enter will activate
 * the default widget for the window containing @self.
 * 
 * See [method@Gtk.Text.set_activates_default].
 *
 * @return %TRUE if the `GtkText` will activate the default widget
 */
- (bool)activatesDefault;

/**
 * Gets the attribute list that was set on the `GtkText`.
 * 
 * See [method@Gtk.Text.set_attributes].
 *
 * @return the attribute list
 */
- (PangoAttrList*)attributes;

/**
 * Get the `GtkEntryBuffer` object which holds the text for
 * this widget.
 *
 * @return A `GtkEntryBuffer` object.
 */
- (OGTKEntryBuffer*)buffer;

/**
 * Returns whether Emoji completion is enabled for this
 * `GtkText` widget.
 *
 * @return %TRUE if Emoji completion is enabled
 */
- (bool)enableEmojiCompletion;

/**
 * Gets the menu model for extra items in the context menu.
 * 
 * See [method@Gtk.Text.set_extra_menu].
 *
 * @return the menu model
 */
- (OGMenuModel*)extraMenu;

/**
 * Gets the input hints of the `GtkText`.
 *
 * @return
 */
- (GtkInputHints)inputHints;

/**
 * Gets the input purpose of the `GtkText`.
 *
 * @return
 */
- (GtkInputPurpose)inputPurpose;

/**
 * Retrieves the character displayed when visibility is set to false.
 * 
 * Note that GTK does not compute this value unless it needs it,
 * so the value returned by this function is not very useful unless
 * it has been explicitly set with [method@Gtk.Text.set_invisible_char].
 *
 * @return the current invisible char, or 0, if @text does not
 *   show invisible text at all.
 */
- (gunichar)invisibleChar;

/**
 * Retrieves the maximum allowed length of the text in @self.
 * 
 * See [method@Gtk.Text.set_max_length].
 * 
 * This is equivalent to getting @self's `GtkEntryBuffer` and
 * calling [method@Gtk.EntryBuffer.get_max_length] on it.
 *
 * @return the maximum allowed number of characters
 *   in `GtkText`, or 0 if there is no maximum.
 */
- (int)maxLength;

/**
 * Gets whether text is overwritten when typing in the `GtkText`.
 * 
 * See [method@Gtk.Text.set_overwrite_mode].
 *
 * @return whether the text is overwritten when typing
 */
- (bool)overwriteMode;

/**
 * Retrieves the text that will be displayed when
 * @self is empty and unfocused
 * 
 * If no placeholder text has been set, %NULL will be returned.
 *
 * @return the placeholder text
 */
- (OFString*)placeholderText;

/**
 * Returns whether the `GtkText` will grow and shrink
 * with the content.
 *
 * @return %TRUE if @self will propagate the text width
 */
- (bool)propagateTextWidth;

/**
 * Gets the tabstops that were set on the `GtkText`.
 * 
 * See [method@Gtk.Text.set_tabs].
 *
 * @return the tabstops
 */
- (PangoTabArray*)tabs;

/**
 * Retrieves the current length of the text in @self.
 * 
 * This is equivalent to getting @self's `GtkEntryBuffer`
 * and calling [method@Gtk.EntryBuffer.get_length] on it.
 *
 * @return the current number of characters
 *   in `GtkText`, or 0 if there are none.
 */
- (guint16)textLength;

/**
 * Returns whether the `GtkText` will truncate multi-line text
 * that is pasted into the widget
 *
 * @return %TRUE if @self will truncate multi-line text
 */
- (bool)truncateMultiline;

/**
 * Retrieves whether the text in @self is visible.
 *
 * @return %TRUE if the text is currently visible
 */
- (bool)visibility;

/**
 * Causes @self to have keyboard focus.
 * 
 * It behaves like [method@Gtk.Widget.grab_focus],
 * except that it doesn't select the contents of @self.
 * You only want to call this on some special entries
 * which the user usually doesn't want to replace all text in,
 * such as search-as-you-type entries.
 *
 * @return %TRUE if focus is now inside @self
 */
- (bool)grabFocusWithoutSelecting;

/**
 * If @activates is %TRUE, pressing Enter will activate
 * the default widget for the window containing @self.
 * 
 * This usually means that the dialog containing the `GtkText`
 * will be closed, since the default widget is usually one of
 * the dialog buttons.
 *
 * @param activates %TRUE to activate window’s default widget on Enter keypress
 */
- (void)setActivatesDefault:(bool)activates;

/**
 * Sets attributes that are applied to the text.
 *
 * @param attrs a `PangoAttrList`
 */
- (void)setAttributes:(PangoAttrList*)attrs;

/**
 * Set the `GtkEntryBuffer` object which holds the text for
 * this widget.
 *
 * @param buffer a `GtkEntryBuffer`
 */
- (void)setBuffer:(OGTKEntryBuffer*)buffer;

/**
 * Sets whether Emoji completion is enabled.
 * 
 * If it is, typing ':', followed by a recognized keyword,
 * will pop up a window with suggested Emojis matching the
 * keyword.
 *
 * @param enableEmojiCompletion %TRUE to enable Emoji completion
 */
- (void)setEnableEmojiCompletion:(bool)enableEmojiCompletion;

/**
 * Sets a menu model to add when constructing
 * the context menu for @self.
 *
 * @param model a `GMenuModel`
 */
- (void)setExtraMenu:(OGMenuModel*)model;

/**
 * Sets input hints that allow input methods
 * to fine-tune their behaviour.
 *
 * @param hints the hints
 */
- (void)setInputHints:(GtkInputHints)hints;

/**
 * Sets the input purpose of the `GtkText`.
 * 
 * This can be used by on-screen keyboards and other
 * input methods to adjust their behaviour.
 *
 * @param purpose the purpose
 */
- (void)setInputPurpose:(GtkInputPurpose)purpose;

/**
 * Sets the character to use when in “password mode”.
 * 
 * By default, GTK picks the best invisible char available in the
 * current font. If you set the invisible char to 0, then the user
 * will get no feedback at all; there will be no text on the screen
 * as they type.
 *
 * @param ch a Unicode character
 */
- (void)setInvisibleChar:(gunichar)ch;

/**
 * Sets the maximum allowed length of the contents of the widget.
 * 
 * If the current contents are longer than the given length, then
 * they will be truncated to fit.
 * 
 * This is equivalent to getting @self's `GtkEntryBuffer` and
 * calling [method@Gtk.EntryBuffer.set_max_length] on it.
 *
 * @param length the maximum length of the `GtkText`, or 0 for no maximum.
 *   (other than the maximum length of entries.) The value passed
 *   in will be clamped to the range 0-65536.
 */
- (void)setMaxLength:(int)length;

/**
 * Sets whether the text is overwritten when typing
 * in the `GtkText`.
 *
 * @param overwrite new value
 */
- (void)setOverwriteMode:(bool)overwrite;

/**
 * Sets text to be displayed in @self when it is empty.
 * 
 * This can be used to give a visual hint of the expected
 * contents of the `GtkText`.
 *
 * @param text a string to be displayed when @self
 *   is empty and unfocused
 */
- (void)setPlaceholderText:(OFString*)text;

/**
 * Sets whether the `GtkText` should grow and shrink with the content.
 *
 * @param propagateTextWidth %TRUE to propagate the text width
 */
- (void)setPropagateTextWidth:(bool)propagateTextWidth;

/**
 * Sets tabstops that are applied to the text.
 *
 * @param tabs a `PangoTabArray`
 */
- (void)setTabs:(PangoTabArray*)tabs;

/**
 * Sets whether the `GtkText` should truncate multi-line text
 * that is pasted into the widget.
 *
 * @param truncateMultiline %TRUE to truncate multi-line text
 */
- (void)setTruncateMultiline:(bool)truncateMultiline;

/**
 * Sets whether the contents of the `GtkText` are visible or not.
 * 
 * When visibility is set to %FALSE, characters are displayed
 * as the invisible char, and will also appear that way when
 * the text in the widget is copied to the clipboard.
 * 
 * By default, GTK picks the best invisible character available
 * in the current font, but it can be changed with
 * [method@Gtk.Text.set_invisible_char].
 * 
 * Note that you probably want to set [property@Gtk.Text:input-purpose]
 * to %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to
 * inform input methods about the purpose of this self,
 * in addition to setting visibility to %FALSE.
 *
 * @param visible %TRUE if the contents of the `GtkText` are displayed
 *   as plaintext
 */
- (void)setVisibility:(bool)visible;

/**
 * Unsets the invisible char.
 * 
 * After calling this, the default invisible
 * char is used again.
 *
 */
- (void)unsetInvisibleChar;

@end