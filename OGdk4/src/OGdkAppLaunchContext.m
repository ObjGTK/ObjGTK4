/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkAppLaunchContext.h"

#import "OGdkDisplay.h"

@implementation OGdkAppLaunchContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_APP_LAUNCH_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_APP_LAUNCH_CONTEXT);
	return gObjectClass;
}

- (GdkAppLaunchContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_APP_LAUNCH_CONTEXT, GdkAppLaunchContext);
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_app_launch_context_get_display((GdkAppLaunchContext*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setDesktop:(int)desktop
{
	gdk_app_launch_context_set_desktop((GdkAppLaunchContext*)[self castedGObject], desktop);
}

- (void)setIcon:(GIcon*)icon
{
	gdk_app_launch_context_set_icon((GdkAppLaunchContext*)[self castedGObject], icon);
}

- (void)setIconName:(OFString*)iconName
{
	gdk_app_launch_context_set_icon_name((GdkAppLaunchContext*)[self castedGObject], [iconName UTF8String]);
}

- (void)setTimestamp:(guint32)timestamp
{
	gdk_app_launch_context_set_timestamp((GdkAppLaunchContext*)[self castedGObject], timestamp);
}


@end