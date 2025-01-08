/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListHeader.h"

#import "OGTKWidget.h"

@implementation OGTKListHeader

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_HEADER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkListHeader*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkListHeader, GtkListHeader);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_list_header_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)end
{
	guint returnValue = (guint)gtk_list_header_get_end([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_list_header_get_item([self castedGObject]);

	return returnValue;
}

- (guint)nitems
{
	guint returnValue = (guint)gtk_list_header_get_n_items([self castedGObject]);

	return returnValue;
}

- (guint)start
{
	guint returnValue = (guint)gtk_list_header_get_start([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_list_header_set_child([self castedGObject], [child castedGObject]);
}


@end