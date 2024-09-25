/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListItem.h"

#import "OGTKWidget.h"

@implementation OGTKListItem

- (GtkListItem*)castedGObject
{
	return GTK_LIST_ITEM([self gObject]);
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
	bool returnValue = gtk_list_item_get_activatable([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_list_item_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)focusable
{
	bool returnValue = gtk_list_item_get_focusable([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = gtk_list_item_get_item([self castedGObject]);

	return returnValue;
}

- (guint)position
{
	guint returnValue = gtk_list_item_get_position([self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = gtk_list_item_get_selectable([self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = gtk_list_item_get_selected([self castedGObject]);

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