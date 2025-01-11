/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;
@class OGdkContentProvider;
@class OGTKEntryBuffer;
@class OGTKEntryCompletion;

/**
 * `GtkEntry` is a single line text entry widget.
 * 
 * ![An example GtkEntry](entry.png)
 * 
 * A fairly large set of key bindings are supported by default. If the
 * entered text is longer than the allocation of the widget, the widget
 * will scroll so that the cursor position is visible.
 * 
 * When using an entry for passwords and other sensitive information, it
 * can be put into “password mode” using [method@Gtk.Entry.set_visibility].
 * In this mode, entered text is displayed using a “invisible” character.
 * By default, GTK picks the best invisible character that is available
 * in the current font, but it can be changed with
 * [method@Gtk.Entry.set_invisible_char].
 * 
 * `GtkEntry` has the ability to display progress or activity
 * information behind the text. To make an entry display such information,
 * use [method@Gtk.Entry.set_progress_fraction] or
 * [method@Gtk.Entry.set_progress_pulse_step].
 * 
 * Additionally, `GtkEntry` can show icons at either side of the entry.
 * These icons can be activatable by clicking, can be set up as drag source
 * and can have tooltips. To add an icon, use
 * [method@Gtk.Entry.set_icon_from_gicon] or one of the various other functions
 * that set an icon from an icon name or a paintable. To trigger an action when
 * the user clicks an icon, connect to the [signal@Gtk.Entry::icon-press] signal.
 * To allow DND operations from an icon, use
 * [method@Gtk.Entry.set_icon_drag_source]. To set a tooltip on an icon, use
 * [method@Gtk.Entry.set_icon_tooltip_text] or the corresponding function
 * for markup.
 * 
 * Note that functionality or information that is only available by clicking
 * on an icon in an entry may not be accessible at all to users which are not
 * able to use a mouse or other pointing device. It is therefore recommended
 * that any such functionality should also be available by other means, e.g.
 * via the context menu of the entry.
 * 
 * # CSS nodes
 * 
 * ```
 * entry[.flat][.warning][.error]
 * ├── text[.readonly]
 * ├── image.left
 * ├── image.right
 * ╰── [progress[.pulse]]
 * ```
 * 
 * `GtkEntry` has a main node with the name entry. Depending on the properties
 * of the entry, the style classes .read-only and .flat may appear. The style
 * classes .warning and .error may also be used with entries.
 * 
 * When the entry shows icons, it adds subnodes with the name image and the
 * style class .left or .right, depending on where the icon appears.
 * 
 * When the entry shows progress, it adds a subnode with the name progress.
 * The node has the style class .pulse when the shown progress is pulsing.
 * 
 * For all the subnodes added to the text node in various situations,
 * see [class@Gtk.Text].
 * 
 * # GtkEntry as GtkBuildable
 * 
 * The `GtkEntry` implementation of the `GtkBuildable` interface supports a
 * custom `<attributes>` element, which supports any number of `<attribute>`
 * elements. The `<attribute>` element has attributes named “name“, “value“,
 * “start“ and “end“ and allows you to specify `PangoAttribute` values for
 * this label.
 * 
 * An example of a UI definition fragment specifying Pango attributes:
 * ```xml
 * <object class="GtkEntry">
 *   <attributes>
 *     <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
 *     <attribute name="background" value="red" start="5" end="10"/>
 *   </attributes>
 * </object>
 * ```
 * 
 * The start and end attributes specify the range of characters to which the
 * Pango attribute applies. If start and end are not specified, the attribute
 * is applied to the whole text. Note that specifying ranges does not make much
 * sense with translatable attributes. Use markup embedded in the translatable
 * content instead.
 * 
 * # Accessibility
 * 
 * `GtkEntry` uses the %GTK_ACCESSIBLE_ROLE_TEXT_BOX role.
 *
 */
@interface OGTKEntry : OGTKWidget
{

}


/**
 * Constructors
 */
+ (instancetype)entry;
+ (instancetype)entryWithBuffer:(OGTKEntryBuffer*)buffer;

/**
 * Methods
 */

- (GtkEntry*)castedGObject;

/**
 * Retrieves the value set by gtk_entry_set_activates_default().
 *
 * @return %TRUE if the entry will activate the default widget
 */
- (bool)activatesDefault;

/**
 * Gets the value set by gtk_entry_set_alignment().
 * 
 * See also: [property@Gtk.Editable:xalign]
 *
 * @return the alignment
 */
- (float)alignment;

/**
 * Gets the attribute list of the `GtkEntry`.
 * 
 * See [method@Gtk.Entry.set_attributes].
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
 * Returns the auxiliary completion object currently
 * in use by @entry.
 *
 * @return The auxiliary
 *   completion object currently in use by @entry
 */
- (OGTKEntryCompletion*)completion;

/**
 * Returns the index of the icon which is the source of the
 * current  DND operation, or -1.
 *
 * @return index of the icon which is the source of the
 *   current DND operation, or -1.
 */
- (int)currentIconDragSource;

/**
 * Gets the menu model set with gtk_entry_set_extra_menu().
 *
 * @return the menu model
 */
- (OGMenuModel*)extraMenu;

/**
 * Gets the value set by gtk_entry_set_has_frame().
 *
 * @return whether the entry has a beveled frame
 */
- (bool)hasFrame;

/**
 * Returns whether the icon is activatable.
 *
 * @param iconPos Icon position
 * @return %TRUE if the icon is activatable.
 */
- (bool)iconActivatable:(GtkEntryIconPosition)iconPos;

/**
 * Gets the area where entry’s icon at @icon_pos is drawn.
 * 
 * This function is useful when drawing something to the
 * entry in a draw callback.
 * 
 * If the entry is not realized or has no icon at the given
 * position, @icon_area is filled with zeros. Otherwise,
 * @icon_area will be filled with the icon's allocation,
 * relative to @entry's allocation.
 *
 * @param iconPos Icon position
 * @param iconArea Return location for the icon’s area
 */
- (void)iconAreaWithIconPos:(GtkEntryIconPosition)iconPos iconArea:(GdkRectangle*)iconArea;

/**
 * Finds the icon at the given position and return its index.
 * 
 * The position’s coordinates are relative to the @entry’s
 * top left corner. If @x, @y doesn’t lie inside an icon,
 * -1 is returned. This function is intended for use in a
 *  [signal@Gtk.Widget::query-tooltip] signal handler.
 *
 * @param x the x coordinate of the position to find, relative to @entry
 * @param y the y coordinate of the position to find, relative to @entry
 * @return the index of the icon at the given position, or -1
 */
- (int)iconAtPosWithX:(int)x y:(int)y;

/**
 * Retrieves the `GIcon` used for the icon.
 * 
 * %NULL will be returned if there is no icon or if the icon was
 * set by some other method (e.g., by `GdkPaintable` or icon name).
 *
 * @param iconPos Icon position
 * @return A `GIcon`
 */
- (GIcon*)iconGicon:(GtkEntryIconPosition)iconPos;

/**
 * Retrieves the icon name used for the icon.
 * 
 * %NULL is returned if there is no icon or if the icon was set
 * by some other method (e.g., by `GdkPaintable` or gicon).
 *
 * @param iconPos Icon position
 * @return An icon name
 */
- (OFString*)iconName:(GtkEntryIconPosition)iconPos;

/**
 * Retrieves the `GdkPaintable` used for the icon.
 * 
 * If no `GdkPaintable` was used for the icon, %NULL is returned.
 *
 * @param iconPos Icon position
 * @return A `GdkPaintable`
 *   if no icon is set for this position or the icon set is not
 *   a `GdkPaintable`.
 */
- (GdkPaintable*)iconPaintable:(GtkEntryIconPosition)iconPos;

/**
 * Returns whether the icon appears sensitive or insensitive.
 *
 * @param iconPos Icon position
 * @return %TRUE if the icon is sensitive.
 */
- (bool)iconSensitive:(GtkEntryIconPosition)iconPos;

/**
 * Gets the type of representation being used by the icon
 * to store image data.
 * 
 * If the icon has no image data, the return value will
 * be %GTK_IMAGE_EMPTY.
 *
 * @param iconPos Icon position
 * @return image representation being used
 */
- (GtkImageType)iconStorageType:(GtkEntryIconPosition)iconPos;

/**
 * Gets the contents of the tooltip on the icon at the specified
 * position in @entry.
 *
 * @param iconPos the icon position
 * @return the tooltip text
 */
- (char*)iconTooltipMarkup:(GtkEntryIconPosition)iconPos;

/**
 * Gets the contents of the tooltip on the icon at the specified
 * position in @entry.
 *
 * @param iconPos the icon position
 * @return the tooltip text
 */
- (char*)iconTooltipText:(GtkEntryIconPosition)iconPos;

/**
 * Gets the input hints of this `GtkEntry`.
 *
 * @return the input hints
 */
- (GtkInputHints)inputHints;

/**
 * Gets the input purpose of the `GtkEntry`.
 *
 * @return the input purpose
 */
- (GtkInputPurpose)inputPurpose;

/**
 * Retrieves the character displayed in place of the actual text
 * in “password mode”.
 *
 * @return the current invisible char, or 0, if the entry does not
 *   show invisible text at all.
 */
- (gunichar)invisibleChar;

/**
 * Retrieves the maximum allowed length of the text in @entry.
 * 
 * See [method@Gtk.Entry.set_max_length].
 *
 * @return the maximum allowed number of characters
 *   in `GtkEntry`, or 0 if there is no maximum.
 */
- (int)maxLength;

/**
 * Gets whether the `GtkEntry` is in overwrite mode.
 *
 * @return whether the text is overwritten when typing.
 */
- (bool)overwriteMode;

/**
 * Retrieves the text that will be displayed when @entry
 * is empty and unfocused
 *
 * @return a pointer to the
 *   placeholder text as a string. This string points to
 *   internally allocated storage in the widget and must
 *   not be freed, modified or stored. If no placeholder
 *   text has been set, %NULL will be returned.
 */
- (OFString*)placeholderText;

/**
 * Returns the current fraction of the task that’s been completed.
 * 
 * See [method@Gtk.Entry.set_progress_fraction].
 *
 * @return a fraction from 0.0 to 1.0
 */
- (double)progressFraction;

/**
 * Retrieves the pulse step set with
 * gtk_entry_set_progress_pulse_step().
 *
 * @return a fraction from 0.0 to 1.0
 */
- (double)progressPulseStep;

/**
 * Gets the tabstops of the `GtkEntry`.
 * 
 * See [method@Gtk.Entry.set_tabs].
 *
 * @return the tabstops
 */
- (PangoTabArray*)tabs;

/**
 * Retrieves the current length of the text in @entry.
 * 
 * This is equivalent to getting @entry's `GtkEntryBuffer`
 * and calling [method@Gtk.EntryBuffer.get_length] on it.
 *
 * @return the current number of characters
 *   in `GtkEntry`, or 0 if there are none.
 */
- (guint16)textLength;

/**
 * Retrieves whether the text in @entry is visible.
 * 
 * See [method@Gtk.Entry.set_visibility].
 *
 * @return %TRUE if the text is currently visible
 */
- (bool)visibility;

/**
 * Causes @entry to have keyboard focus.
 * 
 * It behaves like [method@Gtk.Widget.grab_focus], except that it doesn't
 * select the contents of the entry. You only want to call this on some
 * special entries which the user usually doesn't want to replace all text
 * in, such as search-as-you-type entries.
 *
 * @return %TRUE if focus is now inside @self
 */
- (bool)grabFocusWithoutSelecting;

/**
 * Indicates that some progress is made, but you don’t
 * know how much.
 * 
 * Causes the entry’s progress indicator to enter “activity
 * mode”, where a block bounces back and forth. Each call to
 * gtk_entry_progress_pulse() causes the block to move by a
 * little bit (the amount of movement per pulse is determined
 * by [method@Gtk.Entry.set_progress_pulse_step]).
 *
 */
- (void)progressPulse;

/**
 * Reset the input method context of the entry if needed.
 * 
 * This can be necessary in the case where modifying the buffer
 * would confuse on-going input method behavior.
 *
 */
- (void)resetImContext;

/**
 * Sets whether pressing Enter in the @entry will activate the default
 * widget for the window containing the entry.
 * 
 * This usually means that the dialog containing the entry will be closed,
 * since the default widget is usually one of the dialog buttons.
 *
 * @param setting %TRUE to activate window’s default widget on Enter keypress
 */
- (void)setActivatesDefault:(bool)setting;

/**
 * Sets the alignment for the contents of the entry.
 * 
 * This controls the horizontal positioning of the contents when
 * the displayed text is shorter than the width of the entry.
 * 
 * See also: [property@Gtk.Editable:xalign]
 *
 * @param xalign The horizontal alignment, from 0 (left) to 1 (right).
 *   Reversed for RTL layouts
 */
- (void)setAlignment:(float)xalign;

/**
 * Sets a `PangoAttrList`.
 * 
 * The attributes in the list are applied to the entry text.
 * 
 * Since the attributes will be applied to text that changes
 * as the user types, it makes most sense to use attributes
 * with unlimited extent.
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
 * Sets @completion to be the auxiliary completion object
 * to use with @entry.
 * 
 * All further configuration of the completion mechanism is
 * done on @completion using the `GtkEntryCompletion` API.
 * Completion is disabled if @completion is set to %NULL.
 *
 * @param completion The `GtkEntryCompletion`
 */
- (void)setCompletion:(OGTKEntryCompletion*)completion;

/**
 * Sets a menu model to add when constructing
 * the context menu for @entry.
 *
 * @param model a `GMenuModel`
 */
- (void)setExtraMenu:(OGMenuModel*)model;

/**
 * Sets whether the entry has a beveled frame around it.
 *
 * @param setting new value
 */
- (void)setHasFrame:(bool)setting;

/**
 * Sets whether the icon is activatable.
 *
 * @param iconPos Icon position
 * @param activatable %TRUE if the icon should be activatable
 */
- (void)setIconActivatableWithIconPos:(GtkEntryIconPosition)iconPos activatable:(bool)activatable;

/**
 * Sets up the icon at the given position as drag source.
 * 
 * This makes it so that GTK will start a drag
 * operation when the user clicks and drags the icon.
 *
 * @param iconPos icon position
 * @param provider a `GdkContentProvider`
 * @param actions a bitmask of the allowed drag actions
 */
- (void)setIconDragSourceWithIconPos:(GtkEntryIconPosition)iconPos provider:(OGdkContentProvider*)provider actions:(GdkDragAction)actions;

/**
 * Sets the icon shown in the entry at the specified position
 * from the current icon theme.
 * 
 * If the icon isn’t known, a “broken image” icon will be
 * displayed instead.
 * 
 * If @icon is %NULL, no icon will be shown in the
 * specified position.
 *
 * @param iconPos The position at which to set the icon
 * @param icon The icon to set
 */
- (void)setIconFromGiconWithIconPos:(GtkEntryIconPosition)iconPos icon:(GIcon*)icon;

/**
 * Sets the icon shown in the entry at the specified position
 * from the current icon theme.
 * 
 * If the icon name isn’t known, a “broken image” icon will be
 * displayed instead.
 * 
 * If @icon_name is %NULL, no icon will be shown in the
 * specified position.
 *
 * @param iconPos The position at which to set the icon
 * @param iconName An icon name
 */
- (void)setIconFromIconNameWithIconPos:(GtkEntryIconPosition)iconPos iconName:(OFString*)iconName;

/**
 * Sets the icon shown in the specified position using a `GdkPaintable`.
 * 
 * If @paintable is %NULL, no icon will be shown in the specified position.
 *
 * @param iconPos Icon position
 * @param paintable A `GdkPaintable`
 */
- (void)setIconFromPaintableWithIconPos:(GtkEntryIconPosition)iconPos paintable:(GdkPaintable*)paintable;

/**
 * Sets the sensitivity for the specified icon.
 *
 * @param iconPos Icon position
 * @param sensitive Specifies whether the icon should appear
 *   sensitive or insensitive
 */
- (void)setIconSensitiveWithIconPos:(GtkEntryIconPosition)iconPos sensitive:(bool)sensitive;

/**
 * Sets @tooltip as the contents of the tooltip for the icon at
 * the specified position.
 * 
 * @tooltip is assumed to be marked up with Pango Markup.
 * 
 * Use %NULL for @tooltip to remove an existing tooltip.
 * 
 * See also [method@Gtk.Widget.set_tooltip_markup] and
 * [method@Gtk.Entry.set_icon_tooltip_text].
 *
 * @param iconPos the icon position
 * @param tooltip the contents of the tooltip for the icon
 */
- (void)setIconTooltipMarkupWithIconPos:(GtkEntryIconPosition)iconPos tooltip:(OFString*)tooltip;

/**
 * Sets @tooltip as the contents of the tooltip for the icon
 * at the specified position.
 * 
 * Use %NULL for @tooltip to remove an existing tooltip.
 * 
 * See also [method@Gtk.Widget.set_tooltip_text] and
 * [method@Gtk.Entry.set_icon_tooltip_markup].
 * 
 * If you unset the widget tooltip via
 * [method@Gtk.Widget.set_tooltip_text] or
 * [method@Gtk.Widget.set_tooltip_markup], this sets
 * [property@Gtk.Widget:has-tooltip] to %FALSE, which suppresses
 * icon tooltips too. You can resolve this by then calling
 * [method@Gtk.Widget.set_has_tooltip] to set
 * [property@Gtk.Widget:has-tooltip] back to %TRUE, or
 * setting at least one non-empty tooltip on any icon
 * achieves the same result.
 *
 * @param iconPos the icon position
 * @param tooltip the contents of the tooltip for the icon
 */
- (void)setIconTooltipTextWithIconPos:(GtkEntryIconPosition)iconPos tooltip:(OFString*)tooltip;

/**
 * Set additional hints which allow input methods to
 * fine-tune their behavior.
 *
 * @param hints the hints
 */
- (void)setInputHints:(GtkInputHints)hints;

/**
 * Sets the input purpose which can be used by input methods
 * to adjust their behavior.
 *
 * @param purpose the purpose
 */
- (void)setInputPurpose:(GtkInputPurpose)purpose;

/**
 * Sets the character to use in place of the actual text
 * in “password mode”.
 * 
 * See [method@Gtk.Entry.set_visibility] for how to enable
 * “password mode”.
 * 
 * By default, GTK picks the best invisible char available in
 * the current font. If you set the invisible char to 0, then
 * the user will get no feedback at all; there will be no text
 * on the screen as they type.
 *
 * @param ch a Unicode character
 */
- (void)setInvisibleChar:(gunichar)ch;

/**
 * Sets the maximum allowed length of the contents of the widget.
 * 
 * If the current contents are longer than the given length, then
 * they will be truncated to fit. The length is in characters.
 * 
 * This is equivalent to getting @entry's `GtkEntryBuffer` and
 * calling [method@Gtk.EntryBuffer.set_max_length] on it.
 *
 * @param max the maximum length of the entry, or 0 for no maximum.
 *   (other than the maximum length of entries.) The value passed in will
 *   be clamped to the range 0-65536.
 */
- (void)setMaxLength:(int)max;

/**
 * Sets whether the text is overwritten when typing in the `GtkEntry`.
 *
 * @param overwrite new value
 */
- (void)setOverwriteMode:(bool)overwrite;

/**
 * Sets text to be displayed in @entry when it is empty.
 * 
 * This can be used to give a visual hint of the expected
 * contents of the `GtkEntry`.
 *
 * @param text a string to be displayed when @entry is empty and unfocused
 */
- (void)setPlaceholderText:(OFString*)text;

/**
 * Causes the entry’s progress indicator to “fill in” the given
 * fraction of the bar.
 * 
 * The fraction should be between 0.0 and 1.0, inclusive.
 *
 * @param fraction fraction of the task that’s been completed
 */
- (void)setProgressFraction:(double)fraction;

/**
 * Sets the fraction of total entry width to move the progress
 * bouncing block for each pulse.
 * 
 * Use [method@Gtk.Entry.progress_pulse] to pulse
 * the progress.
 *
 * @param fraction fraction between 0.0 and 1.0
 */
- (void)setProgressPulseStep:(double)fraction;

/**
 * Sets a `PangoTabArray`.
 * 
 * The tabstops in the array are applied to the entry text.
 *
 * @param tabs a `PangoTabArray`
 */
- (void)setTabs:(PangoTabArray*)tabs;

/**
 * Sets whether the contents of the entry are visible or not.
 * 
 * When visibility is set to %FALSE, characters are displayed
 * as the invisible char, and will also appear that way when
 * the text in the entry widget is copied elsewhere.
 * 
 * By default, GTK picks the best invisible character available
 * in the current font, but it can be changed with
 * [method@Gtk.Entry.set_invisible_char].
 * 
 * Note that you probably want to set [property@Gtk.Entry:input-purpose]
 * to %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to
 * inform input methods about the purpose of this entry,
 * in addition to setting visibility to %FALSE.
 *
 * @param visible %TRUE if the contents of the entry are displayed as plaintext
 */
- (void)setVisibility:(bool)visible;

/**
 * Unsets the invisible char, so that the default invisible char
 * is used again. See [method@Gtk.Entry.set_invisible_char].
 *
 */
- (void)unsetInvisibleChar;

@end