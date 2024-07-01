/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A `GtkRevealer` animates the transition of its child from invisible to visible.
 * 
 * The style of transition can be controlled with
 * [method@Gtk.Revealer.set_transition_type].
 * 
 * These animations respect the [property@Gtk.Settings:gtk-enable-animations]
 * setting.
 * 
 * # CSS nodes
 * 
 * `GtkRevealer` has a single CSS node with name revealer.
 * When styling `GtkRevealer` using CSS, remember that it only hides its contents,
 * not itself. That means applied margin, padding and borders will be visible even
 * when the [property@Gtk.Revealer:reveal-child] property is set to %FALSE.
 * 
 * # Accessibility
 * 
 * `GtkRevealer` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
 * 
 * The child of `GtkRevealer`, if set, is always available in the accessibility
 * tree, regardless of the state of the revealer widget.
 *
 */
@interface OGTKRevealer : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkRevealer*)castedGObject;

/**
 * Gets the child widget of @revealer.
 *
 * @return the child widget of @revealer
 */
- (OGTKWidget*)child;

/**
 * Returns whether the child is fully revealed.
 * 
 * In other words, this returns whether the transition
 * to the revealed state is completed.
 *
 * @return %TRUE if the child is fully revealed
 */
- (bool)childRevealed;

/**
 * Returns whether the child is currently revealed.
 * 
 * This function returns %TRUE as soon as the transition
 * is to the revealed state is started. To learn whether
 * the child is fully revealed (ie the transition is completed),
 * use [method@Gtk.Revealer.get_child_revealed].
 *
 * @return %TRUE if the child is revealed.
 */
- (bool)revealChild;

/**
 * Returns the amount of time (in milliseconds) that
 * transitions will take.
 *
 * @return the transition duration
 */
- (guint)transitionDuration;

/**
 * Gets the type of animation that will be used
 * for transitions in @revealer.
 *
 * @return the current transition type of @revealer
 */
- (GtkRevealerTransitionType)transitionType;

/**
 * Sets the child widget of @revealer.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Tells the `GtkRevealer` to reveal or conceal its child.
 * 
 * The transition will be animated with the current
 * transition type of @revealer.
 *
 * @param revealChild %TRUE to reveal the child
 */
- (void)setRevealChild:(bool)revealChild;

/**
 * Sets the duration that transitions will take.
 *
 * @param duration the new duration, in milliseconds
 */
- (void)setTransitionDuration:(guint)duration;

/**
 * Sets the type of animation that will be used for
 * transitions in @revealer.
 * 
 * Available types include various kinds of fades and slides.
 *
 * @param transition the new transition type
 */
- (void)setTransitionType:(GtkRevealerTransitionType)transition;

@end