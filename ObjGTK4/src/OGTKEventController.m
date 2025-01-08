/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

#import <OGdk4/OGdkDevice.h>
#import "OGTKWidget.h"

@implementation OGTKEventController

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkEventController*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEventController, GtkEventController);
}

- (GdkEvent*)currentEvent
{
	GdkEvent* returnValue = (GdkEvent*)gtk_event_controller_get_current_event([self castedGObject]);

	return returnValue;
}

- (OGdkDevice*)currentEventDevice
{
	GdkDevice* gobjectValue = gtk_event_controller_get_current_event_device([self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkModifierType)currentEventState
{
	GdkModifierType returnValue = (GdkModifierType)gtk_event_controller_get_current_event_state([self castedGObject]);

	return returnValue;
}

- (guint32)currentEventTime
{
	guint32 returnValue = (guint32)gtk_event_controller_get_current_event_time([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_event_controller_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkPropagationLimit)propagationLimit
{
	GtkPropagationLimit returnValue = (GtkPropagationLimit)gtk_event_controller_get_propagation_limit([self castedGObject]);

	return returnValue;
}

- (GtkPropagationPhase)propagationPhase
{
	GtkPropagationPhase returnValue = (GtkPropagationPhase)gtk_event_controller_get_propagation_phase([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = gtk_event_controller_get_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)reset
{
	gtk_event_controller_reset([self castedGObject]);
}

- (void)setName:(OFString*)name
{
	gtk_event_controller_set_name([self castedGObject], [name UTF8String]);
}

- (void)setPropagationLimit:(GtkPropagationLimit)limit
{
	gtk_event_controller_set_propagation_limit([self castedGObject], limit);
}

- (void)setPropagationPhase:(GtkPropagationPhase)phase
{
	gtk_event_controller_set_propagation_phase([self castedGObject], phase);
}

- (void)setStaticName:(OFString*)name
{
	gtk_event_controller_set_static_name([self castedGObject], [name UTF8String]);
}


@end