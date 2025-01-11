/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesturePan.h"

#import "OGTKGesture.h"

@implementation OGTKGesturePan

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_PAN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gesturePan:(GtkOrientation)orientation
{
	GtkGesturePan* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_pan_new(orientation), GtkGesturePan, GtkGesturePan);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGesturePan* wrapperObject;
	@try {
		wrapperObject = [[OGTKGesturePan alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGesturePan*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGesturePan, GtkGesturePan);
}

- (GtkOrientation)orientation
{
	GtkOrientation returnValue = (GtkOrientation)gtk_gesture_pan_get_orientation([self castedGObject]);

	return returnValue;
}

- (void)setOrientation:(GtkOrientation)orientation
{
	gtk_gesture_pan_set_orientation([self castedGObject], orientation);
}


@end