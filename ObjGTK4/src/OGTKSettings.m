/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSettings.h"

#import <OGdk4/OGdkDisplay.h>

@implementation OGTKSettings

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SETTINGS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SETTINGS);
	return gObjectClass;
}

+ (OGTKSettings*)default
{
	GtkSettings* gobjectValue = gtk_settings_get_default();

	OGTKSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (OGTKSettings*)forDisplay:(OGdkDisplay*)display
{
	GtkSettings* gobjectValue = gtk_settings_get_for_display([display castedGObject]);

	OGTKSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SETTINGS, GtkSettings);
}

- (void)resetPropertyWithName:(OFString*)name
{
	gtk_settings_reset_property((GtkSettings*)[self castedGObject], [name UTF8String]);
}


@end