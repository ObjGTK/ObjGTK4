/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFlowBoxChild.h"

@implementation OGTKFlowBoxChild

- (instancetype)init
{
	GtkFlowBoxChild* gobjectValue = GTK_FLOW_BOX_CHILD(gtk_flow_box_child_new());

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

- (GtkFlowBoxChild*)castedGObject
{
	return GTK_FLOW_BOX_CHILD([self gObject]);
}

- (void)changed
{
	gtk_flow_box_child_changed([self castedGObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_flow_box_child_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (int)index
{
	int returnValue = gtk_flow_box_child_get_index([self castedGObject]);

	return returnValue;
}

- (bool)isSelected
{
	bool returnValue = gtk_flow_box_child_is_selected([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_flow_box_child_set_child([self castedGObject], [child castedGObject]);
}


@end