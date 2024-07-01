/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkAppLaunchContext.h"

#import "OGGdkDisplay.h"

@implementation OGGdkAppLaunchContext

- (GdkAppLaunchContext*)castedGObject
{
	return GDK_APP_LAUNCH_CONTEXT([self gObject]);
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_app_launch_context_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
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