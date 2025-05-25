/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureLongPress.h"

#import "OGTKGesture.h"

@implementation OGTKGestureLongPress

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_LONG_PRESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GESTURE_LONG_PRESS);
	return gObjectClass;
}

+ (instancetype)gestureLongPress
{
	GtkGestureLongPress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_long_press_new(), GTK_TYPE_GESTURE_LONG_PRESS, GtkGestureLongPress);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGestureLongPress* wrapperObject;
	@try {
		wrapperObject = [[OGTKGestureLongPress alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGestureLongPress*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GESTURE_LONG_PRESS, GtkGestureLongPress);
}

- (double)delayFactor
{
	double returnValue = (double)gtk_gesture_long_press_get_delay_factor((GtkGestureLongPress*)[self castedGObject]);

	return returnValue;
}

- (void)setDelayFactor:(double)delayFactor
{
	gtk_gesture_long_press_set_delay_factor((GtkGestureLongPress*)[self castedGObject], delayFactor);
}


@end