/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;
@class OGTKTextBuffer;
@class OGTKTextChildAnchor;
@class OGTKTextMark;
@class OGPangoContext;

/**
 * A widget that displays the contents of a [class@Gtk.TextBuffer].
 * 
 * ![An example GtkTextview](multiline-text.png)
 * 
 * You may wish to begin by reading the [conceptual overview](section-text-widget.html),
 * which gives an overview of all the objects and data types related to the
 * text widget and how they work together.
 * 
 * ## CSS nodes
 * 
 * ```
 * textview.view
 * ├── border.top
 * ├── border.left
 * ├── text
 * │   ╰── [selection]
 * ├── border.right
 * ├── border.bottom
 * ╰── [window.popup]
 * ```
 * 
 * `GtkTextView` has a main css node with name textview and style class .view,
 * and subnodes for each of the border windows, and the main text area,
 * with names border and text, respectively. The border nodes each get
 * one of the style classes .left, .right, .top or .bottom.
 * 
 * A node representing the selection will appear below the text node.
 * 
 * If a context menu is opened, the window node will appear as a subnode
 * of the main node.
 * 
 * ## Accessibility
 * 
 * `GtkTextView` uses the %GTK_ACCESSIBLE_ROLE_TEXT_BOX role.
 *
 */
@interface OGTKTextView : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithBuffer:(OGTKTextBuffer*)buffer;

/**
 * Methods
 */

- (GtkTextView*)castedGObject;

/**
 * Adds a child widget in the text buffer, at the given @anchor.
 *
 * @param child a `GtkWidget`
 * @param anchor a `GtkTextChildAnchor` in the `GtkTextBuffer` for @text_view
 */
- (void)addChildAtAnchorWithChild:(OGTKWidget*)child anchor:(OGTKTextChildAnchor*)anchor;

/**
 * Adds @child at a fixed coordinate in the `GtkTextView`'s text window.
 * 
 * The @xpos and @ypos must be in buffer coordinates (see
 * [method@Gtk.TextView.get_iter_location] to convert to
 * buffer coordinates).
 * 
 * @child will scroll with the text view.
 * 
 * If instead you want a widget that will not move with the
 * `GtkTextView` contents see `GtkOverlay`.
 *
 * @param child a `GtkWidget`
 * @param xpos X position of child in window coordinates
 * @param ypos Y position of child in window coordinates
 */
- (void)addOverlayWithChild:(OGTKWidget*)child xpos:(int)xpos ypos:(int)ypos;

/**
 * Moves the given @iter backward by one display (wrapped) line.
 * 
 * A display line is different from a paragraph. Paragraphs are
 * separated by newlines or other paragraph separator characters.
 * Display lines are created by line-wrapping a paragraph. If
 * wrapping is turned off, display lines and paragraphs will be the
 * same. Display lines are divided differently for each view, since
 * they depend on the view’s width; paragraphs are the same in all
 * views, since they depend on the contents of the `GtkTextBuffer`.
 *
 * @param iter a `GtkTextIter`
 * @return %TRUE if @iter was moved and is not on the end iterator
 */
- (bool)backwardDisplayLine:(GtkTextIter*)iter;

/**
 * Moves the given @iter backward to the next display line start.
 * 
 * A display line is different from a paragraph. Paragraphs are
 * separated by newlines or other paragraph separator characters.
 * Display lines are created by line-wrapping a paragraph. If
 * wrapping is turned off, display lines and paragraphs will be the
 * same. Display lines are divided differently for each view, since
 * they depend on the view’s width; paragraphs are the same in all
 * views, since they depend on the contents of the `GtkTextBuffer`.
 *
 * @param iter a `GtkTextIter`
 * @return %TRUE if @iter was moved and is not on the end iterator
 */
- (bool)backwardDisplayLineStart:(GtkTextIter*)iter;

/**
 * Converts buffer coordinates to window coordinates.
 *
 * @param win a `GtkTextWindowType`
 * @param bufferX buffer x coordinate
 * @param bufferY buffer y coordinate
 * @param windowX window x coordinate return location
 * @param windowY window y coordinate return location
 */
- (void)bufferToWindowCoordsWithWin:(GtkTextWindowType)win bufferX:(int)bufferX bufferY:(int)bufferY windowX:(int*)windowX windowY:(int*)windowY;

/**
 * Moves the given @iter forward by one display (wrapped) line.
 * 
 * A display line is different from a paragraph. Paragraphs are
 * separated by newlines or other paragraph separator characters.
 * Display lines are created by line-wrapping a paragraph. If
 * wrapping is turned off, display lines and paragraphs will be the
 * same. Display lines are divided differently for each view, since
 * they depend on the view’s width; paragraphs are the same in all
 * views, since they depend on the contents of the `GtkTextBuffer`.
 *
 * @param iter a `GtkTextIter`
 * @return %TRUE if @iter was moved and is not on the end iterator
 */
- (bool)forwardDisplayLine:(GtkTextIter*)iter;

/**
 * Moves the given @iter forward to the next display line end.
 * 
 * A display line is different from a paragraph. Paragraphs are
 * separated by newlines or other paragraph separator characters.
 * Display lines are created by line-wrapping a paragraph. If
 * wrapping is turned off, display lines and paragraphs will be the
 * same. Display lines are divided differently for each view, since
 * they depend on the view’s width; paragraphs are the same in all
 * views, since they depend on the contents of the `GtkTextBuffer`.
 *
 * @param iter a `GtkTextIter`
 * @return %TRUE if @iter was moved and is not on the end iterator
 */
- (bool)forwardDisplayLineEnd:(GtkTextIter*)iter;

/**
 * Returns whether pressing the <kbd>Tab</kbd> key inserts a tab characters.
 * 
 * See [method@Gtk.TextView.set_accepts_tab].
 *
 * @return %TRUE if pressing the Tab key inserts a tab character,
 *   %FALSE if pressing the Tab key moves the keyboard focus.
 */
- (bool)acceptsTab;

/**
 * Gets the bottom margin for text in the @text_view.
 *
 * @return bottom margin in pixels
 */
- (int)bottomMargin;

/**
 * Returns the `GtkTextBuffer` being displayed by this text view.
 * 
 * The reference count on the buffer is not incremented; the caller
 * of this function won’t own a new reference.
 *
 * @return a `GtkTextBuffer`
 */
- (OGTKTextBuffer*)buffer;

/**
 * Determine the positions of the strong and weak cursors if the
 * insertion point is at @iter.
 * 
 * The position of each cursor is stored as a zero-width rectangle.
 * The strong cursor location is the location where characters of
 * the directionality equal to the base direction of the paragraph
 * are inserted. The weak cursor location is the location where
 * characters of the directionality opposite to the base direction
 * of the paragraph are inserted.
 * 
 * If @iter is %NULL, the actual cursor position is used.
 * 
 * Note that if @iter happens to be the actual cursor position, and
 * there is currently an IM preedit sequence being entered, the
 * returned locations will be adjusted to account for the preedit
 * cursor’s offset within the preedit sequence.
 * 
 * The rectangle position is in buffer coordinates; use
 * [method@Gtk.TextView.buffer_to_window_coords] to convert these
 * coordinates to coordinates for one of the windows in the text view.
 *
 * @param iter a `GtkTextIter`
 * @param strong location to store the strong cursor position
 * @param weak location to store the weak cursor position
 */
- (void)cursorLocationsWithIter:(const GtkTextIter*)iter strong:(GdkRectangle*)strong weak:(GdkRectangle*)weak;

/**
 * Find out whether the cursor should be displayed.
 *
 * @return whether the insertion mark is visible
 */
- (bool)cursorVisible;

/**
 * Returns the default editability of the `GtkTextView`.
 * 
 * Tags in the buffer may override this setting for some ranges of text.
 *
 * @return whether text is editable by default
 */
- (bool)editable;

/**
 * Gets the menu model that gets added to the context menu
 * or %NULL if none has been set.
 *
 * @return the menu model
 */
- (OGMenuModel*)extraMenu;

/**
 * Gets a `GtkWidget` that has previously been set as gutter.
 * 
 * See [method@Gtk.TextView.set_gutter].
 * 
 * @win must be one of %GTK_TEXT_WINDOW_LEFT, %GTK_TEXT_WINDOW_RIGHT,
 * %GTK_TEXT_WINDOW_TOP, or %GTK_TEXT_WINDOW_BOTTOM.
 *
 * @param win a `GtkTextWindowType`
 * @return a `GtkWidget`
 */
- (OGTKWidget*)gutter:(GtkTextWindowType)win;

/**
 * Gets the default indentation of paragraphs in @text_view.
 * 
 * Tags in the view’s buffer may override the default.
 * The indentation may be negative.
 *
 * @return number of pixels of indentation
 */
- (int)indent;

/**
 * Gets the `input-hints` of the `GtkTextView`.
 *
 * @return
 */
- (GtkInputHints)inputHints;

/**
 * Gets the `input-purpose` of the `GtkTextView`.
 *
 * @return
 */
- (GtkInputPurpose)inputPurpose;

/**
 * Retrieves the iterator at buffer coordinates @x and @y.
 * 
 * Buffer coordinates are coordinates for the entire buffer, not just
 * the currently-displayed portion. If you have coordinates from an
 * event, you have to convert those to buffer coordinates with
 * [method@Gtk.TextView.window_to_buffer_coords].
 *
 * @param iter a `GtkTextIter`
 * @param x x position, in buffer coordinates
 * @param y y position, in buffer coordinates
 * @return %TRUE if the position is over text
 */
- (bool)iterAtLocationWithIter:(GtkTextIter*)iter x:(int)x y:(int)y;

/**
 * Retrieves the iterator pointing to the character at buffer
 * coordinates @x and @y.
 * 
 * Buffer coordinates are coordinates for the entire buffer, not just
 * the currently-displayed portion. If you have coordinates from an event,
 * you have to convert those to buffer coordinates with
 * [method@Gtk.TextView.window_to_buffer_coords].
 * 
 * Note that this is different from [method@Gtk.TextView.get_iter_at_location],
 * which returns cursor locations, i.e. positions between characters.
 *
 * @param iter a `GtkTextIter`
 * @param trailing if non-%NULL, location to store
 *    an integer indicating where in the grapheme the user clicked.
 *    It will either be zero, or the number of characters in the grapheme.
 *    0 represents the trailing edge of the grapheme.
 * @param x x position, in buffer coordinates
 * @param y y position, in buffer coordinates
 * @return %TRUE if the position is over text
 */
- (bool)iterAtPositionWithIter:(GtkTextIter*)iter trailing:(int*)trailing x:(int)x y:(int)y;

/**
 * Gets a rectangle which roughly contains the character at @iter.
 * 
 * The rectangle position is in buffer coordinates; use
 * [method@Gtk.TextView.buffer_to_window_coords] to convert these
 * coordinates to coordinates for one of the windows in the text view.
 *
 * @param iter a `GtkTextIter`
 * @param location bounds of the character at @iter
 */
- (void)iterLocationWithIter:(const GtkTextIter*)iter location:(GdkRectangle*)location;

/**
 * Gets the default justification of paragraphs in @text_view.
 * 
 * Tags in the buffer may override the default.
 *
 * @return default justification
 */
- (GtkJustification)justification;

/**
 * Gets the default left margin size of paragraphs in the @text_view.
 * 
 * Tags in the buffer may override the default.
 *
 * @return left margin in pixels
 */
- (int)leftMargin;

/**
 * Gets the `GtkTextIter` at the start of the line containing
 * the coordinate @y.
 * 
 * @y is in buffer coordinates, convert from window coordinates with
 * [method@Gtk.TextView.window_to_buffer_coords]. If non-%NULL,
 * @line_top will be filled with the coordinate of the top edge
 * of the line.
 *
 * @param targetIter a `GtkTextIter`
 * @param y a y coordinate
 * @param lineTop return location for top coordinate of the line
 */
- (void)lineAtYWithTargetIter:(GtkTextIter*)targetIter y:(int)y lineTop:(int*)lineTop;

/**
 * Gets the y coordinate of the top of the line containing @iter,
 * and the height of the line.
 * 
 * The coordinate is a buffer coordinate; convert to window
 * coordinates with [method@Gtk.TextView.buffer_to_window_coords].
 *
 * @param iter a `GtkTextIter`
 * @param y return location for a y coordinate
 * @param height return location for a height
 */
- (void)lineYrangeWithIter:(const GtkTextIter*)iter y:(int*)y height:(int*)height;

/**
 * Gets the `PangoContext` that is used for rendering LTR directed
 * text layouts.
 * 
 * The context may be replaced when CSS changes occur.
 *
 * @return a `PangoContext`
 */
- (OGPangoContext*)ltrContext;

/**
 * Gets whether the `GtkTextView` uses monospace styling.
 *
 * @return %TRUE if monospace fonts are desired
 */
- (bool)monospace;

/**
 * Returns whether the `GtkTextView` is in overwrite mode or not.
 *
 * @return whether @text_view is in overwrite mode or not.
 */
- (bool)overwrite;

/**
 * Gets the default number of pixels to put above paragraphs.
 * 
 * Adding this function with [method@Gtk.TextView.get_pixels_below_lines]
 * is equal to the line space between each paragraph.
 *
 * @return default number of pixels above paragraphs
 */
- (int)pixelsAboveLines;

/**
 * Gets the default number of pixels to put below paragraphs.
 * 
 * The line space is the sum of the value returned by this function and
 * the value returned by [method@Gtk.TextView.get_pixels_above_lines].
 *
 * @return default number of blank pixels below paragraphs
 */
- (int)pixelsBelowLines;

/**
 * Gets the default number of pixels to put between wrapped lines
 * inside a paragraph.
 *
 * @return default number of pixels of blank space between wrapped lines
 */
- (int)pixelsInsideWrap;

/**
 * Gets the default right margin for text in @text_view.
 * 
 * Tags in the buffer may override the default.
 *
 * @return right margin in pixels
 */
- (int)rightMargin;

/**
 * Gets the `PangoContext` that is used for rendering RTL directed
 * text layouts.
 * 
 * The context may be replaced when CSS changes occur.
 *
 * @return a `PangoContext`
 */
- (OGPangoContext*)rtlContext;

/**
 * Gets the default tabs for @text_view.
 * 
 * Tags in the buffer may override the defaults. The returned array
 * will be %NULL if “standard” (8-space) tabs are used. Free the
 * return value with [method@Pango.TabArray.free].
 *
 * @return copy of default tab array,
 *   or %NULL if standard tabs are used; must be freed with
 *   [method@Pango.TabArray.free].
 */
- (PangoTabArray*)tabs;

/**
 * Gets the top margin for text in the @text_view.
 *
 * @return top margin in pixels
 */
- (int)topMargin;

/**
 * Fills @visible_rect with the currently-visible
 * region of the buffer, in buffer coordinates.
 * 
 * Convert to window coordinates with
 * [method@Gtk.TextView.buffer_to_window_coords].
 *
 * @param visibleRect rectangle to fill
 */
- (void)visibleRect:(GdkRectangle*)visibleRect;

/**
 * Gets the line wrapping for the view.
 *
 * @return the line wrap setting
 */
- (GtkWrapMode)wrapMode;

/**
 * Allow the `GtkTextView` input method to internally handle key press
 * and release events.
 * 
 * If this function returns %TRUE, then no further processing should be
 * done for this key event. See [method@Gtk.IMContext.filter_keypress].
 * 
 * Note that you are expected to call this function from your handler
 * when overriding key event handling. This is needed in the case when
 * you need to insert your own key handling between the input method
 * and the default key event handling of the `GtkTextView`.
 * 
 * ```c
 * static gboolean
 * gtk_foo_bar_key_press_event (GtkWidget *widget,
 *                              GdkEvent  *event)
 * {
 *   guint keyval;
 * 
 *   gdk_event_get_keyval ((GdkEvent*)event, &keyval);
 * 
 *   if (keyval == GDK_KEY_Return || keyval == GDK_KEY_KP_Enter)
 *     {
 *       if (gtk_text_view_im_context_filter_keypress (GTK_TEXT_VIEW (widget), event))
 *         return TRUE;
 *     }
 * 
 *   // Do some stuff
 * 
 *   return GTK_WIDGET_CLASS (gtk_foo_bar_parent_class)->key_press_event (widget, event);
 * }
 * ```
 *
 * @param event the key event
 * @return %TRUE if the input method handled the key event.
 */
- (bool)imContextFilterKeypress:(GdkEvent*)event;

/**
 * Moves a mark within the buffer so that it's
 * located within the currently-visible text area.
 *
 * @param mark a `GtkTextMark`
 * @return %TRUE if the mark moved (wasn’t already onscreen)
 */
- (bool)moveMarkOnscreen:(OGTKTextMark*)mark;

/**
 * Updates the position of a child.
 * 
 * See [method@Gtk.TextView.add_overlay].
 *
 * @param child a widget already added with [method@Gtk.TextView.add_overlay]
 * @param xpos new X position in buffer coordinates
 * @param ypos new Y position in buffer coordinates
 */
- (void)moveOverlayWithChild:(OGTKWidget*)child xpos:(int)xpos ypos:(int)ypos;

/**
 * Move the iterator a given number of characters visually, treating
 * it as the strong cursor position.
 * 
 * If @count is positive, then the new strong cursor position will
 * be @count positions to the right of the old cursor position.
 * If @count is negative then the new strong cursor position will
 * be @count positions to the left of the old cursor position.
 * 
 * In the presence of bi-directional text, the correspondence
 * between logical and visual order will depend on the direction
 * of the current run, and there may be jumps when the cursor
 * is moved off of the end of a run.
 *
 * @param iter a `GtkTextIter`
 * @param count number of characters to move (negative moves left,
 *    positive moves right)
 * @return %TRUE if @iter moved and is not on the end iterator
 */
- (bool)moveVisuallyWithIter:(GtkTextIter*)iter count:(int)count;

/**
 * Moves the cursor to the currently visible region of the
 * buffer.
 *
 * @return %TRUE if the cursor had to be moved.
 */
- (bool)placeCursorOnscreen;

/**
 * Removes a child widget from @text_view.
 *
 * @param child the child to remove
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Ensures that the cursor is shown.
 * 
 * This also resets the time that it will stay blinking (or
 * visible, in case blinking is disabled).
 * 
 * This function should be called in response to user input
 * (e.g. from derived classes that override the textview's
 * event handlers).
 *
 */
- (void)resetCursorBlink;

/**
 * Reset the input method context of the text view if needed.
 * 
 * This can be necessary in the case where modifying the buffer
 * would confuse on-going input method behavior.
 *
 */
- (void)resetImContext;

/**
 * Scrolls @text_view the minimum distance such that @mark is contained
 * within the visible area of the widget.
 *
 * @param mark a mark in the buffer for @text_view
 */
- (void)scrollMarkOnscreen:(OGTKTextMark*)mark;

/**
 * Scrolls @text_view so that @iter is on the screen in the position
 * indicated by @xalign and @yalign.
 * 
 * An alignment of 0.0 indicates left or top, 1.0 indicates right or
 * bottom, 0.5 means center. If @use_align is %FALSE, the text scrolls
 * the minimal distance to get the mark onscreen, possibly not scrolling
 * at all. The effective screen for purposes of this function is reduced
 * by a margin of size @within_margin.
 * 
 * Note that this function uses the currently-computed height of the
 * lines in the text buffer. Line heights are computed in an idle
 * handler; so this function may not have the desired effect if it’s
 * called before the height computations. To avoid oddness, consider
 * using [method@Gtk.TextView.scroll_to_mark] which saves a point to be
 * scrolled to after line validation.
 *
 * @param iter a `GtkTextIter`
 * @param withinMargin margin as a [0.0,0.5) fraction of screen size
 * @param useAlign whether to use alignment arguments (if %FALSE,
 *    just get the mark onscreen)
 * @param xalign horizontal alignment of mark within visible area
 * @param yalign vertical alignment of mark within visible area
 * @return %TRUE if scrolling occurred
 */
- (bool)scrollToIterWithIter:(GtkTextIter*)iter withinMargin:(double)withinMargin useAlign:(bool)useAlign xalign:(double)xalign yalign:(double)yalign;

/**
 * Scrolls @text_view so that @mark is on the screen in the position
 * indicated by @xalign and @yalign.
 * 
 * An alignment of 0.0 indicates left or top, 1.0 indicates right or
 * bottom, 0.5 means center. If @use_align is %FALSE, the text scrolls
 * the minimal distance to get the mark onscreen, possibly not scrolling
 * at all. The effective screen for purposes of this function is reduced
 * by a margin of size @within_margin.
 *
 * @param mark a `GtkTextMark`
 * @param withinMargin margin as a [0.0,0.5) fraction of screen size
 * @param useAlign whether to use alignment arguments (if %FALSE, just
 *    get the mark onscreen)
 * @param xalign horizontal alignment of mark within visible area
 * @param yalign vertical alignment of mark within visible area
 */
- (void)scrollToMarkWithMark:(OGTKTextMark*)mark withinMargin:(double)withinMargin useAlign:(bool)useAlign xalign:(double)xalign yalign:(double)yalign;

/**
 * Sets the behavior of the text widget when the <kbd>Tab</kbd> key is pressed.
 * 
 * If @accepts_tab is %TRUE, a tab character is inserted. If @accepts_tab
 * is %FALSE the keyboard focus is moved to the next widget in the focus
 * chain.
 * 
 * Focus can always be moved using <kbd>Ctrl</kbd>+<kbd>Tab</kbd>.
 *
 * @param acceptsTab %TRUE if pressing the Tab key should insert a tab
 *    character, %FALSE, if pressing the Tab key should move the
 *    keyboard focus.
 */
- (void)setAcceptsTab:(bool)acceptsTab;

/**
 * Sets the bottom margin for text in @text_view.
 * 
 * Note that this function is confusingly named.
 * In CSS terms, the value set here is padding.
 *
 * @param bottomMargin bottom margin in pixels
 */
- (void)setBottomMargin:(int)bottomMargin;

/**
 * Sets @buffer as the buffer being displayed by @text_view.
 * 
 * The previous buffer displayed by the text view is unreferenced, and
 * a reference is added to @buffer. If you owned a reference to @buffer
 * before passing it to this function, you must remove that reference
 * yourself; `GtkTextView` will not “adopt” it.
 *
 * @param buffer a `GtkTextBuffer`
 */
- (void)setBuffer:(OGTKTextBuffer*)buffer;

/**
 * Toggles whether the insertion point should be displayed.
 * 
 * A buffer with no editable text probably shouldn’t have a visible
 * cursor, so you may want to turn the cursor off.
 * 
 * Note that this property may be overridden by the
 * [property@Gtk.Settings:gtk-keynav-use-caret] setting.
 *
 * @param setting whether to show the insertion cursor
 */
- (void)setCursorVisible:(bool)setting;

/**
 * Sets the default editability of the `GtkTextView`.
 * 
 * You can override this default setting with tags in the buffer,
 * using the “editable” attribute of tags.
 *
 * @param setting whether it’s editable
 */
- (void)setEditable:(bool)setting;

/**
 * Sets a menu model to add when constructing the context
 * menu for @text_view.
 * 
 * You can pass %NULL to remove a previously set extra menu.
 *
 * @param model a `GMenuModel`
 */
- (void)setExtraMenu:(OGMenuModel*)model;

/**
 * Places @widget into the gutter specified by @win.
 * 
 * @win must be one of %GTK_TEXT_WINDOW_LEFT, %GTK_TEXT_WINDOW_RIGHT,
 * %GTK_TEXT_WINDOW_TOP, or %GTK_TEXT_WINDOW_BOTTOM.
 *
 * @param win a `GtkTextWindowType`
 * @param widget a `GtkWidget`
 */
- (void)setGutterWithWin:(GtkTextWindowType)win widget:(OGTKWidget*)widget;

/**
 * Sets the default indentation for paragraphs in @text_view.
 * 
 * Tags in the buffer may override the default.
 *
 * @param indent indentation in pixels
 */
- (void)setIndent:(int)indent;

/**
 * Sets the `input-hints` of the `GtkTextView`.
 * 
 * The `input-hints` allow input methods to fine-tune
 * their behaviour.
 *
 * @param hints the hints
 */
- (void)setInputHints:(GtkInputHints)hints;

/**
 * Sets the `input-purpose` of the `GtkTextView`.
 * 
 * The `input-purpose` can be used by on-screen keyboards
 * and other input methods to adjust their behaviour.
 *
 * @param purpose the purpose
 */
- (void)setInputPurpose:(GtkInputPurpose)purpose;

/**
 * Sets the default justification of text in @text_view.
 * 
 * Tags in the view’s buffer may override the default.
 *
 * @param justification justification
 */
- (void)setJustification:(GtkJustification)justification;

/**
 * Sets the default left margin for text in @text_view.
 * 
 * Tags in the buffer may override the default.
 * 
 * Note that this function is confusingly named.
 * In CSS terms, the value set here is padding.
 *
 * @param leftMargin left margin in pixels
 */
- (void)setLeftMargin:(int)leftMargin;

/**
 * Sets whether the `GtkTextView` should display text in
 * monospace styling.
 *
 * @param monospace %TRUE to request monospace styling
 */
- (void)setMonospace:(bool)monospace;

/**
 * Changes the `GtkTextView` overwrite mode.
 *
 * @param overwrite %TRUE to turn on overwrite mode, %FALSE to turn it off
 */
- (void)setOverwrite:(bool)overwrite;

/**
 * Sets the default number of blank pixels above paragraphs in @text_view.
 * 
 * Tags in the buffer for @text_view may override the defaults.
 *
 * @param pixelsAboveLines pixels above paragraphs
 */
- (void)setPixelsAboveLines:(int)pixelsAboveLines;

/**
 * Sets the default number of pixels of blank space
 * to put below paragraphs in @text_view.
 * 
 * May be overridden by tags applied to @text_view’s buffer.
 *
 * @param pixelsBelowLines pixels below paragraphs
 */
- (void)setPixelsBelowLines:(int)pixelsBelowLines;

/**
 * Sets the default number of pixels of blank space to leave between
 * display/wrapped lines within a paragraph.
 * 
 * May be overridden by tags in @text_view’s buffer.
 *
 * @param pixelsInsideWrap default number of pixels between wrapped lines
 */
- (void)setPixelsInsideWrap:(int)pixelsInsideWrap;

/**
 * Sets the default right margin for text in the text view.
 * 
 * Tags in the buffer may override the default.
 * 
 * Note that this function is confusingly named.
 * In CSS terms, the value set here is padding.
 *
 * @param rightMargin right margin in pixels
 */
- (void)setRightMargin:(int)rightMargin;

/**
 * Sets the default tab stops for paragraphs in @text_view.
 * 
 * Tags in the buffer may override the default.
 *
 * @param tabs tabs as a `PangoTabArray`
 */
- (void)setTabs:(PangoTabArray*)tabs;

/**
 * Sets the top margin for text in @text_view.
 * 
 * Note that this function is confusingly named.
 * In CSS terms, the value set here is padding.
 *
 * @param topMargin top margin in pixels
 */
- (void)setTopMargin:(int)topMargin;

/**
 * Sets the line wrapping for the view.
 *
 * @param wrapMode a `GtkWrapMode`
 */
- (void)setWrapMode:(GtkWrapMode)wrapMode;

/**
 * Determines whether @iter is at the start of a display line.
 * 
 * See [method@Gtk.TextView.forward_display_line] for an
 * explanation of display lines vs. paragraphs.
 *
 * @param iter a `GtkTextIter`
 * @return %TRUE if @iter begins a wrapped line
 */
- (bool)startsDisplayLine:(const GtkTextIter*)iter;

/**
 * Converts coordinates on the window identified by @win to buffer
 * coordinates.
 *
 * @param win a `GtkTextWindowType`
 * @param windowX window x coordinate
 * @param windowY window y coordinate
 * @param bufferX buffer x coordinate return location
 * @param bufferY buffer y coordinate return location
 */
- (void)windowToBufferCoordsWithWin:(GtkTextWindowType)win windowX:(int)windowX windowY:(int)windowY bufferX:(int*)bufferX bufferY:(int*)bufferY;

@end