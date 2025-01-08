/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkAppLaunchContext.h"

#import "OGdkDisplay.h"

@implementation OGdkAppLaunchContext

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_APP_LAUNCH_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkAppLaunchContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkAppLaunchContext, GdkAppLaunchContext);
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_app_launch_context_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setDesktop:(int)desktop
{
	gdk_app_launch_context_set_desktop([self castedGObject], desktop);
}

- (void)setIcon:(GIcon*)icon
{
	gdk_app_launch_context_set_icon([self castedGObject], icon);
}

- (void)setIconName:(OFString*)iconName
{
	gdk_app_launch_context_set_icon_name([self castedGObject], [iconName UTF8String]);
}

- (void)setTimestamp:(guint32)timestamp
{
	gdk_app_launch_context_set_timestamp([self castedGObject], timestamp);
}


@end