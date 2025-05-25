/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

#import "OGTKLayoutChild.h"
#import "OGTKWidget.h"

@implementation OGTKLayoutManager

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LAYOUT_MANAGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LAYOUT_MANAGER);
	return gObjectClass;
}

- (GtkLayoutManager*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LAYOUT_MANAGER, GtkLayoutManager);
}

- (void)allocateWithWidget:(OGTKWidget*)widget width:(int)width height:(int)height baseline:(int)baseline
{
	gtk_layout_manager_allocate((GtkLayoutManager*)[self castedGObject], [widget castedGObject], width, height, baseline);
}

- (OGTKLayoutChild*)layoutChild:(OGTKWidget*)child
{
	GtkLayoutChild* gobjectValue = gtk_layout_manager_get_layout_child((GtkLayoutManager*)[self castedGObject], [child castedGObject]);

	OGTKLayoutChild* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = (GtkSizeRequestMode)gtk_layout_manager_get_request_mode((GtkLayoutManager*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = gtk_layout_manager_get_widget((GtkLayoutManager*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)layoutChanged
{
	gtk_layout_manager_layout_changed((GtkLayoutManager*)[self castedGObject]);
}

- (void)measureWithWidget:(OGTKWidget*)widget orientation:(GtkOrientation)orientation forSize:(int)forSize minimum:(int*)minimum natural:(int*)natural minimumBaseline:(int*)minimumBaseline naturalBaseline:(int*)naturalBaseline
{
	gtk_layout_manager_measure((GtkLayoutManager*)[self castedGObject], [widget castedGObject], orientation, forSize, minimum, natural, minimumBaseline, naturalBaseline);
}


@end