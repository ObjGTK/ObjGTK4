/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesture.h"

#import <OGdk4/OGdkDevice.h>

@implementation OGTKGesture

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GESTURE);
	return gObjectClass;
}

- (GtkGesture*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GESTURE, GtkGesture);
}

- (bool)boundingBoxWithRect:(GdkRectangle*)rect
{
	bool returnValue = (bool)gtk_gesture_get_bounding_box((GtkGesture*)[self castedGObject], rect);

	return returnValue;
}

- (bool)boundingBoxCenter:(double*)x y:(double*)y
{
	bool returnValue = (bool)gtk_gesture_get_bounding_box_center((GtkGesture*)[self castedGObject], x, y);

	return returnValue;
}

- (OGdkDevice*)device
{
	GdkDevice* gobjectValue = gtk_gesture_get_device((GtkGesture*)[self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)group
{
	GList* returnValue = (GList*)gtk_gesture_get_group((GtkGesture*)[self castedGObject]);

	return returnValue;
}

- (GdkEvent*)lastEventWithSequence:(GdkEventSequence*)sequence
{
	GdkEvent* returnValue = (GdkEvent*)gtk_gesture_get_last_event((GtkGesture*)[self castedGObject], sequence);

	return returnValue;
}

- (GdkEventSequence*)lastUpdatedSequence
{
	GdkEventSequence* returnValue = (GdkEventSequence*)gtk_gesture_get_last_updated_sequence((GtkGesture*)[self castedGObject]);

	return returnValue;
}

- (bool)pointWithSequence:(GdkEventSequence*)sequence x:(double*)x y:(double*)y
{
	bool returnValue = (bool)gtk_gesture_get_point((GtkGesture*)[self castedGObject], sequence, x, y);

	return returnValue;
}

- (GtkEventSequenceState)sequenceStateWithSequence:(GdkEventSequence*)sequence
{
	GtkEventSequenceState returnValue = (GtkEventSequenceState)gtk_gesture_get_sequence_state((GtkGesture*)[self castedGObject], sequence);

	return returnValue;
}

- (GList*)sequences
{
	GList* returnValue = (GList*)gtk_gesture_get_sequences((GtkGesture*)[self castedGObject]);

	return returnValue;
}

- (void)groupWithGesture:(OGTKGesture*)gesture
{
	gtk_gesture_group((GtkGesture*)[self castedGObject], [gesture castedGObject]);
}

- (bool)handlesSequence:(GdkEventSequence*)sequence
{
	bool returnValue = (bool)gtk_gesture_handles_sequence((GtkGesture*)[self castedGObject], sequence);

	return returnValue;
}

- (bool)isActive
{
	bool returnValue = (bool)gtk_gesture_is_active((GtkGesture*)[self castedGObject]);

	return returnValue;
}

- (bool)isGroupedWithWithOther:(OGTKGesture*)other
{
	bool returnValue = (bool)gtk_gesture_is_grouped_with((GtkGesture*)[self castedGObject], [other castedGObject]);

	return returnValue;
}

- (bool)isRecognized
{
	bool returnValue = (bool)gtk_gesture_is_recognized((GtkGesture*)[self castedGObject]);

	return returnValue;
}

- (bool)setSequenceState:(GdkEventSequence*)sequence state:(GtkEventSequenceState)state
{
	bool returnValue = (bool)gtk_gesture_set_sequence_state((GtkGesture*)[self castedGObject], sequence, state);

	return returnValue;
}

- (bool)setState:(GtkEventSequenceState)state
{
	bool returnValue = (bool)gtk_gesture_set_state((GtkGesture*)[self castedGObject], state);

	return returnValue;
}

- (void)ungroup
{
	gtk_gesture_ungroup((GtkGesture*)[self castedGObject]);
}


@end