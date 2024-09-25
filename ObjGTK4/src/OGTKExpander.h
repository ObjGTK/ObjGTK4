/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkExpander` allows the user to reveal its child by clicking
 * on an expander triangle.
 * 
 * ![An example GtkExpander](expander.png)
 * 
 * This is similar to the triangles used in a `GtkTreeView`.
 * 
 * Normally you use an expander as you would use a frame; you create
 * the child widget and use [method@Gtk.Expander.set_child] to add it
 * to the expander. When the expander is toggled, it will take care of
 * showing and hiding the child automatically.
 * 
 * # Special Usage
 * 
 * There are situations in which you may prefer to show and hide the
 * expanded widget yourself, such as when you want to actually create
 * the widget at expansion time. In this case, create a `GtkExpander`
 * but do not add a child to it. The expander widget has an
 * [property@Gtk.Expander:expanded] property which can be used to
 * monitor its expansion state. You should watch this property with
 * a signal connection as follows:
 * 
 * ```c
 * static void
 * expander_callback (GObject    *object,
 *                    GParamSpec *param_spec,
 *                    gpointer    user_data)
 * {
 *   GtkExpander *expander;
 * 
 *   expander = GTK_EXPANDER (object);
 * 
 *   if (gtk_expander_get_expanded (expander))
 *     {
 *       // Show or create widgets
 *     }
 *   else
 *     {
 *       // Hide or destroy widgets
 *     }
 * }
 * 
 * static void
 * create_expander (void)
 * {
 *   GtkWidget *expander = gtk_expander_new_with_mnemonic ("_More Options");
 *   g_signal_connect (expander, "notify::expanded",
 *                     G_CALLBACK (expander_callback), NULL);
 * 
 *   // ...
 * }
 * ```
 * 
 * # GtkExpander as GtkBuildable
 * 
 * The `GtkExpander` implementation of the `GtkBuildable` interface supports
 * placing a child in the label position by specifying “label” as the
 * “type” attribute of a `<child>` element. A normal content child can be
 * specified without specifying a `<child>` type attribute.
 * 
 * An example of a UI definition fragment with GtkExpander:
 * 
 * ```xml
 * <object class="GtkExpander">
 *   <child type="label">
 *     <object class="GtkLabel" id="expander-label"/>
 *   </child>
 *   <child>
 *     <object class="GtkEntry" id="expander-content"/>
 *   </child>
 * </object>
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * expander-widget
 * ╰── box
 *     ├── title
 *     │   ├── expander
 *     │   ╰── <label widget>
 *     ╰── <child>
 * ```
 * 
 * `GtkExpander` has a main node `expander-widget`, and subnode `box` containing
 * the title and child widget. The box subnode `title` contains node `expander`,
 * i.e. the expand/collapse arrow; then the label widget if any. The arrow of an
 * expander that is showing its child gets the `:checked` pseudoclass set on it.
 * 
 * # Accessibility
 * 
 * `GtkExpander` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
 *
 */
@interface OGTKExpander : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)label;
- (instancetype)initWithMnemonic:(OFString*)label;

/**
 * Methods
 */

- (GtkExpander*)castedGObject;

/**
 * Gets the child widget of @expander.
 *
 * @return the child widget of @expander
 */
- (OGTKWidget*)child;

/**
 * Queries a `GtkExpander` and returns its current state.
 * 
 * Returns %TRUE if the child widget is revealed.
 *
 * @return the current state of the expander
 */
- (bool)expanded;

/**
 * Fetches the text from a label widget.
 * 
 * This is including any embedded underlines indicating mnemonics and
 * Pango markup, as set by [method@Gtk.Expander.set_label]. If the label
 * text has not been set the return value will be %NULL. This will be the
 * case if you create an empty button with gtk_button_new() to use as a
 * container.
 *
 * @return The text of the label widget. This string is owned
 *   by the widget and must not be modified or freed.
 */
- (OFString*)label;

/**
 * Retrieves the label widget for the frame.
 *
 * @return the label widget
 */
- (OGTKWidget*)labelWidget;

/**
 * Returns whether the expander will resize the toplevel widget
 * containing the expander upon resizing and collapsing.
 *
 * @return the “resize toplevel” setting.
 */
- (bool)resizeToplevel;

/**
 * Returns whether the label’s text is interpreted as Pango markup.
 *
 * @return %TRUE if the label’s text will be parsed for markup
 */
- (bool)useMarkup;

/**
 * Returns whether an underline in the text indicates a mnemonic.
 *
 * @return %TRUE if an embedded underline in the expander
 *   label indicates the mnemonic accelerator keys
 */
- (bool)useUnderline;

/**
 * Sets the child widget of @expander.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets the state of the expander.
 * 
 * Set to %TRUE, if you want the child widget to be revealed,
 * and %FALSE if you want the child widget to be hidden.
 *
 * @param expanded whether the child widget is revealed
 */
- (void)setExpanded:(bool)expanded;

/**
 * Sets the text of the label of the expander to @label.
 * 
 * This will also clear any previously set labels.
 *
 * @param label a string
 */
- (void)setLabel:(OFString*)label;

/**
 * Set the label widget for the expander.
 * 
 * This is the widget that will appear embedded alongside
 * the expander arrow.
 *
 * @param labelWidget the new label widget
 */
- (void)setLabelWidget:(OGTKWidget*)labelWidget;

/**
 * Sets whether the expander will resize the toplevel widget
 * containing the expander upon resizing and collapsing.
 *
 * @param resizeToplevel whether to resize the toplevel
 */
- (void)setResizeToplevel:(bool)resizeToplevel;

/**
 * Sets whether the text of the label contains Pango markup.
 *
 * @param useMarkup %TRUE if the label’s text should be parsed for markup
 */
- (void)setUseMarkup:(bool)useMarkup;

/**
 * If true, an underline in the text indicates a mnemonic.
 *
 * @param useUnderline %TRUE if underlines in the text indicate mnemonics
 */
- (void)setUseUnderline:(bool)useUnderline;

@end