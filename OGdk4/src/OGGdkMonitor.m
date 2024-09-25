/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkMonitor.h"

#import "OGGdkDisplay.h"

@implementation OGGdkMonitor

- (GdkMonitor*)castedGObject
{
	return GDK_MONITOR([self gObject]);
}

- (OFString*)connector
{
	const char* gobjectValue = gdk_monitor_get_connector([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)description
{
	const char* gobjectValue = gdk_monitor_get_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_monitor_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (void)geometry:(GdkRectangle*)geometry
{
	gdk_monitor_get_geometry([self castedGObject], geometry);
}

- (int)heightMm
{
	int returnValue = gdk_monitor_get_height_mm([self castedGObject]);

	return returnValue;
}

- (OFString*)manufacturer
{
	const char* gobjectValue = gdk_monitor_get_manufacturer([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)model
{
	const char* gobjectValue = gdk_monitor_get_model([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)refreshRate
{
	int returnValue = gdk_monitor_get_refresh_rate([self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = gdk_monitor_get_scale([self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = gdk_monitor_get_scale_factor([self castedGObject]);

	return returnValue;
}

- (GdkSubpixelLayout)subpixelLayout
{
	GdkSubpixelLayout returnValue = gdk_monitor_get_subpixel_layout([self castedGObject]);

	return returnValue;
}

- (int)widthMm
{
	int returnValue = gdk_monitor_get_width_mm([self castedGObject]);

	return returnValue;
}

- (bool)isValid
{
	bool returnValue = gdk_monitor_is_valid([self castedGObject]);

	return returnValue;
}


@end