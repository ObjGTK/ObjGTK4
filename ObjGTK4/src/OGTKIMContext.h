/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGGdkSurface;
@class OGTKWidget;
@class OGGdkDevice;

/**
 * `GtkIMContext` defines the interface for GTK input methods.
 * 
 * `GtkIMContext` is used by GTK text input widgets like `GtkText`
 * to map from key events to Unicode character strings.
 * 
 * An input method may consume multiple key events in sequence before finally
 * outputting the composed result. This is called *preediting*, and an input
 * method may provide feedback about this process by displaying the intermediate
 * composition states as preedit text. To do so, the `GtkIMContext` will emit
 * [signal@Gtk.IMContext::preedit-start], [signal@Gtk.IMContext::preedit-changed]
 * and [signal@Gtk.IMContext::preedit-end] signals.
 * 
 * For instance, the built-in GTK input method [class@Gtk.IMContextSimple]
 * implements the input of arbitrary Unicode code points by holding down the
 * <kbd>Control</kbd> and <kbd>Shift</kbd> keys and then typing <kbd>u</kbd>
 * followed by the hexadecimal digits of the code point. When releasing the
 * <kbd>Control</kbd> and <kbd>Shift</kbd> keys, preediting ends and the
 * character is inserted as text. For example,
 * 
 *     Ctrl+Shift+u 2 0 A C
 * 
 * results in the € sign.
 * 
 * Additional input methods can be made available for use by GTK widgets as
 * loadable modules. An input method module is a small shared library which
 * provides a `GIOExtension` for the extension point named "gtk-im-module".
 * 
 * To connect a widget to the users preferred input method, you should use
 * [class@Gtk.IMMulticontext].
 *
 */
@interface OGTKIMContext : OGObject
{

}


/**
 * Methods
 */

- (GtkIMContext*)castedGObject;

/**
 * Requests the platform to show an on-screen keyboard for user input.
 * 
 * This method will return %TRUE if this request was actually performed
 * to the platform, other environmental factors may result in an on-screen
 * keyboard effectively not showing up.
 *
 * @param event a [class@Gdk.Event]
 * @return %TRUE if an on-screen keyboard could be requested to the platform.
 */
- (bool)activateOsk:(GdkEvent*)event;

/**
 * Asks the widget that the input context is attached to delete
 * characters around the cursor position by emitting the
 * `::delete_surrounding` signal.
 * 
 * Note that @offset and @n_chars are in characters not in bytes
 * which differs from the usage other places in `GtkIMContext`.
 * 
 * In order to use this function, you should first call
 * [method@Gtk.IMContext.get_surrounding] to get the current context,
 * and call this function immediately afterwards to make sure that you
 * know what you are deleting. You should also account for the fact
 * that even if the signal was handled, the input context might not
 * have deleted all the characters that were requested to be deleted.
 * 
 * This function is used by an input method that wants to make
 * substitutions in the existing text in response to new input.
 * It is not useful for applications.
 *
 * @param offset offset from cursor position in chars;
 *    a negative value means start before the cursor.
 * @param nchars number of characters to delete.
 * @return %TRUE if the signal was handled.
 */
- (bool)deleteSurroundingWithOffset:(int)offset nchars:(int)nchars;

/**
 * Allow an input method to forward key press and release events
 * to another input method without necessarily having a `GdkEvent`
 * available.
 *
 * @param press whether to forward a key press or release event
 * @param surface the surface the event is for
 * @param device the device that the event is for
 * @param time the timestamp for the event
 * @param keycode the keycode for the event
 * @param state modifier state for the event
 * @param group the active keyboard group for the event
 * @return %TRUE if the input method handled the key event.
 */
- (bool)filterKeyWithPress:(bool)press surface:(OGGdkSurface*)surface device:(OGGdkDevice*)device time:(guint32)time keycode:(guint)keycode state:(GdkModifierType)state group:(int)group;

/**
 * Allow an input method to internally handle key press and release
 * events.
 * 
 * If this function returns %TRUE, then no further processing
 * should be done for this key event.
 *
 * @param event the key event
 * @return %TRUE if the input method handled the key event.
 */
- (bool)filterKeypress:(GdkEvent*)event;

/**
 * Notify the input method that the widget to which this
 * input context corresponds has gained focus.
 * 
 * The input method may, for example, change the displayed
 * feedback to reflect this change.
 *
 */
- (void)focusIn;

/**
 * Notify the input method that the widget to which this
 * input context corresponds has lost focus.
 * 
 * The input method may, for example, change the displayed
 * feedback or reset the contexts state to reflect this change.
 *
 */
- (void)focusOut;

/**
 * Retrieve the current preedit string for the input context,
 * and a list of attributes to apply to the string.
 * 
 * This string should be displayed inserted at the insertion point.
 *
 * @param str location to store the retrieved
 *   string. The string retrieved must be freed with g_free().
 * @param attrs location to store the retrieved
 *   attribute list. When you are done with this list, you
 *   must unreference it with [method@Pango.AttrList.unref].
 * @param cursorPos location to store position of cursor
 *   (in characters) within the preedit string.
 */
- (void)preeditStringWithStr:(char**)str attrs:(PangoAttrList**)attrs cursorPos:(int*)cursorPos;

/**
 * Retrieves context around the insertion point.
 * 
 * Input methods typically want context in order to constrain input text
 * based on existing text; this is important for languages such as Thai
 * where only some sequences of characters are allowed.
 * 
 * This function is implemented by emitting the
 * [signal@Gtk.IMContext::retrieve-surrounding] signal on the input method;
 * in response to this signal, a widget should provide as much context as
 * is available, up to an entire paragraph, by calling
 * [method@Gtk.IMContext.set_surrounding].
 * 
 * Note that there is no obligation for a widget to respond to the
 * `::retrieve-surrounding` signal, so input methods must be prepared to
 * function without context.
 *
 * @param text location to store a UTF-8 encoded
 *   string of text holding context around the insertion point.
 *   If the function returns %TRUE, then you must free the result
 *   stored in this location with g_free().
 * @param cursorIndex location to store byte index of the insertion
 *   cursor within @text.
 * @return `TRUE` if surrounding text was provided; in this case
 *    you must free the result stored in `text`.
 */
- (bool)surroundingWithText:(char**)text cursorIndex:(int*)cursorIndex;

/**
 * Retrieves context around the insertion point.
 * 
 * Input methods typically want context in order to constrain input
 * text based on existing text; this is important for languages such
 * as Thai where only some sequences of characters are allowed.
 * 
 * This function is implemented by emitting the
 * [signal@Gtk.IMContext::retrieve-surrounding] signal on the input method;
 * in response to this signal, a widget should provide as much context as
 * is available, up to an entire paragraph, by calling
 * [method@Gtk.IMContext.set_surrounding_with_selection].
 * 
 * Note that there is no obligation for a widget to respond to the
 * `::retrieve-surrounding` signal, so input methods must be prepared to
 * function without context.
 *
 * @param text location to store a UTF-8 encoded
 *   string of text holding context around the insertion point.
 *   If the function returns %TRUE, then you must free the result
 *   stored in this location with g_free().
 * @param cursorIndex location to store byte index of the insertion
 *   cursor within @text.
 * @param anchorIndex location to store byte index of the selection
 *   bound within @text
 * @return `TRUE` if surrounding text was provided; in this case
 *   you must free the result stored in `text`.
 */
- (bool)surroundingWithSelectionWithText:(char**)text cursorIndex:(int*)cursorIndex anchorIndex:(int*)anchorIndex;

/**
 * Notify the input method that a change such as a change in cursor
 * position has been made.
 * 
 * This will typically cause the input method to clear the preedit state.
 *
 */
- (void)reset;

/**
 * Set the client widget for the input context.
 * 
 * This is the `GtkWidget` holding the input focus. This widget is
 * used in order to correctly position status windows, and may
 * also be used for purposes internal to the input method.
 *
 * @param widget the client widget. This may be %NULL to indicate
 *   that the previous client widget no longer exists.
 */
- (void)setClientWidget:(OGTKWidget*)widget;

/**
 * Notify the input method that a change in cursor
 * position has been made.
 * 
 * The location is relative to the client widget.
 *
 * @param area new location
 */
- (void)setCursorLocation:(const GdkRectangle*)area;

/**
 * Sets surrounding context around the insertion point and preedit
 * string.
 * 
 * This function is expected to be called in response to the
 * [signal@Gtk.IMContext::retrieve-surrounding] signal, and will
 * likely have no effect if called at other times.
 *
 * @param text text surrounding the insertion point, as UTF-8.
 *   the preedit string should not be included within @text
 * @param len the length of @text, or -1 if @text is nul-terminated
 * @param cursorIndex the byte index of the insertion cursor within @text.
 */
- (void)setSurroundingWithText:(OFString*)text len:(int)len cursorIndex:(int)cursorIndex;

/**
 * Sets surrounding context around the insertion point and preedit
 * string. This function is expected to be called in response to the
 * [signal@Gtk.IMContext::retrieve_surrounding] signal, and will likely
 * have no effect if called at other times.
 *
 * @param text text surrounding the insertion point, as UTF-8.
 *   the preedit string should not be included within @text
 * @param len the length of @text, or -1 if @text is nul-terminated
 * @param cursorIndex the byte index of the insertion cursor within @text
 * @param anchorIndex the byte index of the selection bound within @text
 */
- (void)setSurroundingWithSelectionWithText:(OFString*)text len:(int)len cursorIndex:(int)cursorIndex anchorIndex:(int)anchorIndex;

/**
 * Sets whether the IM context should use the preedit string
 * to display feedback.
 * 
 * If @use_preedit is %FALSE (default is %TRUE), then the IM context
 * may use some other method to display feedback, such as displaying
 * it in a child of the root window.
 *
 * @param usePreedit whether the IM context should use the preedit string.
 */
- (void)setUsePreedit:(bool)usePreedit;

@end