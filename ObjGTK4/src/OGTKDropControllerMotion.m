/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropControllerMotion.h"

#import <OGdk4/OGdkDrop.h>

@implementation OGTKDropControllerMotion

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DROP_CONTROLLER_MOTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DROP_CONTROLLER_MOTION);
	return gObjectClass;
}

+ (instancetype)dropControllerMotion
{
	GtkDropControllerMotion* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_controller_motion_new(), GTK_TYPE_DROP_CONTROLLER_MOTION, GtkDropControllerMotion);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKDropControllerMotion* wrapperObject;
	@try {
		wrapperObject = [[OGTKDropControllerMotion alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDropControllerMotion*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DROP_CONTROLLER_MOTION, GtkDropControllerMotion);
}

- (bool)containsPointer
{
	bool returnValue = (bool)gtk_drop_controller_motion_contains_pointer((GtkDropControllerMotion*)[self castedGObject]);

	return returnValue;
}

- (OGdkDrop*)drop
{
	GdkDrop* gobjectValue = gtk_drop_controller_motion_get_drop((GtkDropControllerMotion*)[self castedGObject]);

	OGdkDrop* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isPointer
{
	bool returnValue = (bool)gtk_drop_controller_motion_is_pointer((GtkDropControllerMotion*)[self castedGObject]);

	return returnValue;
}


@end