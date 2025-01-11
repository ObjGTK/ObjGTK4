/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureRotate.h"

@implementation OGTKGestureRotate

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_ROTATE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gestureRotate
{
	GtkGestureRotate* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_rotate_new(), GtkGestureRotate, GtkGestureRotate);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGestureRotate* wrapperObject;
	@try {
		wrapperObject = [[OGTKGestureRotate alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGestureRotate*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureRotate, GtkGestureRotate);
}

- (double)angleDelta
{
	double returnValue = (double)gtk_gesture_rotate_get_angle_delta([self castedGObject]);

	return returnValue;
}


@end