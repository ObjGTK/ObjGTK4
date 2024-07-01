/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkWindowControls` shows window frame controls.
 * 
 * Typical window frame controls are minimize, maximize and close buttons,
 * and the window icon.
 * 
 * ![An example GtkWindowControls](windowcontrols.png)
 * 
 * `GtkWindowControls` only displays start or end side of the controls (see
 * [property@Gtk.WindowControls:side]), so it's intended to be always used
 * in pair with another `GtkWindowControls` for the opposite side, for example:
 * 
 * ```xml
 * <object class="GtkBox">
 *   <child>
 *     <object class="GtkWindowControls">
 *       <property name="side">start</property>
 *     </object>
 *   </child>
 * 
 *   ...
 * 
 *   <child>
 *     <object class="GtkWindowControls">
 *       <property name="side">end</property>
 *     </object>
 *   </child>
 * </object>
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * windowcontrols
 * ├── [image.icon]
 * ├── [button.minimize]
 * ├── [button.maximize]
 * ╰── [button.close]
 * ```
 * 
 * A `GtkWindowControls`' CSS node is called windowcontrols. It contains
 * subnodes corresponding to each title button. Which of the title buttons
 * exist and where they are placed exactly depends on the desktop environment
 * and [property@Gtk.WindowControls:decoration-layout] value.
 * 
 * When [property@Gtk.WindowControls:empty] is %TRUE, it gets the .empty
 * style class.
 * 
 * # Accessibility
 * 
 * `GtkWindowControls` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
 *
 */
@interface OGTKWindowControls : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkPackType)side;

/**
 * Methods
 */

- (GtkWindowControls*)castedGObject;

/**
 * Gets the decoration layout of this `GtkWindowControls`.
 *
 * @return the decoration layout or %NULL if it is unset
 */
- (OFString*)decorationLayout;

/**
 * Gets whether the widget has any window buttons.
 *
 * @return %TRUE if the widget has window buttons, otherwise %FALSE
 */
- (bool)empty;

/**
 * Gets the side to which this `GtkWindowControls` instance belongs.
 *
 * @return the side
 */
- (GtkPackType)side;

/**
 * Sets the decoration layout for the title buttons.
 * 
 * This overrides the [property@Gtk.Settings:gtk-decoration-layout]
 * setting.
 * 
 * The format of the string is button names, separated by commas.
 * A colon separates the buttons that should appear on the left
 * from those on the right. Recognized button names are minimize,
 * maximize, close and icon (the window icon).
 * 
 * For example, “icon:minimize,maximize,close” specifies a icon
 * on the left, and minimize, maximize and close buttons on the right.
 * 
 * If [property@Gtk.WindowControls:side] value is @GTK_PACK_START, @self
 * will display the part before the colon, otherwise after that.
 *
 * @param layout a decoration layout, or %NULL to unset the layout
 */
- (void)setDecorationLayout:(OFString*)layout;

/**
 * Determines which part of decoration layout the `GtkWindowControls` uses.
 * 
 * See [property@Gtk.WindowControls:decoration-layout].
 *
 * @param side a side
 */
- (void)setSide:(GtkPackType)side;

@end