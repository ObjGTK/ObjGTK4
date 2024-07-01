/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSettings.h"

#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKSettings

+ (OGTKSettings*)default
{
	GtkSettings* gobjectValue = GTK_SETTINGS(gtk_settings_get_default());

	OGTKSettings* returnValue = [OGTKSettings withGObject:gobjectValue];
	return returnValue;
}

+ (OGTKSettings*)forDisplay:(OGGdkDisplay*)display
{
	GtkSettings* gobjectValue = GTK_SETTINGS(gtk_settings_get_for_display([display castedGObject]));

	OGTKSettings* returnValue = [OGTKSettings withGObject:gobjectValue];
	return returnValue;
}

- (GtkSettings*)castedGObject
{
	return GTK_SETTINGS([self gObject]);
}

- (void)resetProperty:(OFString*)name
{
	gtk_settings_reset_property([self castedGObject], [name UTF8String]);
}


@end