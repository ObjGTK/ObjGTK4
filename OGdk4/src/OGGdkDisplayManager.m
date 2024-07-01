/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDisplayManager.h"

#import "OGGdkDisplay.h"

@implementation OGGdkDisplayManager

+ (OGGdkDisplayManager*)get
{
	GdkDisplayManager* gobjectValue = GDK_DISPLAY_MANAGER(gdk_display_manager_get());

	OGGdkDisplayManager* returnValue = [OGGdkDisplayManager withGObject:gobjectValue];
	return returnValue;
}

- (GdkDisplayManager*)castedGObject
{
	return GDK_DISPLAY_MANAGER([self gObject]);
}

- (OGGdkDisplay*)defaultDisplay
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_display_manager_get_default_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (GSList*)listDisplays
{
	GSList* returnValue = gdk_display_manager_list_displays([self castedGObject]);

	return returnValue;
}

- (OGGdkDisplay*)openDisplay:(OFString*)name
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_display_manager_open_display([self castedGObject], [name UTF8String]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (void)setDefaultDisplay:(OGGdkDisplay*)display
{
	gdk_display_manager_set_default_display([self castedGObject], [display castedGObject]);
}


@end