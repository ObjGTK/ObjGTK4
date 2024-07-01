/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesture.h"

#import <OGdk4/OGGdkDevice.h>

@implementation OGTKGesture

- (GtkGesture*)castedGObject
{
	return GTK_GESTURE([self gObject]);
}

- (bool)boundingBox:(GdkRectangle*)rect
{
	bool returnValue = gtk_gesture_get_bounding_box([self castedGObject], rect);

	return returnValue;
}

- (bool)boundingBoxCenterWithX:(double*)x y:(double*)y
{
	bool returnValue = gtk_gesture_get_bounding_box_center([self castedGObject], x, y);

	return returnValue;
}

- (OGGdkDevice*)device
{
	GdkDevice* gobjectValue = GDK_DEVICE(gtk_gesture_get_device([self castedGObject]));

	OGGdkDevice* returnValue = [OGGdkDevice withGObject:gobjectValue];
	return returnValue;
}

- (GList*)group
{
	GList* returnValue = gtk_gesture_get_group([self castedGObject]);

	return returnValue;
}

- (GdkEvent*)lastEvent:(GdkEventSequence*)sequence
{
	GdkEvent* returnValue = gtk_gesture_get_last_event([self castedGObject], sequence);

	return returnValue;
}

- (GdkEventSequence*)lastUpdatedSequence
{
	GdkEventSequence* returnValue = gtk_gesture_get_last_updated_sequence([self castedGObject]);

	return returnValue;
}

- (bool)pointWithSequence:(GdkEventSequence*)sequence x:(double*)x y:(double*)y
{
	bool returnValue = gtk_gesture_get_point([self castedGObject], sequence, x, y);

	return returnValue;
}

- (GtkEventSequenceState)sequenceState:(GdkEventSequence*)sequence
{
	GtkEventSequenceState returnValue = gtk_gesture_get_sequence_state([self castedGObject], sequence);

	return returnValue;
}

- (GList*)sequences
{
	GList* returnValue = gtk_gesture_get_sequences([self castedGObject]);

	return returnValue;
}

- (void)group:(OGTKGesture*)gesture
{
	gtk_gesture_group([self castedGObject], [gesture castedGObject]);
}

- (bool)handlesSequence:(GdkEventSequence*)sequence
{
	bool returnValue = gtk_gesture_handles_sequence([self castedGObject], sequence);

	return returnValue;
}

- (bool)isActive
{
	bool returnValue = gtk_gesture_is_active([self castedGObject]);

	return returnValue;
}

- (bool)isGroupedWith:(OGTKGesture*)other
{
	bool returnValue = gtk_gesture_is_grouped_with([self castedGObject], [other castedGObject]);

	return returnValue;
}

- (bool)isRecognized
{
	bool returnValue = gtk_gesture_is_recognized([self castedGObject]);

	return returnValue;
}

- (bool)setSequenceStateWithSequence:(GdkEventSequence*)sequence state:(GtkEventSequenceState)state
{
	bool returnValue = gtk_gesture_set_sequence_state([self castedGObject], sequence, state);

	return returnValue;
}

- (bool)setState:(GtkEventSequenceState)state
{
	bool returnValue = gtk_gesture_set_state([self castedGObject], state);

	return returnValue;
}

- (void)ungroup
{
	gtk_gesture_ungroup([self castedGObject]);
}


@end