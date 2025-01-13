/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListBoxRow.h"

@implementation OGTKListBoxRow

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_BOX_ROW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)listBoxRow
{
	GtkListBoxRow* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_list_box_row_new(), GtkListBoxRow, GtkListBoxRow);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKListBoxRow* wrapperObject;
	@try {
		wrapperObject = [[OGTKListBoxRow alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkListBoxRow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkListBoxRow, GtkListBoxRow);
}

- (void)changed
{
	gtk_list_box_row_changed([self castedGObject]);
}

- (bool)activatable
{
	bool returnValue = (bool)gtk_list_box_row_get_activatable([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_list_box_row_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)header
{
	GtkWidget* gobjectValue = gtk_list_box_row_get_header([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)index
{
	int returnValue = (int)gtk_list_box_row_get_index([self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = (bool)gtk_list_box_row_get_selectable([self castedGObject]);

	return returnValue;
}

- (bool)isSelected
{
	bool returnValue = (bool)gtk_list_box_row_is_selected([self castedGObject]);

	return returnValue;
}

- (void)setActivatable:(bool)activatable
{
	gtk_list_box_row_set_activatable([self castedGObject], activatable);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_list_box_row_set_child([self castedGObject], [child castedGObject]);
}

- (void)setHeader:(OGTKWidget*)header
{
	gtk_list_box_row_set_header([self castedGObject], [header castedGObject]);
}

- (void)setSelectable:(bool)selectable
{
	gtk_list_box_row_set_selectable([self castedGObject], selectable);
}


@end