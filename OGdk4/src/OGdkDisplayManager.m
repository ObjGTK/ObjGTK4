/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDisplayManager.h"

#import "OGdkDisplay.h"

@implementation OGdkDisplayManager

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DISPLAY_MANAGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_DISPLAY_MANAGER);
	return gObjectClass;
}

+ (OGdkDisplayManager*)get
{
	GdkDisplayManager* gobjectValue = gdk_display_manager_get();

	OGdkDisplayManager* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkDisplayManager*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_DISPLAY_MANAGER, GdkDisplayManager);
}

- (OGdkDisplay*)defaultDisplay
{
	GdkDisplay* gobjectValue = gdk_display_manager_get_default_display((GdkDisplayManager*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GSList*)listDisplays
{
	GSList* returnValue = (GSList*)gdk_display_manager_list_displays((GdkDisplayManager*)[self castedGObject]);

	return returnValue;
}

- (OGdkDisplay*)openDisplayWithName:(OFString*)name
{
	GdkDisplay* gobjectValue = gdk_display_manager_open_display((GdkDisplayManager*)[self castedGObject], [name UTF8String]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setDefaultDisplay:(OGdkDisplay*)display
{
	gdk_display_manager_set_default_display((GdkDisplayManager*)[self castedGObject], [display castedGObject]);
}


@end