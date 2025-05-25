/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

#import <OGdk4/OGdkDevice.h>
#import "OGTKWidget.h"

@implementation OGTKEventController

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_EVENT_CONTROLLER);
	return gObjectClass;
}

- (GtkEventController*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_EVENT_CONTROLLER, GtkEventController);
}

- (GdkEvent*)currentEvent
{
	GdkEvent* returnValue = (GdkEvent*)gtk_event_controller_get_current_event((GtkEventController*)[self castedGObject]);

	return returnValue;
}

- (OGdkDevice*)currentEventDevice
{
	GdkDevice* gobjectValue = gtk_event_controller_get_current_event_device((GtkEventController*)[self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkModifierType)currentEventState
{
	GdkModifierType returnValue = (GdkModifierType)gtk_event_controller_get_current_event_state((GtkEventController*)[self castedGObject]);

	return returnValue;
}

- (guint32)currentEventTime
{
	guint32 returnValue = (guint32)gtk_event_controller_get_current_event_time((GtkEventController*)[self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_event_controller_get_name((GtkEventController*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkPropagationLimit)propagationLimit
{
	GtkPropagationLimit returnValue = (GtkPropagationLimit)gtk_event_controller_get_propagation_limit((GtkEventController*)[self castedGObject]);

	return returnValue;
}

- (GtkPropagationPhase)propagationPhase
{
	GtkPropagationPhase returnValue = (GtkPropagationPhase)gtk_event_controller_get_propagation_phase((GtkEventController*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = gtk_event_controller_get_widget((GtkEventController*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)reset
{
	gtk_event_controller_reset((GtkEventController*)[self castedGObject]);
}

- (void)setName:(OFString*)name
{
	gtk_event_controller_set_name((GtkEventController*)[self castedGObject], [name UTF8String]);
}

- (void)setPropagationLimit:(GtkPropagationLimit)limit
{
	gtk_event_controller_set_propagation_limit((GtkEventController*)[self castedGObject], limit);
}

- (void)setPropagationPhase:(GtkPropagationPhase)phase
{
	gtk_event_controller_set_propagation_phase((GtkEventController*)[self castedGObject], phase);
}

- (void)setStaticName:(OFString*)name
{
	gtk_event_controller_set_static_name((GtkEventController*)[self castedGObject], [name UTF8String]);
}


@end