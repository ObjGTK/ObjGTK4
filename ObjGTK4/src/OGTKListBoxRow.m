/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListBoxRow.h"

@implementation OGTKListBoxRow

- (instancetype)init
{
	GtkListBoxRow* gobjectValue = GTK_LIST_BOX_ROW(gtk_list_box_row_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkListBoxRow*)castedGObject
{
	return GTK_LIST_BOX_ROW([self gObject]);
}

- (void)changed
{
	gtk_list_box_row_changed([self castedGObject]);
}

- (bool)activatable
{
	bool returnValue = gtk_list_box_row_get_activatable([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_list_box_row_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)header
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_list_box_row_get_header([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (int)index
{
	int returnValue = gtk_list_box_row_get_index([self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = gtk_list_box_row_get_selectable([self castedGObject]);

	return returnValue;
}

- (bool)isSelected
{
	bool returnValue = gtk_list_box_row_is_selected([self castedGObject]);

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