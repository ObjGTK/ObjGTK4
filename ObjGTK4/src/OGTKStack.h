/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKStackPage;

/**
 * `GtkStack` is a container which only shows one of its children
 * at a time.
 * 
 * In contrast to `GtkNotebook`, `GtkStack` does not provide a means
 * for users to change the visible child. Instead, a separate widget
 * such as [class@Gtk.StackSwitcher] or [class@Gtk.StackSidebar] can
 * be used with `GtkStack` to provide this functionality.
 * 
 * Transitions between pages can be animated as slides or fades. This
 * can be controlled with [method@Gtk.Stack.set_transition_type].
 * These animations respect the [property@Gtk.Settings:gtk-enable-animations]
 * setting.
 * 
 * `GtkStack` maintains a [class@Gtk.StackPage] object for each added
 * child, which holds additional per-child properties. You
 * obtain the `GtkStackPage` for a child with [method@Gtk.Stack.get_page]
 * and you can obtain a `GtkSelectionModel` containing all the pages
 * with [method@Gtk.Stack.get_pages].
 * 
 * # GtkStack as GtkBuildable
 * 
 * To set child-specific properties in a .ui file, create `GtkStackPage`
 * objects explicitly, and set the child widget as a property on it:
 * 
 * ```xml
 *   <object class="GtkStack" id="stack">
 *     <child>
 *       <object class="GtkStackPage">
 *         <property name="name">page1</property>
 *         <property name="title">In the beginning…</property>
 *         <property name="child">
 *           <object class="GtkLabel">
 *             <property name="label">It was dark</property>
 *           </object>
 *         </property>
 *       </object>
 *     </child>
 * ```
 * 
 * # CSS nodes
 * 
 * `GtkStack` has a single CSS node named stack.
 * 
 * # Accessibility
 * 
 * `GtkStack` uses the %GTK_ACCESSIBLE_ROLE_TAB_PANEL for the stack
 * pages, which are the accessible parent objects of the child widgets.
 *
 */
@interface OGTKStack : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkStack*)castedGObject;

/**
 * Adds a child to @stack.
 *
 * @param child the widget to add
 * @return the `GtkStackPage` for @child
 */
- (OGTKStackPage*)addChild:(OGTKWidget*)child;

/**
 * Adds a child to @stack.
 * 
 * The child is identified by the @name.
 *
 * @param child the widget to add
 * @param name the name for @child
 * @return the `GtkStackPage` for @child
 */
- (OGTKStackPage*)addNamedWithChild:(OGTKWidget*)child name:(OFString*)name;

/**
 * Adds a child to @stack.
 * 
 * The child is identified by the @name. The @title
 * will be used by `GtkStackSwitcher` to represent
 * @child in a tab bar, so it should be short.
 *
 * @param child the widget to add
 * @param name the name for @child
 * @param title a human-readable title for @child
 * @return the `GtkStackPage` for @child
 */
- (OGTKStackPage*)addTitledWithChild:(OGTKWidget*)child name:(OFString*)name title:(OFString*)title;

/**
 * Finds the child with the name given as the argument.
 * 
 * Returns %NULL if there is no child with this name.
 *
 * @param name the name of the child to find
 * @return the requested child
 *   of the `GtkStack`
 */
- (OGTKWidget*)childByName:(OFString*)name;

/**
 * Gets whether @stack is horizontally homogeneous.
 *
 * @return whether @stack is horizontally homogeneous.
 */
- (bool)hhomogeneous;

/**
 * Returns whether the `GtkStack` is set up to interpolate between
 * the sizes of children on page switch.
 *
 * @return %TRUE if child sizes are interpolated
 */
- (bool)interpolateSize;

/**
 * Returns the `GtkStackPage` object for @child.
 *
 * @param child a child of @stack
 * @return the `GtkStackPage` for @child
 */
- (OGTKStackPage*)page:(OGTKWidget*)child;

/**
 * Returns a `GListModel` that contains the pages of the stack.
 * 
 * This can be used to keep an up-to-date view. The model also
 * implements [iface@Gtk.SelectionModel] and can be used to track
 * and modify the visible page.
 *
 * @return a `GtkSelectionModel` for the stack's children
 */
- (GtkSelectionModel*)pages;

/**
 * Returns the amount of time (in milliseconds) that
 * transitions between pages in @stack will take.
 *
 * @return the transition duration
 */
- (guint)transitionDuration;

/**
 * Returns whether the @stack is currently in a transition from one page to
 * another.
 *
 * @return %TRUE if the transition is currently running, %FALSE otherwise.
 */
- (bool)transitionRunning;

/**
 * Gets the type of animation that will be used
 * for transitions between pages in @stack.
 *
 * @return the current transition type of @stack
 */
- (GtkStackTransitionType)transitionType;

/**
 * Gets whether @stack is vertically homogeneous.
 *
 * @return whether @stack is vertically homogeneous.
 */
- (bool)vhomogeneous;

/**
 * Gets the currently visible child of @stack.
 * 
 * Returns %NULL if there are no visible children.
 *
 * @return the visible child of the `GtkStack`
 */
- (OGTKWidget*)visibleChild;

/**
 * Returns the name of the currently visible child of @stack.
 * 
 * Returns %NULL if there is no visible child.
 *
 * @return the name of the visible child
 *   of the `GtkStack`
 */
- (OFString*)visibleChildName;

/**
 * Removes a child widget from @stack.
 *
 * @param child the child to remove
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Sets the `GtkStack` to be horizontally homogeneous or not.
 * 
 * If it is homogeneous, the `GtkStack` will request the same
 * width for all its children. If it isn't, the stack
 * may change width when a different child becomes visible.
 *
 * @param hhomogeneous %TRUE to make @stack horizontally homogeneous
 */
- (void)setHhomogeneous:(bool)hhomogeneous;

/**
 * Sets whether or not @stack will interpolate its size when
 * changing the visible child.
 * 
 * If the [property@Gtk.Stack:interpolate-size] property is set
 * to %TRUE, @stack will interpolate its size between the current
 * one and the one it'll take after changing the visible child,
 * according to the set transition duration.
 *
 * @param interpolateSize the new value
 */
- (void)setInterpolateSize:(bool)interpolateSize;

/**
 * Sets the duration that transitions between pages in @stack
 * will take.
 *
 * @param duration the new duration, in milliseconds
 */
- (void)setTransitionDuration:(guint)duration;

/**
 * Sets the type of animation that will be used for
 * transitions between pages in @stack.
 * 
 * Available types include various kinds of fades and slides.
 * 
 * The transition type can be changed without problems
 * at runtime, so it is possible to change the animation
 * based on the page that is about to become current.
 *
 * @param transition the new transition type
 */
- (void)setTransitionType:(GtkStackTransitionType)transition;

/**
 * Sets the `GtkStack` to be vertically homogeneous or not.
 * 
 * If it is homogeneous, the `GtkStack` will request the same
 * height for all its children. If it isn't, the stack
 * may change height when a different child becomes visible.
 *
 * @param vhomogeneous %TRUE to make @stack vertically homogeneous
 */
- (void)setVhomogeneous:(bool)vhomogeneous;

/**
 * Makes @child the visible child of @stack.
 * 
 * If @child is different from the currently visible child,
 * the transition between the two will be animated with the
 * current transition type of @stack.
 * 
 * Note that the @child widget has to be visible itself
 * (see [method@Gtk.Widget.show]) in order to become the visible
 * child of @stack.
 *
 * @param child a child of @stack
 */
- (void)setVisibleChild:(OGTKWidget*)child;

/**
 * Makes the child with the given name visible.
 * 
 * Note that the child widget has to be visible itself
 * (see [method@Gtk.Widget.show]) in order to become the visible
 * child of @stack.
 *
 * @param name the name of the child to make visible
 * @param transition the transition type to use
 */
- (void)setVisibleChildFullWithName:(OFString*)name transition:(GtkStackTransitionType)transition;

/**
 * Makes the child with the given name visible.
 * 
 * If @child is different from the currently visible child,
 * the transition between the two will be animated with the
 * current transition type of @stack.
 * 
 * Note that the child widget has to be visible itself
 * (see [method@Gtk.Widget.show]) in order to become the visible
 * child of @stack.
 *
 * @param name the name of the child to make visible
 */
- (void)setVisibleChildName:(OFString*)name;

@end