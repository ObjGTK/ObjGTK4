/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGGdkDevice;
@class OGTKWidget;

/**
 * `GtkEventController` is the base class for event controllers.
 * 
 * These are ancillary objects associated to widgets, which react
 * to `GdkEvents`, and possibly trigger actions as a consequence.
 * 
 * Event controllers are added to a widget with
 * [method@Gtk.Widget.add_controller]. It is rarely necessary to
 * explicitly remove a controller with [method@Gtk.Widget.remove_controller].
 * 
 * See the chapter on [input handling](input-handling.html) for
 * an overview of the basic concepts, such as the capture and bubble
 * phases of event propagation.
 *
 */
@interface OGTKEventController : OGObject
{

}


/**
 * Methods
 */

- (GtkEventController*)castedGObject;

/**
 * Returns the event that is currently being handled by the controller.
 * 
 * At other times, %NULL is returned.
 *
 * @return the event that is currently
 *   handled by @controller
 */
- (GdkEvent*)currentEvent;

/**
 * Returns the device of the event that is currently being
 * handled by the controller.
 * 
 * At other times, %NULL is returned.
 *
 * @return device of the event is
 *   currently handled by @controller
 */
- (OGGdkDevice*)currentEventDevice;

/**
 * Returns the modifier state of the event that is currently being
 * handled by the controller.
 * 
 * At other times, 0 is returned.
 *
 * @return modifier state of the event is currently handled by @controller
 */
- (GdkModifierType)currentEventState;

/**
 * Returns the timestamp of the event that is currently being
 * handled by the controller.
 * 
 * At other times, 0 is returned.
 *
 * @return timestamp of the event is currently handled by @controller
 */
- (guint32)currentEventTime;

/**
 * Gets the name of @controller.
 *
 * @return The controller name
 */
- (OFString*)name;

/**
 * Gets the propagation limit of the event controller.
 *
 * @return the propagation limit
 */
- (GtkPropagationLimit)propagationLimit;

/**
 * Gets the propagation phase at which @controller handles events.
 *
 * @return the propagation phase
 */
- (GtkPropagationPhase)propagationPhase;

/**
 * Returns the `GtkWidget` this controller relates to.
 *
 * @return a `GtkWidget`
 */
- (OGTKWidget*)widget;

/**
 * Resets the @controller to a clean state.
 *
 */
- (void)reset;

/**
 * Sets a name on the controller that can be used for debugging.
 *
 * @param name a name for @controller
 */
- (void)setName:(OFString*)name;

/**
 * Sets the event propagation limit on the event controller.
 * 
 * If the limit is set to %GTK_LIMIT_SAME_NATIVE, the controller
 * won't handle events that are targeted at widgets on a different
 * surface, such as popovers.
 *
 * @param limit the propagation limit
 */
- (void)setPropagationLimit:(GtkPropagationLimit)limit;

/**
 * Sets the propagation phase at which a controller handles events.
 * 
 * If @phase is %GTK_PHASE_NONE, no automatic event handling will be
 * performed, but other additional gesture maintenance will.
 *
 * @param phase a propagation phase
 */
- (void)setPropagationPhase:(GtkPropagationPhase)phase;

/**
 * Sets a name on the controller that can be used for debugging.
 *
 * @param name a name for @controller, must be a static string
 */
- (void)setStaticName:(OFString*)name;

@end