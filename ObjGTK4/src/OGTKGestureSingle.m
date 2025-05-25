/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@implementation OGTKGestureSingle

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_SINGLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GESTURE_SINGLE);
	return gObjectClass;
}

- (GtkGestureSingle*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GESTURE_SINGLE, GtkGestureSingle);
}

- (guint)button
{
	guint returnValue = (guint)gtk_gesture_single_get_button((GtkGestureSingle*)[self castedGObject]);

	return returnValue;
}

- (guint)currentButton
{
	guint returnValue = (guint)gtk_gesture_single_get_current_button((GtkGestureSingle*)[self castedGObject]);

	return returnValue;
}

- (GdkEventSequence*)currentSequence
{
	GdkEventSequence* returnValue = (GdkEventSequence*)gtk_gesture_single_get_current_sequence((GtkGestureSingle*)[self castedGObject]);

	return returnValue;
}

- (bool)exclusive
{
	bool returnValue = (bool)gtk_gesture_single_get_exclusive((GtkGestureSingle*)[self castedGObject]);

	return returnValue;
}

- (bool)touchOnly
{
	bool returnValue = (bool)gtk_gesture_single_get_touch_only((GtkGestureSingle*)[self castedGObject]);

	return returnValue;
}

- (void)setButton:(guint)button
{
	gtk_gesture_single_set_button((GtkGestureSingle*)[self castedGObject], button);
}

- (void)setExclusive:(bool)exclusive
{
	gtk_gesture_single_set_exclusive((GtkGestureSingle*)[self castedGObject], exclusive);
}

- (void)setTouchOnly:(bool)touchOnly
{
	gtk_gesture_single_set_touch_only((GtkGestureSingle*)[self castedGObject], touchOnly);
}


@end