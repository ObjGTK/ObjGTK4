/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

@class OGGdkDevice;

/**
 * `GtkGesture` is the base class for gesture recognition.
 * 
 * Although `GtkGesture` is quite generalized to serve as a base for
 * multi-touch gestures, it is suitable to implement single-touch and
 * pointer-based gestures (using the special %NULL `GdkEventSequence`
 * value for these).
 * 
 * The number of touches that a `GtkGesture` need to be recognized is
 * controlled by the [property@Gtk.Gesture:n-points] property, if a
 * gesture is keeping track of less or more than that number of sequences,
 * it won't check whether the gesture is recognized.
 * 
 * As soon as the gesture has the expected number of touches, it will check
 * regularly if it is recognized, the criteria to consider a gesture as
 * "recognized" is left to `GtkGesture` subclasses.
 * 
 * A recognized gesture will then emit the following signals:
 * 
 * - [signal@Gtk.Gesture::begin] when the gesture is recognized.
 * - [signal@Gtk.Gesture::update], whenever an input event is processed.
 * - [signal@Gtk.Gesture::end] when the gesture is no longer recognized.
 * 
 * ## Event propagation
 * 
 * In order to receive events, a gesture needs to set a propagation phase
 * through [method@Gtk.EventController.set_propagation_phase].
 * 
 * In the capture phase, events are propagated from the toplevel down
 * to the target widget, and gestures that are attached to containers
 * above the widget get a chance to interact with the event before it
 * reaches the target.
 * 
 * In the bubble phase, events are propagated up from the target widget
 * to the toplevel, and gestures that are attached to containers above
 * the widget get a chance to interact with events that have not been
 * handled yet.
 * 
 * ## States of a sequence
 * 
 * Whenever input interaction happens, a single event may trigger a cascade
 * of `GtkGesture`s, both across the parents of the widget receiving the
 * event and in parallel within an individual widget. It is a responsibility
 * of the widgets using those gestures to set the state of touch sequences
 * accordingly in order to enable cooperation of gestures around the
 * `GdkEventSequence`s triggering those.
 * 
 * Within a widget, gestures can be grouped through [method@Gtk.Gesture.group].
 * Grouped gestures synchronize the state of sequences, so calling
 * [method@Gtk.Gesture.set_state] on one will effectively propagate
 * the state throughout the group.
 * 
 * By default, all sequences start out in the %GTK_EVENT_SEQUENCE_NONE state,
 * sequences in this state trigger the gesture event handler, but event
 * propagation will continue unstopped by gestures.
 * 
 * If a sequence enters into the %GTK_EVENT_SEQUENCE_DENIED state, the gesture
 * group will effectively ignore the sequence, letting events go unstopped
 * through the gesture, but the "slot" will still remain occupied while
 * the touch is active.
 * 
 * If a sequence enters in the %GTK_EVENT_SEQUENCE_CLAIMED state, the gesture
 * group will grab all interaction on the sequence, by:
 * 
 * - Setting the same sequence to %GTK_EVENT_SEQUENCE_DENIED on every other
 *   gesture group within the widget, and every gesture on parent widgets
 *   in the propagation chain.
 * - Emitting [signal@Gtk.Gesture::cancel] on every gesture in widgets
 *   underneath in the propagation chain.
 * - Stopping event propagation after the gesture group handles the event.
 * 
 * Note: if a sequence is set early to %GTK_EVENT_SEQUENCE_CLAIMED on
 * %GDK_TOUCH_BEGIN/%GDK_BUTTON_PRESS (so those events are captured before
 * reaching the event widget, this implies %GTK_PHASE_CAPTURE), one similar
 * event will be emulated if the sequence changes to %GTK_EVENT_SEQUENCE_DENIED.
 * This way event coherence is preserved before event propagation is unstopped
 * again.
 * 
 * Sequence states can't be changed freely.
 * See [method@Gtk.Gesture.set_state] to know about the possible
 * lifetimes of a `GdkEventSequence`.
 * 
 * ## Touchpad gestures
 * 
 * On the platforms that support it, `GtkGesture` will handle transparently
 * touchpad gesture events. The only precautions users of `GtkGesture` should
 * do to enable this support are:
 * 
 * - If the gesture has %GTK_PHASE_NONE, ensuring events of type
 *   %GDK_TOUCHPAD_SWIPE and %GDK_TOUCHPAD_PINCH are handled by the `GtkGesture`
 *
 */
@interface OGTKGesture : OGTKEventController
{

}


/**
 * Methods
 */

- (GtkGesture*)castedGObject;

/**
 * If there are touch sequences being currently handled by @gesture,
 * returns %TRUE and fills in @rect with the bounding box containing
 * all active touches.
 * 
 * Otherwise, %FALSE will be returned.
 * 
 * Note: This function will yield unexpected results on touchpad
 * gestures. Since there is no correlation between physical and
 * pixel distances, these will look as if constrained in an
 * infinitely small area, @rect width and height will thus be 0
 * regardless of the number of touchpoints.
 *
 * @param rect bounding box containing all active touches.
 * @return %TRUE if there are active touches, %FALSE otherwise
 */
- (bool)boundingBox:(GdkRectangle*)rect;

/**
 * If there are touch sequences being currently handled by @gesture,
 * returns %TRUE and fills in @x and @y with the center of the bounding
 * box containing all active touches.
 * 
 * Otherwise, %FALSE will be returned.
 *
 * @param x X coordinate for the bounding box center
 * @param y Y coordinate for the bounding box center
 * @return %FALSE if no active touches are present, %TRUE otherwise
 */
- (bool)boundingBoxCenterWithX:(double*)x y:(double*)y;

/**
 * Returns the logical `GdkDevice` that is currently operating
 * on @gesture.
 * 
 * This returns %NULL if the gesture is not being interacted.
 *
 * @return a `GdkDevice`
 */
- (OGGdkDevice*)device;

/**
 * Returns all gestures in the group of @gesture
 *
 * @return The list
 *   of `GtkGesture`s, free with g_list_free()
 */
- (GList*)group;

/**
 * Returns the last event that was processed for @sequence.
 * 
 * Note that the returned pointer is only valid as long as the
 * @sequence is still interpreted by the @gesture. If in doubt,
 * you should make a copy of the event.
 *
 * @param sequence a `GdkEventSequence`
 * @return The last event from @sequence
 */
- (GdkEvent*)lastEvent:(GdkEventSequence*)sequence;

/**
 * Returns the `GdkEventSequence` that was last updated on @gesture.
 *
 * @return The last updated sequence
 */
- (GdkEventSequence*)lastUpdatedSequence;

/**
 * If @sequence is currently being interpreted by @gesture,
 * returns %TRUE and fills in @x and @y with the last coordinates
 * stored for that event sequence.
 * 
 * The coordinates are always relative to the widget allocation.
 *
 * @param sequence a `GdkEventSequence`, or %NULL for pointer events
 * @param x return location for X axis of the sequence coordinates
 * @param y return location for Y axis of the sequence coordinates
 * @return %TRUE if @sequence is currently interpreted
 */
- (bool)pointWithSequence:(GdkEventSequence*)sequence x:(double*)x y:(double*)y;

/**
 * Returns the @sequence state, as seen by @gesture.
 *
 * @param sequence a `GdkEventSequence`
 * @return The sequence state in @gesture
 */
- (GtkEventSequenceState)sequenceState:(GdkEventSequence*)sequence;

/**
 * Returns the list of `GdkEventSequences` currently being interpreted
 * by @gesture.
 *
 * @return A list
 *   of `GdkEventSequence`, the list elements are owned by GTK and must
 *   not be freed or modified, the list itself must be deleted
 *   through g_list_free()
 */
- (GList*)sequences;

/**
 * Adds @gesture to the same group than @group_gesture.
 * 
 * Gestures are by default isolated in their own groups.
 * 
 * Both gestures must have been added to the same widget before
 * they can be grouped.
 * 
 * When gestures are grouped, the state of `GdkEventSequences`
 * is kept in sync for all of those, so calling
 * [method@Gtk.Gesture.set_sequence_state], on one will transfer
 * the same value to the others.
 * 
 * Groups also perform an "implicit grabbing" of sequences, if a
 * `GdkEventSequence` state is set to %GTK_EVENT_SEQUENCE_CLAIMED
 * on one group, every other gesture group attached to the same
 * `GtkWidget` will switch the state for that sequence to
 * %GTK_EVENT_SEQUENCE_DENIED.
 *
 * @param gesture a `GtkGesture`
 */
- (void)group:(OGTKGesture*)gesture;

/**
 * Returns %TRUE if @gesture is currently handling events
 * corresponding to @sequence.
 *
 * @param sequence a `GdkEventSequence`
 * @return %TRUE if @gesture is handling @sequence, %FALSE otherwise
 */
- (bool)handlesSequence:(GdkEventSequence*)sequence;

/**
 * Returns %TRUE if the gesture is currently active.
 * 
 * A gesture is active while there are touch sequences
 * interacting with it.
 *
 * @return %TRUE if gesture is active
 */
- (bool)isActive;

/**
 * Returns %TRUE if both gestures pertain to the same group.
 *
 * @param other another `GtkGesture`
 * @return whether the gestures are grouped
 */
- (bool)isGroupedWith:(OGTKGesture*)other;

/**
 * Returns %TRUE if the gesture is currently recognized.
 * 
 * A gesture is recognized if there are as many interacting
 * touch sequences as required by @gesture.
 *
 * @return %TRUE if gesture is recognized
 */
- (bool)isRecognized;

/**
 * Sets the state of @sequence in @gesture.
 * 
 * Sequences start in state %GTK_EVENT_SEQUENCE_NONE, and whenever
 * they change state, they can never go back to that state. Likewise,
 * sequences in state %GTK_EVENT_SEQUENCE_DENIED cannot turn back to
 * a not denied state. With these rules, the lifetime of an event
 * sequence is constrained to the next four:
 * 
 * * None
 * * None → Denied
 * * None → Claimed
 * * None → Claimed → Denied
 * 
 * Note: Due to event handling ordering, it may be unsafe to set the
 * state on another gesture within a [signal@Gtk.Gesture::begin] signal
 * handler, as the callback might be executed before the other gesture
 * knows about the sequence. A safe way to perform this could be:
 * 
 * ```c
 * static void
 * first_gesture_begin_cb (GtkGesture       *first_gesture,
 *                         GdkEventSequence *sequence,
 *                         gpointer          user_data)
 * {
 *   gtk_gesture_set_sequence_state (first_gesture, sequence, GTK_EVENT_SEQUENCE_CLAIMED);
 *   gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
 * }
 * 
 * static void
 * second_gesture_begin_cb (GtkGesture       *second_gesture,
 *                          GdkEventSequence *sequence,
 *                          gpointer          user_data)
 * {
 *   if (gtk_gesture_get_sequence_state (first_gesture, sequence) == GTK_EVENT_SEQUENCE_CLAIMED)
 *     gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
 * }
 * ```
 * 
 * If both gestures are in the same group, just set the state on
 * the gesture emitting the event, the sequence will be already
 * be initialized to the group's global state when the second
 * gesture processes the event.
 *
 * @param sequence a `GdkEventSequence`
 * @param state the sequence state
 * @return %TRUE if @sequence is handled by @gesture,
 *   and the state is changed successfully
 */
- (bool)setSequenceStateWithSequence:(GdkEventSequence*)sequence state:(GtkEventSequenceState)state;

/**
 * Sets the state of all sequences that @gesture is currently
 * interacting with.
 * 
 * Sequences start in state %GTK_EVENT_SEQUENCE_NONE, and whenever
 * they change state, they can never go back to that state. Likewise,
 * sequences in state %GTK_EVENT_SEQUENCE_DENIED cannot turn back to
 * a not denied state. With these rules, the lifetime of an event
 * sequence is constrained to the next four:
 * 
 * * None
 * * None → Denied
 * * None → Claimed
 * * None → Claimed → Denied
 * 
 * Note: Due to event handling ordering, it may be unsafe to set the
 * state on another gesture within a [signal@Gtk.Gesture::begin] signal
 * handler, as the callback might be executed before the other gesture
 * knows about the sequence. A safe way to perform this could be:
 * 
 * ```c
 * static void
 * first_gesture_begin_cb (GtkGesture       *first_gesture,
 *                         GdkEventSequence *sequence,
 *                         gpointer          user_data)
 * {
 *   gtk_gesture_set_state (first_gesture, GTK_EVENT_SEQUENCE_CLAIMED);
 *   gtk_gesture_set_state (second_gesture, GTK_EVENT_SEQUENCE_DENIED);
 * }
 * 
 * static void
 * second_gesture_begin_cb (GtkGesture       *second_gesture,
 *                          GdkEventSequence *sequence,
 *                          gpointer          user_data)
 * {
 *   if (gtk_gesture_get_sequence_state (first_gesture, sequence) == GTK_EVENT_SEQUENCE_CLAIMED)
 *     gtk_gesture_set_state (second_gesture, GTK_EVENT_SEQUENCE_DENIED);
 * }
 * ```
 * 
 * If both gestures are in the same group, just set the state on
 * the gesture emitting the event, the sequence will be already
 * be initialized to the group's global state when the second
 * gesture processes the event.
 *
 * @param state the sequence state
 * @return %TRUE if the state of at least one sequence
 *   was changed successfully
 */
- (bool)setState:(GtkEventSequenceState)state;

/**
 * Separates @gesture into an isolated group.
 *
 */
- (void)ungroup;

@end