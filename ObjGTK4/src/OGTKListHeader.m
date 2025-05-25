/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListHeader.h"

#import "OGTKWidget.h"

@implementation OGTKListHeader

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_HEADER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LIST_HEADER);
	return gObjectClass;
}

- (GtkListHeader*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LIST_HEADER, GtkListHeader);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_list_header_get_child((GtkListHeader*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)end
{
	guint returnValue = (guint)gtk_list_header_get_end((GtkListHeader*)[self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_list_header_get_item((GtkListHeader*)[self castedGObject]);

	return returnValue;
}

- (guint)nitems
{
	guint returnValue = (guint)gtk_list_header_get_n_items((GtkListHeader*)[self castedGObject]);

	return returnValue;
}

- (guint)start
{
	guint returnValue = (guint)gtk_list_header_get_start((GtkListHeader*)[self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_list_header_set_child((GtkListHeader*)[self castedGObject], [child castedGObject]);
}


@end