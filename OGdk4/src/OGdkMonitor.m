/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkMonitor.h"

#import "OGdkDisplay.h"

@implementation OGdkMonitor

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_MONITOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_MONITOR);
	return gObjectClass;
}

- (GdkMonitor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_MONITOR, GdkMonitor);
}

- (OFString*)connector
{
	const char* gobjectValue = gdk_monitor_get_connector((GdkMonitor*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)description
{
	const char* gobjectValue = gdk_monitor_get_description((GdkMonitor*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_monitor_get_display((GdkMonitor*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)geometryWithGeometry:(GdkRectangle*)geometry
{
	gdk_monitor_get_geometry((GdkMonitor*)[self castedGObject], geometry);
}

- (int)heightMm
{
	int returnValue = (int)gdk_monitor_get_height_mm((GdkMonitor*)[self castedGObject]);

	return returnValue;
}

- (OFString*)manufacturer
{
	const char* gobjectValue = gdk_monitor_get_manufacturer((GdkMonitor*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)model
{
	const char* gobjectValue = gdk_monitor_get_model((GdkMonitor*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)refreshRate
{
	int returnValue = (int)gdk_monitor_get_refresh_rate((GdkMonitor*)[self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = (double)gdk_monitor_get_scale((GdkMonitor*)[self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = (int)gdk_monitor_get_scale_factor((GdkMonitor*)[self castedGObject]);

	return returnValue;
}

- (GdkSubpixelLayout)subpixelLayout
{
	GdkSubpixelLayout returnValue = (GdkSubpixelLayout)gdk_monitor_get_subpixel_layout((GdkMonitor*)[self castedGObject]);

	return returnValue;
}

- (int)widthMm
{
	int returnValue = (int)gdk_monitor_get_width_mm((GdkMonitor*)[self castedGObject]);

	return returnValue;
}

- (bool)isValid
{
	bool returnValue = (bool)gdk_monitor_is_valid((GdkMonitor*)[self castedGObject]);

	return returnValue;
}


@end