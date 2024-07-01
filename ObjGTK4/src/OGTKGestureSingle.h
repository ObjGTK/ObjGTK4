/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesture.h"

/**
 * `GtkGestureSingle` is a `GtkGestures` subclass optimized for singe-touch
 * and mouse gestures.
 * 
 * Under interaction, these gestures stick to the first interacting sequence,
 * which is accessible through [method@Gtk.GestureSingle.get_current_sequence]
 * while the gesture is being interacted with.
 * 
 * By default gestures react to both %GDK_BUTTON_PRIMARY and touch events.
 * [method@Gtk.GestureSingle.set_touch_only] can be used to change the
 * touch behavior. Callers may also specify a different mouse button number
 * to interact with through [method@Gtk.GestureSingle.set_button], or react
 * to any mouse button by setting it to 0. While the gesture is active, the
 * button being currently pressed can be known through
 * [method@Gtk.GestureSingle.get_current_button].
 *
 */
@interface OGTKGestureSingle : OGTKGesture
{

}


/**
 * Methods
 */

- (GtkGestureSingle*)castedGObject;

/**
 * Returns the button number @gesture listens for.
 * 
 * If this is 0, the gesture reacts to any button press.
 *
 * @return The button number, or 0 for any button
 */
- (guint)button;

/**
 * Returns the button number currently interacting
 * with @gesture, or 0 if there is none.
 *
 * @return The current button number
 */
- (guint)currentButton;

/**
 * Returns the event sequence currently interacting with @gesture.
 * 
 * This is only meaningful if [method@Gtk.Gesture.is_active]
 * returns %TRUE.
 *
 * @return the current sequence
 */
- (GdkEventSequence*)currentSequence;

/**
 * Gets whether a gesture is exclusive.
 * 
 * For more information, see [method@Gtk.GestureSingle.set_exclusive].
 *
 * @return Whether the gesture is exclusive
 */
- (bool)exclusive;

/**
 * Returns %TRUE if the gesture is only triggered by touch events.
 *
 * @return %TRUE if the gesture only handles touch events
 */
- (bool)touchOnly;

/**
 * Sets the button number @gesture listens to.
 * 
 * If non-0, every button press from a different button
 * number will be ignored. Touch events implicitly match
 * with button 1.
 *
 * @param button button number to listen to, or 0 for any button
 */
- (void)setButton:(guint)button;

/**
 * Sets whether @gesture is exclusive.
 * 
 * An exclusive gesture will only handle pointer and "pointer emulated"
 * touch events, so at any given time, there is only one sequence able
 * to interact with those.
 *
 * @param exclusive %TRUE to make @gesture exclusive
 */
- (void)setExclusive:(bool)exclusive;

/**
 * Sets whether to handle only touch events.
 * 
 * If @touch_only is %TRUE, @gesture will only handle events of type
 * %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE or %GDK_TOUCH_END. If %FALSE,
 * mouse events will be handled too.
 *
 * @param touchOnly whether @gesture handles only touch events
 */
- (void)setTouchOnly:(bool)touchOnly;

@end