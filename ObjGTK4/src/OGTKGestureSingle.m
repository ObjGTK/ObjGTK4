/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@implementation OGTKGestureSingle

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_SINGLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkGestureSingle*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureSingle, GtkGestureSingle);
}

- (guint)button
{
	guint returnValue = (guint)gtk_gesture_single_get_button([self castedGObject]);

	return returnValue;
}

- (guint)currentButton
{
	guint returnValue = (guint)gtk_gesture_single_get_current_button([self castedGObject]);

	return returnValue;
}

- (GdkEventSequence*)currentSequence
{
	GdkEventSequence* returnValue = (GdkEventSequence*)gtk_gesture_single_get_current_sequence([self castedGObject]);

	return returnValue;
}

- (bool)exclusive
{
	bool returnValue = (bool)gtk_gesture_single_get_exclusive([self castedGObject]);

	return returnValue;
}

- (bool)touchOnly
{
	bool returnValue = (bool)gtk_gesture_single_get_touch_only([self castedGObject]);

	return returnValue;
}

- (void)setButton:(guint)button
{
	gtk_gesture_single_set_button([self castedGObject], button);
}

- (void)setExclusive:(bool)exclusive
{
	gtk_gesture_single_set_exclusive([self castedGObject], exclusive);
}

- (void)setTouchOnly:(bool)touchOnly
{
	gtk_gesture_single_set_touch_only([self castedGObject], touchOnly);
}


@end