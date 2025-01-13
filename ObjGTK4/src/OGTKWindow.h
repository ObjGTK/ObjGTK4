/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGdkDisplay;
@class OGdkMonitor;
@class OGTKApplication;
@class OGTKWindowGroup;

/**
 * A `GtkWindow` is a toplevel window which can contain other widgets.
 * 
 * ![An example GtkWindow](window.png)
 * 
 * Windows normally have decorations that are under the control
 * of the windowing system and allow the user to manipulate the window
 * (resize it, move it, close it,...).
 * 
 * # GtkWindow as GtkBuildable
 * 
 * The `GtkWindow` implementation of the [iface@Gtk.Buildable] interface supports
 * setting a child as the titlebar by specifying “titlebar” as the “type”
 * attribute of a `<child>` element.
 * 
 * # CSS nodes
 * 
 * ```
 * window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
 * ├── <child>
 * ╰── <titlebar child>.titlebar [.default-decoration]
 * ```
 * 
 * `GtkWindow` has a main CSS node with name window and style class .background.
 * 
 * Style classes that are typically used with the main CSS node are .csd (when
 * client-side decorations are in use), .solid-csd (for client-side decorations
 * without invisible borders), .ssd (used by mutter when rendering server-side
 * decorations). GtkWindow also represents window states with the following
 * style classes on the main node: .maximized, .fullscreen, .tiled (when supported,
 * also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).
 * 
 * `GtkWindow` subclasses often add their own discriminating style classes,
 * such as .dialog, .popup or .tooltip.
 * 
 * Generally, some CSS properties don't make sense on the toplevel window node,
 * such as margins or padding. When client-side decorations without invisible
 * borders are in use (i.e. the .solid-csd style class is added to the
 * main window node), the CSS border of the toplevel window is used for
 * resize drags. In the .csd case, the shadow area outside of the window
 * can be used to resize it.
 * 
 * `GtkWindow` adds the .titlebar and .default-decoration style classes to the
 * widget that is added as a titlebar child.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkWindow` used the `GTK_ACCESSIBLE_ROLE_WINDOW` role.
 * 
 * Since GTK 4.12, `GtkWindow` uses the `GTK_ACCESSIBLE_ROLE_APPLICATION` role.
 * 
 * # Actions
 * 
 * `GtkWindow` defines a set of built-in actions:
 * - `default.activate`: Activate the default widget.
 * - `window.minimize`: Minimize the window.
 * - `window.toggle-maximized`: Maximize or restore the window.
 * - `window.close`: Close the window.
 *
 */
@interface OGTKWindow : OGTKWidget
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Returns the fallback icon name for windows.
 * 
 * The returned string is owned by GTK and should not
 * be modified. It is only valid until the next call to
 * [func@Gtk.Window.set_default_icon_name].
 *
 * @return the fallback icon name for windows
 */
+ (OFString*)defaultIconName;

/**
 * Returns a list of all existing toplevel windows.
 * 
 * If you want to iterate through the list and perform actions involving
 * callbacks that might destroy the widgets or add new ones, be aware that
 * the list of toplevels will change and emit the "items-changed" signal.
 *
 * @return the list
 *   of toplevel widgets
 */
+ (GListModel*)toplevels;

/**
 * Returns a list of all existing toplevel windows.
 * 
 * The widgets in the list are not individually referenced.
 * If you want to iterate through the list and perform actions
 * involving callbacks that might destroy the widgets, you must
 * call `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first,
 * and then unref all the widgets afterwards.
 *
 * @return list of
 *   toplevel widgets
 */
+ (GList*)listToplevels;

/**
 * Sets whether the window should request startup notification.
 * 
 * By default, after showing the first `GtkWindow`, GTK calls
 * [method@Gdk.Toplevel.set_startup_id]. Call this function
 * to disable the automatic startup notification. You might do this
 * if your first window is a splash screen, and you want to delay
 * notification until after your real main window has been shown,
 * for example.
 * 
 * In that example, you would disable startup notification
 * temporarily, show your splash screen, then re-enable it so that
 * showing the main window would automatically result in notification.
 *
 * @param setting %TRUE to automatically do startup notification
 */
+ (void)setAutoStartupNotificationWithSetting:(bool)setting;

/**
 * Sets an icon to be used as fallback.
 * 
 * The fallback icon is used for windows that
 * haven't had [method@Gtk.Window.set_icon_name]
 * called on them.
 *
 * @param name the name of the themed icon
 */
+ (void)setDefaultIconName:(OFString*)name;

/**
 * Opens or closes the [interactive debugger](running.html#interactive-debugging).
 * 
 * The debugger offers access to the widget hierarchy of the application
 * and to useful debugging tools.
 *
 * @param enable %TRUE to enable interactive debugging
 */
+ (void)setInteractiveDebuggingWithEnable:(bool)enable;

/**
 * Constructors
 */
+ (instancetype)window;

/**
 * Methods
 */

- (GtkWindow*)castedGObject;

/**
 * Requests that the window is closed.
 * 
 * This is similar to what happens when a window manager
 * close button is clicked.
 * 
 * This function can be used with close buttons in custom
 * titlebars.
 *
 */
- (void)close;

/**
 * Drop the internal reference GTK holds on toplevel windows.
 *
 */
- (void)destroy;

/**
 * Asks to place @window in the fullscreen state.
 * 
 * Note that you shouldn’t assume the window is definitely fullscreen
 * afterward, because other entities (e.g. the user or window manager)
 * unfullscreen it again, and not all window managers honor requests
 * to fullscreen windows.
 * 
 * You can track the result of this operation via the
 * [property@Gdk.Toplevel:state] property, or by listening to
 * notifications of the [property@Gtk.Window:fullscreened] property.
 *
 */
- (void)fullscreen;

/**
 * Asks to place @window in the fullscreen state on the given @monitor.
 * 
 * Note that you shouldn't assume the window is definitely fullscreen
 * afterward, or that the windowing system allows fullscreen windows on
 * any given monitor.
 * 
 * You can track the result of this operation via the
 * [property@Gdk.Toplevel:state] property, or by listening to
 * notifications of the [property@Gtk.Window:fullscreened] property.
 *
 * @param monitor which monitor to go fullscreen on
 */
- (void)fullscreenOnMonitor:(OGdkMonitor*)monitor;

/**
 * Gets the `GtkApplication` associated with the window.
 *
 * @return a `GtkApplication`
 */
- (OGTKApplication*)application;

/**
 * Gets the child widget of @window.
 *
 * @return the child widget of @window
 */
- (OGTKWidget*)child;

/**
 * Returns whether the window has been set to have decorations.
 *
 * @return %TRUE if the window has been set to have decorations
 */
- (bool)decorated;

/**
 * Gets the default size of the window.
 * 
 * A value of 0 for the width or height indicates that a default
 * size has not been explicitly set for that dimension, so the
 * “natural” size of the window will be used.
 * 
 * This function is the recommended way for [saving window state
 * across restarts of applications](https://developer.gnome.org/documentation/tutorials/save-state.html).
 *
 * @param width location to store the default width
 * @param height location to store the default height
 */
- (void)defaultSizeWithWidth:(int*)width height:(int*)height;

/**
 * Returns the default widget for @window.
 *
 * @return the default widget
 */
- (OGTKWidget*)defaultWidget;

/**
 * Returns whether the window has been set to have a close button.
 *
 * @return %TRUE if the window has been set to have a close button
 */
- (bool)deletable;

/**
 * Returns whether the window will be destroyed with its transient parent.
 *
 * @return %TRUE if the window will be destroyed with its transient parent.
 */
- (bool)destroyWithParent;

/**
 * Retrieves the current focused widget within the window.
 * 
 * Note that this is the widget that would have the focus
 * if the toplevel window focused; if the toplevel window
 * is not focused then `gtk_widget_has_focus (widget)` will
 * not be %TRUE for the widget.
 *
 * @return the currently focused widget
 */
- (OGTKWidget*)focus;

/**
 * Gets whether “focus rectangles” are supposed to be visible.
 *
 * @return %TRUE if “focus rectangles” are supposed to be visible
 *   in this window.
 */
- (bool)focusVisible;

/**
 * Returns the group for @window.
 * 
 * If the window has no group, then the default group is returned.
 *
 * @return the `GtkWindowGroup` for a window
 *   or the default group
 */
- (OGTKWindowGroup*)group;

/**
 * Returns whether this window reacts to F10 key presses by
 * activating a menubar it contains.
 *
 * @return %TRUE if the window handles F10
 */
- (bool)handleMenubarAccel;

/**
 * Returns whether the window will be hidden when the close button is clicked.
 *
 * @return %TRUE if the window will be hidden
 */
- (bool)hideOnClose;

/**
 * Returns the name of the themed icon for the window.
 *
 * @return the icon name
 */
- (OFString*)iconName;

/**
 * Gets whether mnemonics are supposed to be visible.
 *
 * @return %TRUE if mnemonics are supposed to be visible
 *   in this window.
 */
- (bool)mnemonicsVisible;

/**
 * Returns whether the window is modal.
 *
 * @return %TRUE if the window is set to be modal and
 *   establishes a grab when shown
 */
- (bool)modal;

/**
 * Gets the value set by gtk_window_set_resizable().
 *
 * @return %TRUE if the user can resize the window
 */
- (bool)resizable;

/**
 * Retrieves the title of the window.
 *
 * @return the title of the window
 */
- (OFString*)title;

/**
 * Returns the custom titlebar that has been set with
 * gtk_window_set_titlebar().
 *
 * @return the custom titlebar
 */
- (OGTKWidget*)titlebar;

/**
 * Fetches the transient parent for this window.
 *
 * @return the transient parent for this window
 */
- (OGTKWindow*)transientFor;

/**
 * Returns whether @window has an explicit window group.
 *
 * @return %TRUE if @window has an explicit window group.
 */
- (bool)hasGroup;

/**
 * Returns whether the window is part of the current active toplevel.
 * 
 * The active toplevel is the window receiving keystrokes.
 * 
 * The return value is %TRUE if the window is active toplevel itself.
 * You might use this function if you wanted to draw a widget
 * differently in an active window from a widget in an inactive window.
 *
 * @return %TRUE if the window part of the current active window.
 */
- (bool)isActive;

/**
 * Retrieves the current fullscreen state of @window.
 * 
 * Note that since fullscreening is ultimately handled by the window
 * manager and happens asynchronously to an application request, you
 * shouldn’t assume the return value of this function changing
 * immediately (or at all), as an effect of calling
 * [method@Gtk.Window.fullscreen] or [method@Gtk.Window.unfullscreen].
 * 
 * If the window isn't yet mapped, the value returned will whether the
 * initial requested state is fullscreen.
 *
 * @return whether the window has a fullscreen state.
 */
- (bool)isFullscreen;

/**
 * Retrieves the current maximized state of @window.
 * 
 * Note that since maximization is ultimately handled by the window
 * manager and happens asynchronously to an application request, you
 * shouldn’t assume the return value of this function changing
 * immediately (or at all), as an effect of calling
 * [method@Gtk.Window.maximize] or [method@Gtk.Window.unmaximize].
 * 
 * If the window isn't yet mapped, the value returned will whether the
 * initial requested state is maximized.
 *
 * @return whether the window has a maximized state.
 */
- (bool)isMaximized;

/**
 * Retrieves the current suspended state of @window.
 * 
 * A window being suspended means it's currently not visible to the user, for
 * example by being on a inactive workspace, minimized, obstructed.
 *
 * @return whether the window is suspended.
 */
- (bool)isSuspended;

/**
 * Asks to maximize @window, so that it fills the screen.
 * 
 * Note that you shouldn’t assume the window is definitely maximized
 * afterward, because other entities (e.g. the user or window manager)
 * could unmaximize it again, and not all window managers support
 * maximization.
 * 
 * It’s permitted to call this function before showing a window,
 * in which case the window will be maximized when it appears onscreen
 * initially.
 * 
 * You can track the result of this operation via the
 * [property@Gdk.Toplevel:state] property, or by listening to
 * notifications on the [property@Gtk.Window:maximized]
 * property.
 *
 */
- (void)maximize;

/**
 * Asks to minimize the specified @window.
 * 
 * Note that you shouldn’t assume the window is definitely minimized
 * afterward, because the windowing system might not support this
 * functionality; other entities (e.g. the user or the window manager)
 * could unminimize it again, or there may not be a window manager in
 * which case minimization isn’t possible, etc.
 * 
 * It’s permitted to call this function before showing a window,
 * in which case the window will be minimized before it ever appears
 * onscreen.
 * 
 * You can track result of this operation via the
 * [property@Gdk.Toplevel:state] property.
 *
 */
- (void)minimize;

/**
 * Presents a window to the user.
 * 
 * This may mean raising the window in the stacking order,
 * unminimizing it, moving it to the current desktop and/or
 * giving it the keyboard focus (possibly dependent on the user’s
 * platform, window manager and preferences).
 * 
 * If @window is hidden, this function also makes it visible.
 *
 */
- (void)present;

/**
 * Presents a window to the user in response to an user interaction.
 * 
 * See [method@Gtk.Window.present] for more details.
 * 
 * The timestamp should be gathered when the window was requested
 * to be shown (when clicking a link for example), rather than once
 * the window is ready to be shown.
 *
 * @param timestamp the timestamp of the user interaction (typically a
 *   button or key press event) which triggered this call
 */
- (void)presentWithTimeWithTimestamp:(guint32)timestamp;

/**
 * Sets or unsets the `GtkApplication` associated with the window.
 * 
 * The application will be kept alive for at least as long as it has
 * any windows associated with it (see g_application_hold() for a way
 * to keep it alive without windows).
 * 
 * Normally, the connection between the application and the window will
 * remain until the window is destroyed, but you can explicitly remove
 * it by setting the @application to %NULL.
 * 
 * This is equivalent to calling [method@Gtk.Application.remove_window]
 * and/or [method@Gtk.Application.add_window] on the old/new applications
 * as relevant.
 *
 * @param application a `GtkApplication`, or %NULL to unset
 */
- (void)setApplication:(OGTKApplication*)application;

/**
 * Sets the child widget of @window.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets whether the window should be decorated.
 * 
 * By default, windows are decorated with a title bar, resize
 * controls, etc. Some window managers allow GTK to disable these
 * decorations, creating a borderless window. If you set the decorated
 * property to %FALSE using this function, GTK will do its best to
 * convince the window manager not to decorate the window. Depending on
 * the system, this function may not have any effect when called on a
 * window that is already visible, so you should call it before calling
 * [method@Gtk.Widget.show].
 * 
 * On Windows, this function always works, since there’s no window manager
 * policy involved.
 *
 * @param setting %TRUE to decorate the window
 */
- (void)setDecoratedWithSetting:(bool)setting;

/**
 * Sets the default size of a window.
 * 
 * The default size of a window is the size that will be used if no other constraints apply.
 * 
 * The default size will be updated whenever the window is resized
 * to reflect the new size, unless the window is forced to a size,
 * like when it is maximized or fullscreened.
 * 
 * If the window’s minimum size request is larger than
 * the default, the default will be ignored.
 * 
 * Setting the default size to a value <= 0 will cause it to be
 * ignored and the natural size request will be used instead. It
 * is possible to do this while the window is showing to "reset"
 * it to its initial size.
 * 
 * Unlike [method@Gtk.Widget.set_size_request], which sets a size
 * request for a widget and thus would keep users from shrinking
 * the window, this function only sets the initial size, just as
 * if the user had resized the window themselves. Users can still
 * shrink the window again as they normally would. Setting a default
 * size of -1 means to use the “natural” default size (the size request
 * of the window).
 * 
 * If you use this function to reestablish a previously saved window size,
 * note that the appropriate size to save is the one returned by
 * [method@Gtk.Window.get_default_size]. Using the window allocation
 * directly will not work in all circumstances and can lead to growing
 * or shrinking windows.
 *
 * @param width width in pixels, or -1 to unset the default width
 * @param height height in pixels, or -1 to unset the default height
 */
- (void)setDefaultSizeWithWidth:(int)width height:(int)height;

/**
 * Sets the default widget.
 * 
 * The default widget is the widget that is activated when the user
 * presses Enter in a dialog (for example).
 *
 * @param defaultWidget widget to be the default
 *   to unset the default widget for the toplevel
 */
- (void)setDefaultWidget:(OGTKWidget*)defaultWidget;

/**
 * Sets whether the window should be deletable.
 * 
 * By default, windows have a close button in the window frame.
 * Some  window managers allow GTK to disable this button. If you
 * set the deletable property to %FALSE using this function, GTK
 * will do its best to convince the window manager not to show a
 * close button. Depending on the system, this function may not
 * have any effect when called on a window that is already visible,
 * so you should call it before calling [method@Gtk.Widget.show].
 * 
 * On Windows, this function always works, since there’s no window
 * manager policy involved.
 *
 * @param setting %TRUE to decorate the window as deletable
 */
- (void)setDeletableWithSetting:(bool)setting;

/**
 * If @setting is %TRUE, then destroying the transient parent of @window
 * will also destroy @window itself.
 * 
 * This is useful for dialogs that shouldn’t persist beyond the lifetime
 * of the main window they are associated with, for example.
 *
 * @param setting whether to destroy @window with its transient parent
 */
- (void)setDestroyWithParentWithSetting:(bool)setting;

/**
 * Sets the `GdkDisplay` where the @window is displayed.
 * 
 * If the window is already mapped, it will be unmapped,
 * and then remapped on the new display.
 *
 * @param display a `GdkDisplay`
 */
- (void)setDisplay:(OGdkDisplay*)display;

/**
 * Sets the focus widget.
 * 
 * If @focus is not the current focus widget, and is focusable,
 * sets it as the focus widget for the window. If @focus is %NULL,
 * unsets the focus widget for this window. To set the focus to a
 * particular widget in the toplevel, it is usually more convenient
 * to use [method@Gtk.Widget.grab_focus] instead of this function.
 *
 * @param focus widget to be the new focus widget, or %NULL to unset
 *   any focus widget for the toplevel window.
 */
- (void)setFocus:(OGTKWidget*)focus;

/**
 * Sets whether “focus rectangles” are supposed to be visible.
 * 
 * This property is maintained by GTK based on user input,
 * and should not be set by applications.
 *
 * @param setting the new value
 */
- (void)setFocusVisibleWithSetting:(bool)setting;

/**
 * Sets whether this window should react to F10 key presses
 * by activating a menubar it contains.
 *
 * @param handleMenubarAccel %TRUE to make @window handle F10
 */
- (void)setHandleMenubarAccel:(bool)handleMenubarAccel;

/**
 * If @setting is %TRUE, then clicking the close button on the window
 * will not destroy it, but only hide it.
 *
 * @param setting whether to hide the window when it is closed
 */
- (void)setHideOnCloseWithSetting:(bool)setting;

/**
 * Sets the icon for the window from a named themed icon.
 * 
 * See the docs for [class@Gtk.IconTheme] for more details.
 * On some platforms, the window icon is not used at all.
 * 
 * Note that this has nothing to do with the WM_ICON_NAME
 * property which is mentioned in the ICCCM.
 *
 * @param name the name of the themed icon
 */
- (void)setIconName:(OFString*)name;

/**
 * Sets whether mnemonics are supposed to be visible.
 * 
 * This property is maintained by GTK based on user input,
 * and should not be set by applications.
 *
 * @param setting the new value
 */
- (void)setMnemonicsVisibleWithSetting:(bool)setting;

/**
 * Sets a window modal or non-modal.
 * 
 * Modal windows prevent interaction with other windows in the same
 * application. To keep modal dialogs on top of main application windows,
 * use [method@Gtk.Window.set_transient_for] to make the dialog transient
 * for the parent; most window managers will then disallow lowering the
 * dialog below the parent.
 *
 * @param modal whether the window is modal
 */
- (void)setModal:(bool)modal;

/**
 * Sets whether the user can resize a window.
 * 
 * Windows are user resizable by default.
 *
 * @param resizable %TRUE if the user can resize this window
 */
- (void)setResizable:(bool)resizable;

/**
 * Sets the startup notification ID.
 * 
 * Startup notification identifiers are used by desktop environment
 * to track application startup, to provide user feedback and other
 * features. This function changes the corresponding property on the
 * underlying `GdkSurface`.
 * 
 * Normally, startup identifier is managed automatically and you should
 * only use this function in special cases like transferring focus from
 * other processes. You should use this function before calling
 * [method@Gtk.Window.present] or any equivalent function generating
 * a window map event.
 * 
 * This function is only useful on X11, not with other GTK targets.
 *
 * @param startupId a string with startup-notification identifier
 */
- (void)setStartupId:(OFString*)startupId;

/**
 * Sets the title of the `GtkWindow`.
 * 
 * The title of a window will be displayed in its title bar; on the
 * X Window System, the title bar is rendered by the window manager
 * so exactly how the title appears to users may vary according to a
 * user’s exact configuration. The title should help a user distinguish
 * this window from other windows they may have open. A good title might
 * include the application name and current document filename, for example.
 * 
 * Passing %NULL does the same as setting the title to an empty string.
 *
 * @param title title of the window
 */
- (void)setTitle:(OFString*)title;

/**
 * Sets a custom titlebar for @window.
 * 
 * A typical widget used here is [class@Gtk.HeaderBar], as it
 * provides various features expected of a titlebar while allowing
 * the addition of child widgets to it.
 * 
 * If you set a custom titlebar, GTK will do its best to convince
 * the window manager not to put its own titlebar on the window.
 * Depending on the system, this function may not work for a window
 * that is already visible, so you set the titlebar before calling
 * [method@Gtk.Widget.show].
 *
 * @param titlebar the widget to use as titlebar
 */
- (void)setTitlebar:(OGTKWidget*)titlebar;

/**
 * Dialog windows should be set transient for the main application
 * window they were spawned from. This allows window managers to e.g.
 * keep the dialog on top of the main window, or center the dialog
 * over the main window. [ctor@Gtk.Dialog.new_with_buttons] and other
 * convenience functions in GTK will sometimes call
 * gtk_window_set_transient_for() on your behalf.
 * 
 * Passing %NULL for @parent unsets the current transient window.
 * 
 * On Windows, this function puts the child window on top of the parent,
 * much as the window manager would have done on X.
 *
 * @param parent parent window
 */
- (void)setTransientForWithParent:(OGTKWindow*)parent;

/**
 * Asks to remove the fullscreen state for @window, and return to
 * its previous state.
 * 
 * Note that you shouldn’t assume the window is definitely not
 * fullscreen afterward, because other entities (e.g. the user or
 * window manager) could fullscreen it again, and not all window
 * managers honor requests to unfullscreen windows; normally the
 * window will end up restored to its normal state. Just don’t
 * write code that crashes if not.
 * 
 * You can track the result of this operation via the
 * [property@Gdk.Toplevel:state] property, or by listening to
 * notifications of the [property@Gtk.Window:fullscreened] property.
 *
 */
- (void)unfullscreen;

/**
 * Asks to unmaximize @window.
 * 
 * Note that you shouldn’t assume the window is definitely unmaximized
 * afterward, because other entities (e.g. the user or window manager)
 * maximize it again, and not all window managers honor requests to
 * unmaximize.
 * 
 * You can track the result of this operation via the
 * [property@Gdk.Toplevel:state] property, or by listening to
 * notifications on the [property@Gtk.Window:maximized] property.
 *
 */
- (void)unmaximize;

/**
 * Asks to unminimize the specified @window.
 * 
 * Note that you shouldn’t assume the window is definitely unminimized
 * afterward, because the windowing system might not support this
 * functionality; other entities (e.g. the user or the window manager)
 * could minimize it again, or there may not be a window manager in
 * which case minimization isn’t possible, etc.
 * 
 * You can track result of this operation via the
 * [property@Gdk.Toplevel:state] property.
 *
 */
- (void)unminimize;

@end