/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

#import <OGdk4/OGGdkDevice.h>
#import "OGTKWidget.h"

@implementation OGTKEventController

- (GtkEventController*)castedGObject
{
	return GTK_EVENT_CONTROLLER([self gObject]);
}

- (GdkEvent*)currentEvent
{
	GdkEvent* returnValue = gtk_event_controller_get_current_event([self castedGObject]);

	return returnValue;
}

- (OGGdkDevice*)currentEventDevice
{
	GdkDevice* gobjectValue = GDK_DEVICE(gtk_event_controller_get_current_event_device([self castedGObject]));

	OGGdkDevice* returnValue = [OGGdkDevice withGObject:gobjectValue];
	return returnValue;
}

- (GdkModifierType)currentEventState
{
	GdkModifierType returnValue = gtk_event_controller_get_current_event_state([self castedGObject]);

	return returnValue;
}

- (guint32)currentEventTime
{
	guint32 returnValue = gtk_event_controller_get_current_event_time([self castedGObject]);

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
	GtkPropagationLimit returnValue = gtk_event_controller_get_propagation_limit([self castedGObject]);

	return returnValue;
}

- (GtkPropagationPhase)propagationPhase
{
	GtkPropagationPhase returnValue = gtk_event_controller_get_propagation_phase([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_event_controller_get_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
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