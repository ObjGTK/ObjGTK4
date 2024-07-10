/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;
@class OGPangoLayout;

/**
 * The `GtkLabel` widget displays a small amount of text.
 * 
 * As the name implies, most labels are used to label another widget
 * such as a [class@Button].
 * 
 * ![An example GtkLabel](label.png)
 * 
 * # CSS nodes
 * 
 * ```
 * label
 * ├── [selection]
 * ├── [link]
 * ┊
 * ╰── [link]
 * ```
 * 
 * `GtkLabel` has a single CSS node with the name label. A wide variety
 * of style classes may be applied to labels, such as .title, .subtitle,
 * .dim-label, etc. In the `GtkShortcutsWindow`, labels are used with the
 * .keycap style class.
 * 
 * If the label has a selection, it gets a subnode with name selection.
 * 
 * If the label has links, there is one subnode per link. These subnodes
 * carry the link or visited state depending on whether they have been
 * visited. In this case, label node also gets a .link style class.
 * 
 * # GtkLabel as GtkBuildable
 * 
 * The GtkLabel implementation of the GtkBuildable interface supports a
 * custom <attributes> element, which supports any number of <attribute>
 * elements. The <attribute> element has attributes named “name“, “value“,
 * “start“ and “end“ and allows you to specify [struct@Pango.Attribute]
 * values for this label.
 * 
 * An example of a UI definition fragment specifying Pango attributes:
 * ```xml
 * <object class="GtkLabel">
 *   <attributes>
 *     <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
 *     <attribute name="background" value="red" start="5" end="10"/>
 *   </attributes>
 * </object>
 * ```
 * 
 * The start and end attributes specify the range of characters to which the
 * Pango attribute applies. If start and end are not specified, the attribute is
 * applied to the whole text. Note that specifying ranges does not make much
 * sense with translatable attributes. Use markup embedded in the translatable
 * content instead.
 * 
 * # Accessibility
 * 
 * `GtkLabel` uses the %GTK_ACCESSIBLE_ROLE_LABEL role.
 * 
 * # Mnemonics
 * 
 * Labels may contain “mnemonics”. Mnemonics are underlined characters in the
 * label, used for keyboard navigation. Mnemonics are created by providing a
 * string with an underscore before the mnemonic character, such as `"_File"`,
 * to the functions [ctor@Gtk.Label.new_with_mnemonic] or
 * [method@Gtk.Label.set_text_with_mnemonic].
 * 
 * Mnemonics automatically activate any activatable widget the label is
 * inside, such as a [class@Gtk.Button]; if the label is not inside the
 * mnemonic’s target widget, you have to tell the label about the target
 * using [class@Gtk.Label.set_mnemonic_widget]. Here’s a simple example where
 * the label is inside a button:
 * 
 * ```c
 * // Pressing Alt+H will activate this button
 * GtkWidget *button = gtk_button_new ();
 * GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
 * gtk_button_set_child (GTK_BUTTON (button), label);
 * ```
 * 
 * There’s a convenience function to create buttons with a mnemonic label
 * already inside:
 * 
 * ```c
 * // Pressing Alt+H will activate this button
 * GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
 * ```
 * 
 * To create a mnemonic for a widget alongside the label, such as a
 * [class@Gtk.Entry], you have to point the label at the entry with
 * [method@Gtk.Label.set_mnemonic_widget]:
 * 
 * ```c
 * // Pressing Alt+H will focus the entry
 * GtkWidget *entry = gtk_entry_new ();
 * GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
 * gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
 * ```
 * 
 * # Markup (styled text)
 * 
 * To make it easy to format text in a label (changing colors,
 * fonts, etc.), label text can be provided in a simple
 * markup format:
 * 
 * Here’s how to create a label with a small font:
 * ```c
 * GtkWidget *label = gtk_label_new (NULL);
 * gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
 * ```
 * 
 * (See the Pango manual for complete documentation] of available
 * tags, [func@Pango.parse_markup])
 * 
 * The markup passed to gtk_label_set_markup() must be valid; for example,
 * literal <, > and & characters must be escaped as &lt;, &gt;, and &amp;.
 * If you pass text obtained from the user, file, or a network to
 * [method@Gtk.Label.set_markup], you’ll want to escape it with
 * g_markup_escape_text() or g_markup_printf_escaped().
 * 
 * Markup strings are just a convenient way to set the [struct@Pango.AttrList]
 * on a label; [method@Gtk.Label.set_attributes] may be a simpler way to set
 * attributes in some cases. Be careful though; [struct@Pango.AttrList] tends
 * to cause internationalization problems, unless you’re applying attributes
 * to the entire string (i.e. unless you set the range of each attribute
 * to [0, %G_MAXINT)). The reason is that specifying the start_index and
 * end_index for a [struct@Pango.Attribute] requires knowledge of the exact
 * string being displayed, so translations will cause problems.
 * 
 * # Selectable labels
 * 
 * Labels can be made selectable with [method@Gtk.Label.set_selectable].
 * Selectable labels allow the user to copy the label contents to
 * the clipboard. Only labels that contain useful-to-copy information
 * — such as error messages — should be made selectable.
 * 
 * # Text layout
 * 
 * A label can contain any number of paragraphs, but will have
 * performance problems if it contains more than a small number.
 * Paragraphs are separated by newlines or other paragraph separators
 * understood by Pango.
 * 
 * Labels can automatically wrap text if you call [method@Gtk.Label.set_wrap].
 * 
 * [method@Gtk.Label.set_justify] sets how the lines in a label align
 * with one another. If you want to set how the label as a whole aligns
 * in its available space, see the [property@Gtk.Widget:halign] and
 * [property@Gtk.Widget:valign] properties.
 * 
 * The [property@Gtk.Label:width-chars] and [property@Gtk.Label:max-width-chars]
 * properties can be used to control the size allocation of ellipsized or
 * wrapped labels. For ellipsizing labels, if either is specified (and less
 * than the actual text size), it is used as the minimum width, and the actual
 * text size is used as the natural width of the label. For wrapping labels,
 * width-chars is used as the minimum width, if specified, and max-width-chars
 * is used as the natural width. Even if max-width-chars specified, wrapping
 * labels will be rewrapped to use all of the available width.
 * 
 * # Links
 * 
 * GTK supports markup for clickable hyperlinks in addition to regular Pango
 * markup. The markup for links is borrowed from HTML, using the `<a>` with
 * “href“, “title“ and “class“ attributes. GTK renders links similar to the
 * way they appear in web browsers, with colored, underlined text. The “title“
 * attribute is displayed as a tooltip on the link. The “class“ attribute is
 * used as style class on the CSS node for the link.
 * 
 * An example looks like this:
 * 
 * ```c
 * const char *text =
 * "Go to the"
 * "<a href=\"http://www.gtk.org title=\"&lt;i&gt;Our&lt;/i&gt; website\">"
 * "GTK website</a> for more...";
 * GtkWidget *label = gtk_label_new (NULL);
 * gtk_label_set_markup (GTK_LABEL (label), text);
 * ```
 * 
 * It is possible to implement custom handling for links and their tooltips
 * with the [signal@Gtk.Label::activate-link] signal and the
 * [method@Gtk.Label.get_current_uri] function.
 *
 */
@interface OGTKLabel : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)str;
- (instancetype)initWithMnemonic:(OFString*)str;

/**
 * Methods
 */

- (GtkLabel*)castedGObject;

/**
 * Gets the labels attribute list.
 * 
 * This is the [struct@Pango.AttrList] that was set on the label using
 * [method@Gtk.Label.set_attributes], if any. This function does not
 * reflect attributes that come from the labels markup (see
 * [method@Gtk.Label.set_markup]). If you want to get the effective
 * attributes for the label, use
 * `pango_layout_get_attribute (gtk_label_get_layout (self))`.
 *
 * @return the attribute list
 */
- (PangoAttrList*)attributes;

/**
 * Returns the URI for the currently active link in the label.
 * 
 * The active link is the one under the mouse pointer or, in a
 * selectable label, the link in which the text cursor is currently
 * positioned.
 * 
 * This function is intended for use in a [signal@Gtk.Label::activate-link]
 * handler or for use in a [signal@Gtk.Widget::query-tooltip] handler.
 *
 * @return the currently active URI
 */
- (OFString*)currentUri;

/**
 * Returns the ellipsizing position of the label.
 * 
 * See [method@Gtk.Label.set_ellipsize].
 *
 * @return `PangoEllipsizeMode`
 */
- (PangoEllipsizeMode)ellipsize;

/**
 * Gets the extra menu model of @label.
 * 
 * See [method@Gtk.Label.set_extra_menu].
 *
 * @return the menu model
 */
- (OGMenuModel*)extraMenu;

/**
 * Returns the justification of the label.
 * 
 * See [method@Gtk.Label.set_justify].
 *
 * @return `GtkJustification`
 */
- (GtkJustification)justify;

/**
 * Fetches the text from a label.
 * 
 * The returned text includes any embedded underlines indicating
 * mnemonics and Pango markup. (See [method@Gtk.Label.get_text]).
 *
 * @return the text of the label widget. This string is
 *   owned by the widget and must not be modified or freed.
 */
- (OFString*)label;

/**
 * Gets the `PangoLayout` used to display the label.
 * 
 * The layout is useful to e.g. convert text positions to pixel
 * positions, in combination with [method@Gtk.Label.get_layout_offsets].
 * The returned layout is owned by the @label so need not be
 * freed by the caller. The @label is free to recreate its layout
 * at any time, so it should be considered read-only.
 *
 * @return the [class@Pango.Layout] for this label
 */
- (OGPangoLayout*)layout;

/**
 * Obtains the coordinates where the label will draw its `PangoLayout`.
 * 
 * The coordinates are useful to convert mouse events into coordinates
 * inside the [class@Pango.Layout], e.g. to take some action if some part
 * of the label is clicked. Remember when using the [class@Pango.Layout]
 * functions you need to convert to and from pixels using PANGO_PIXELS()
 * or [const@Pango.SCALE].
 *
 * @param x location to store X offset of layout
 * @param y location to store Y offset of layout
 */
- (void)layoutOffsetsWithX:(int*)x y:(int*)y;

/**
 * Gets the number of lines to which an ellipsized, wrapping
 * label should be limited.
 * 
 * See [method@Gtk.Label.set_lines].
 *
 * @return The number of lines
 */
- (int)lines;

/**
 * Retrieves the desired maximum width of @label, in characters.
 * 
 * See [method@Gtk.Label.set_width_chars].
 *
 * @return the maximum width of the label in characters.
 */
- (int)maxWidthChars;

/**
 * Return the mnemonic accelerator.
 * 
 * If the label has been set so that it has a mnemonic key this function
 * returns the keyval used for the mnemonic accelerator. If there is no
 * mnemonic set up it returns `GDK_KEY_VoidSymbol`.
 *
 * @return GDK keyval usable for accelerators, or `GDK_KEY_VoidSymbol`
 */
- (guint)mnemonicKeyval;

/**
 * Retrieves the target of the mnemonic (keyboard shortcut) of this
 * label.
 * 
 * See [method@Gtk.Label.set_mnemonic_widget].
 *
 * @return the target of the label’s mnemonic,
 *   or %NULL if none has been set and the default algorithm will be used.
 */
- (OGTKWidget*)mnemonicWidget;

/**
 * Returns line wrap mode used by the label.
 * 
 * See [method@Gtk.Label.set_natural_wrap_mode].
 *
 * @return the natural line wrap mode
 */
- (GtkNaturalWrapMode)naturalWrapMode;

/**
 * Returns whether the label is selectable.
 *
 * @return %TRUE if the user can copy text from the label
 */
- (bool)selectable;

/**
 * Gets the selected range of characters in the label.
 *
 * @param start return location for start of selection, as a character offset
 * @param end return location for end of selection, as a character offset
 * @return %TRUE if selection is non-empty
 */
- (bool)selectionBoundsWithStart:(int*)start end:(int*)end;

/**
 * Returns whether the label is in single line mode.
 *
 * @return %TRUE when the label is in single line mode.
 */
- (bool)singleLineMode;

/**
 * Gets the tabs for @self.
 * 
 * The returned array will be %NULL if “standard” (8-space) tabs are used.
 * Free the return value with [method@Pango.TabArray.free].
 *
 * @return copy of default tab array,
 *   or %NULL if standard tabs are used; must be freed with
 *   [method@Pango.TabArray.free].
 */
- (PangoTabArray*)tabs;

/**
 * Fetches the text from a label.
 * 
 * The returned text is as it appears on screen. This does not include
 * any embedded underlines indicating mnemonics or Pango markup. (See
 * [method@Gtk.Label.get_label])
 *
 * @return the text in the label widget. This is the internal
 *   string used by the label, and must not be modified.
 */
- (OFString*)text;

/**
 * Returns whether the label’s text is interpreted as Pango markup.
 * 
 * See [method@Gtk.Label.set_use_markup].
 *
 * @return %TRUE if the label’s text will be parsed for markup.
 */
- (bool)useMarkup;

/**
 * Returns whether an embedded underlines in the label indicate mnemonics.
 * 
 * See [method@Gtk.Label.set_use_underline].
 *
 * @return %TRUE whether an embedded underline in the label indicates
 *   the mnemonic accelerator keys.
 */
- (bool)useUnderline;

/**
 * Retrieves the desired width of @label, in characters.
 * 
 * See [method@Gtk.Label.set_width_chars].
 *
 * @return the width of the label in characters.
 */
- (int)widthChars;

/**
 * Returns whether lines in the label are automatically wrapped.
 * 
 * See [method@Gtk.Label.set_wrap].
 *
 * @return %TRUE if the lines of the label are automatically wrapped.
 */
- (bool)wrap;

/**
 * Returns line wrap mode used by the label.
 * 
 * See [method@Gtk.Label.set_wrap_mode].
 *
 * @return the line wrap mode
 */
- (PangoWrapMode)wrapMode;

/**
 * Gets the `xalign` of the label.
 * 
 * See the [property@Gtk.Label:xalign] property.
 *
 * @return the xalign property
 */
- (float)xalign;

/**
 * Gets the `yalign` of the label.
 * 
 * See the [property@Gtk.Label:yalign] property.
 *
 * @return the yalign property
 */
- (float)yalign;

/**
 * Selects a range of characters in the label, if the label is selectable.
 * 
 * See [method@Gtk.Label.set_selectable]. If the label is not selectable,
 * this function has no effect. If @start_offset or
 * @end_offset are -1, then the end of the label will be substituted.
 *
 * @param startOffset start offset (in characters not bytes)
 * @param endOffset end offset (in characters not bytes)
 */
- (void)selectRegionWithStartOffset:(int)startOffset endOffset:(int)endOffset;

/**
 * Apply attributes to the label text.
 * 
 * The attributes set with this function will be applied and merged with
 * any other attributes previously effected by way of the
 * [property@Gtk.Label:use-underline] or [property@Gtk.Label:use-markup]
 * properties. While it is not recommended to mix markup strings with
 * manually set attributes, if you must; know that the attributes will
 * be applied to the label after the markup string is parsed.
 *
 * @param attrs a [struct@Pango.AttrList]
 */
- (void)setAttributes:(PangoAttrList*)attrs;

/**
 * Sets the mode used to ellipsizei the text.
 * 
 * The text will be ellipsized if there is not enough space
 * to render the entire string.
 *
 * @param mode a `PangoEllipsizeMode`
 */
- (void)setEllipsize:(PangoEllipsizeMode)mode;

/**
 * Sets a menu model to add when constructing
 * the context menu for @label.
 *
 * @param model a `GMenuModel`
 */
- (void)setExtraMenu:(OGMenuModel*)model;

/**
 * Sets the alignment of the lines in the text of the label relative to
 * each other.
 * 
 * %GTK_JUSTIFY_LEFT is the default value when the widget is first created
 * with [ctor@Gtk.Label.new]. If you instead want to set the alignment of
 * the label as a whole, use [method@Gtk.Widget.set_halign] instead.
 * [method@Gtk.Label.set_justify] has no effect on labels containing
 * only a single line.
 *
 * @param jtype a `GtkJustification`
 */
- (void)setJustify:(GtkJustification)jtype;

/**
 * Sets the text of the label.
 * 
 * The label is interpreted as including embedded underlines and/or Pango
 * markup depending on the values of the [property@Gtk.Label:use-underline]
 * and [property@Gtk.Label:use-markup] properties.
 *
 * @param str the new text to set for the label
 */
- (void)setLabel:(OFString*)str;

/**
 * Sets the number of lines to which an ellipsized, wrapping label
 * should be limited.
 * 
 * This has no effect if the label is not wrapping or ellipsized.
 * Set this to -1 if you don’t want to limit the number of lines.
 *
 * @param lines the desired number of lines, or -1
 */
- (void)setLines:(int)lines;

/**
 * Sets the labels text and attributes from markup.
 * 
 * The string must be marked up with Pango markup
 * (see [func@Pango.parse_markup]).
 * 
 * If the @str is external data, you may need to escape it
 * with g_markup_escape_text() or g_markup_printf_escaped():
 * 
 * ```c
 * GtkWidget *self = gtk_label_new (NULL);
 * const char *str = "...";
 * const char *format = "<span style=\"italic\">\%s</span>";
 * char *markup;
 * 
 * markup = g_markup_printf_escaped (format, str);
 * gtk_label_set_markup (GTK_LABEL (self), markup);
 * g_free (markup);
 * ```
 * 
 * This function will set the [property@Gtk.Label:use-markup] property
 * to %TRUE as a side effect.
 * 
 * If you set the label contents using the [property@Gtk.Label:label]
 * property you should also ensure that you set the
 * [property@Gtk.Label:use-markup] property accordingly.
 * 
 * See also: [method@Gtk.Label.set_text]
 *
 * @param str a markup string
 */
- (void)setMarkup:(OFString*)str;

/**
 * Sets the labels text, attributes and mnemonic from markup.
 * 
 * Parses @str which is marked up with Pango markup (see [func@Pango.parse_markup]),
 * setting the label’s text and attribute list based on the parse results.
 * If characters in @str are preceded by an underscore, they are underlined
 * indicating that they represent a keyboard accelerator called a mnemonic.
 * 
 * The mnemonic key can be used to activate another widget, chosen
 * automatically, or explicitly using [method@Gtk.Label.set_mnemonic_widget].
 *
 * @param str a markup string
 */
- (void)setMarkupWithMnemonic:(OFString*)str;

/**
 * Sets the desired maximum width in characters of @label to @n_chars.
 *
 * @param nchars the new desired maximum width, in characters.
 */
- (void)setMaxWidthChars:(int)nchars;

/**
 * Associate the label with its mnemonic target.
 * 
 * If the label has been set so that it has a mnemonic key (using
 * i.e. [method@Gtk.Label.set_markup_with_mnemonic],
 * [method@Gtk.Label.set_text_with_mnemonic],
 * [ctor@Gtk.Label.new_with_mnemonic]
 * or the [property@Gtk.Label:use_underline] property) the label can be
 * associated with a widget that is the target of the mnemonic. When the
 * label is inside a widget (like a [class@Gtk.Button] or a
 * [class@Gtk.Notebook] tab) it is automatically associated with the correct
 * widget, but sometimes (i.e. when the target is a [class@Gtk.Entry] next to
 * the label) you need to set it explicitly using this function.
 * 
 * The target widget will be accelerated by emitting the
 * [signal@GtkWidget::mnemonic-activate] signal on it. The default handler for
 * this signal will activate the widget if there are no mnemonic collisions
 * and toggle focus between the colliding widgets otherwise.
 *
 * @param widget the target `GtkWidget`, or %NULL to unset
 */
- (void)setMnemonicWidget:(OGTKWidget*)widget;

/**
 * Select the line wrapping for the natural size request.
 * 
 * This only affects the natural size requested, for the actual wrapping used,
 * see the [property@Gtk.Label:wrap-mode] property.
 *
 * @param wrapMode the line wrapping mode
 */
- (void)setNaturalWrapMode:(GtkNaturalWrapMode)wrapMode;

/**
 * Makes text in the label selectable.
 * 
 * Selectable labels allow the user to select text from the label,
 * for copy-and-paste.
 *
 * @param setting %TRUE to allow selecting text in the label
 */
- (void)setSelectable:(bool)setting;

/**
 * Sets whether the label is in single line mode.
 *
 * @param singleLineMode %TRUE if the label should be in single line mode
 */
- (void)setSingleLineMode:(bool)singleLineMode;

/**
 * Sets the default tab stops for paragraphs in @self.
 *
 * @param tabs tabs as a `PangoTabArray`
 */
- (void)setTabs:(PangoTabArray*)tabs;

/**
 * Sets the text within the `GtkLabel` widget.
 * 
 * It overwrites any text that was there before.
 * 
 * This function will clear any previously set mnemonic accelerators,
 * and set the [property@Gtk.Label:use-underline property] to %FALSE as
 * a side effect.
 * 
 * This function will set the [property@Gtk.Label:use-markup] property
 * to %FALSE as a side effect.
 * 
 * See also: [method@Gtk.Label.set_markup]
 *
 * @param str The text you want to set
 */
- (void)setText:(OFString*)str;

/**
 * Sets the label’s text from the string @str.
 * 
 * If characters in @str are preceded by an underscore, they are underlined
 * indicating that they represent a keyboard accelerator called a mnemonic.
 * The mnemonic key can be used to activate another widget, chosen
 * automatically, or explicitly using [method@Gtk.Label.set_mnemonic_widget].
 *
 * @param str a string
 */
- (void)setTextWithMnemonic:(OFString*)str;

/**
 * Sets whether the text of the label contains markup.
 * 
 * See [method@Gtk.Label.set_markup].
 *
 * @param setting %TRUE if the label’s text should be parsed for markup.
 */
- (void)setUseMarkup:(bool)setting;

/**
 * Sets whether underlines in the text indicate mnemonics.
 *
 * @param setting %TRUE if underlines in the text indicate mnemonics
 */
- (void)setUseUnderline:(bool)setting;

/**
 * Sets the desired width in characters of @label to @n_chars.
 *
 * @param nchars the new desired width, in characters.
 */
- (void)setWidthChars:(int)nchars;

/**
 * Toggles line wrapping within the `GtkLabel` widget.
 * 
 * %TRUE makes it break lines if text exceeds the widget’s size.
 * %FALSE lets the text get cut off by the edge of the widget if
 * it exceeds the widget size.
 * 
 * Note that setting line wrapping to %TRUE does not make the label
 * wrap at its parent container’s width, because GTK widgets
 * conceptually can’t make their requisition depend on the parent
 * container’s size. For a label that wraps at a specific position,
 * set the label’s width using [method@Gtk.Widget.set_size_request].
 *
 * @param wrap the setting
 */
- (void)setWrap:(bool)wrap;

/**
 * Controls how line wrapping is done.
 * 
 * This only affects the label if line wrapping is on. (See
 * [method@Gtk.Label.set_wrap]) The default is %PANGO_WRAP_WORD
 * which means wrap on word boundaries.
 * 
 * For sizing behavior, also consider the [property@Gtk.Label:natural-wrap-mode]
 * property.
 *
 * @param wrapMode the line wrapping mode
 */
- (void)setWrapMode:(PangoWrapMode)wrapMode;

/**
 * Sets the `xalign` of the label.
 * 
 * See the [property@Gtk.Label:xalign] property.
 *
 * @param xalign the new xalign value, between 0 and 1
 */
- (void)setXalign:(float)xalign;

/**
 * Sets the `yalign` of the label.
 * 
 * See the [property@Gtk.Label:yalign] property.
 *
 * @param yalign the new yalign value, between 0 and 1
 */
- (void)setYalign:(float)yalign;

@end