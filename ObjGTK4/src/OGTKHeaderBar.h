/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkHeaderBar` is a widget for creating custom title bars for windows.
 * 
 * ![An example GtkHeaderBar](headerbar.png)
 * 
 * `GtkHeaderBar` is similar to a horizontal `GtkCenterBox`. It allows
 * children to be placed at the start or the end. In addition, it allows
 * the window title to be displayed. The title will be centered with respect
 * to the width of the box, even if the children at either side take up
 * different amounts of space.
 * 
 * `GtkHeaderBar` can add typical window frame controls, such as minimize,
 * maximize and close buttons, or the window icon.
 * 
 * For these reasons, `GtkHeaderBar` is the natural choice for use as the
 * custom titlebar widget of a `GtkWindow` (see [method@Gtk.Window.set_titlebar]),
 * as it gives features typical of titlebars while allowing the addition of
 * child widgets.
 * 
 * ## GtkHeaderBar as GtkBuildable
 * 
 * The `GtkHeaderBar` implementation of the `GtkBuildable` interface supports
 * adding children at the start or end sides by specifying “start” or “end” as
 * the “type” attribute of a `<child>` element, or setting the title widget by
 * specifying “title” value.
 * 
 * By default the `GtkHeaderBar` uses a `GtkLabel` displaying the title of the
 * window it is contained in as the title widget, equivalent to the following
 * UI definition:
 * 
 * ```xml
 * <object class="GtkHeaderBar">
 *   <property name="title-widget">
 *     <object class="GtkLabel">
 *       <property name="label" translatable="yes">Label</property>
 *       <property name="single-line-mode">True</property>
 *       <property name="ellipsize">end</property>
 *       <property name="width-chars">5</property>
 *       <style>
 *         <class name="title"/>
 *       </style>
 *     </object>
 *   </property>
 * </object>
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * headerbar
 * ╰── windowhandle
 *     ╰── box
 *         ├── box.start
 *         │   ├── windowcontrols.start
 *         │   ╰── [other children]
 *         ├── [Title Widget]
 *         ╰── box.end
 *             ├── [other children]
 *             ╰── windowcontrols.end
 * ```
 * 
 * A `GtkHeaderBar`'s CSS node is called `headerbar`. It contains a `windowhandle`
 * subnode, which contains a `box` subnode, which contains two `box` subnodes at
 * the start and end of the header bar, as well as a center node that represents
 * the title.
 * 
 * Each of the boxes contains a `windowcontrols` subnode, see
 * [class@Gtk.WindowControls] for details, as well as other children.
 * 
 * # Accessibility
 * 
 * `GtkHeaderBar` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
 *
 */
@interface OGTKHeaderBar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkHeaderBar*)castedGObject;

/**
 * Gets the decoration layout of the `GtkHeaderBar`.
 *
 * @return the decoration layout
 */
- (OFString*)decorationLayout;

/**
 * Returns whether this header bar shows the standard window
 * title buttons.
 *
 * @return %TRUE if title buttons are shown
 */
- (bool)showTitleButtons;

/**
 * Retrieves the title widget of the header.
 * 
 * See [method@Gtk.HeaderBar.set_title_widget].
 *
 * @return the title widget of the header
 */
- (OGTKWidget*)titleWidget;

/**
 * Adds @child to @bar, packed with reference to the
 * end of the @bar.
 *
 * @param child the `GtkWidget` to be added to @bar
 */
- (void)packEnd:(OGTKWidget*)child;

/**
 * Adds @child to @bar, packed with reference to the
 * start of the @bar.
 *
 * @param child the `GtkWidget` to be added to @bar
 */
- (void)packStart:(OGTKWidget*)child;

/**
 * Removes a child from the `GtkHeaderBar`.
 * 
 * The child must have been added with
 * [method@Gtk.HeaderBar.pack_start],
 * [method@Gtk.HeaderBar.pack_end] or
 * [method@Gtk.HeaderBar.set_title_widget].
 *
 * @param child the child to remove
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Sets the decoration layout for this header bar.
 * 
 * This property overrides the
 * [property@Gtk.Settings:gtk-decoration-layout] setting.
 * 
 * There can be valid reasons for overriding the setting, such
 * as a header bar design that does not allow for buttons to take
 * room on the right, or only offers room for a single close button.
 * Split header bars are another example for overriding the setting.
 * 
 * The format of the string is button names, separated by commas.
 * A colon separates the buttons that should appear on the left
 * from those on the right. Recognized button names are minimize,
 * maximize, close and icon (the window icon).
 * 
 * For example, “icon:minimize,maximize,close” specifies an icon
 * on the left, and minimize, maximize and close buttons on the right.
 *
 * @param layout a decoration layout, or %NULL to unset the layout
 */
- (void)setDecorationLayout:(OFString*)layout;

/**
 * Sets whether this header bar shows the standard window
 * title buttons.
 *
 * @param setting %TRUE to show standard title buttons
 */
- (void)setShowTitleButtons:(bool)setting;

/**
 * Sets the title for the `GtkHeaderBar`.
 * 
 * When set to %NULL, the headerbar will display the title of
 * the window it is contained in.
 * 
 * The title should help a user identify the current view.
 * To achieve the same style as the builtin title, use the
 * “title” style class.
 * 
 * You should set the title widget to %NULL, for the window
 * title label to be visible again.
 *
 * @param titleWidget a widget to use for a title
 */
- (void)setTitleWidget:(OGTKWidget*)titleWidget;

@end