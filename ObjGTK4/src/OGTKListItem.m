/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListItem.h"

#import "OGTKWidget.h"

@implementation OGTKListItem

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_ITEM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkListItem*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkListItem, GtkListItem);
}

- (OFString*)accessibleDescription
{
	const char* gobjectValue = gtk_list_item_get_accessible_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)accessibleLabel
{
	const char* gobjectValue = gtk_list_item_get_accessible_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)activatable
{
	bool returnValue = (bool)gtk_list_item_get_activatable([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_list_item_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)focusable
{
	bool returnValue = (bool)gtk_list_item_get_focusable([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_list_item_get_item([self castedGObject]);

	return returnValue;
}

- (guint)position
{
	guint returnValue = (guint)gtk_list_item_get_position([self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = (bool)gtk_list_item_get_selectable([self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = (bool)gtk_list_item_get_selected([self castedGObject]);

	return returnValue;
}

- (void)setAccessibleDescription:(OFString*)description
{
	gtk_list_item_set_accessible_description([self castedGObject], [description UTF8String]);
}

- (void)setAccessibleLabel:(OFString*)label
{
	gtk_list_item_set_accessible_label([self castedGObject], [label UTF8String]);
}

- (void)setActivatable:(bool)activatable
{
	gtk_list_item_set_activatable([self castedGObject], activatable);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_list_item_set_child([self castedGObject], [child castedGObject]);
}

- (void)setFocusable:(bool)focusable
{
	gtk_list_item_set_focusable([self castedGObject], focusable);
}

- (void)setSelectable:(bool)selectable
{
	gtk_list_item_set_selectable([self castedGObject], selectable);
}


@end