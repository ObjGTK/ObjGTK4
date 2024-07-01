/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPaned.h"

@implementation OGTKPaned

- (instancetype)init:(GtkOrientation)orientation
{
	GtkPaned* gobjectValue = GTK_PANED(gtk_paned_new(orientation));

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

- (GtkPaned*)castedGObject
{
	return GTK_PANED([self gObject]);
}

- (OGTKWidget*)endChild
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_paned_get_end_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (int)position
{
	int returnValue = gtk_paned_get_position([self castedGObject]);

	return returnValue;
}

- (bool)resizeEndChild
{
	bool returnValue = gtk_paned_get_resize_end_child([self castedGObject]);

	return returnValue;
}

- (bool)resizeStartChild
{
	bool returnValue = gtk_paned_get_resize_start_child([self castedGObject]);

	return returnValue;
}

- (bool)shrinkEndChild
{
	bool returnValue = gtk_paned_get_shrink_end_child([self castedGObject]);

	return returnValue;
}

- (bool)shrinkStartChild
{
	bool returnValue = gtk_paned_get_shrink_start_child([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)startChild
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_paned_get_start_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)wideHandle
{
	bool returnValue = gtk_paned_get_wide_handle([self castedGObject]);

	return returnValue;
}

- (void)setEndChild:(OGTKWidget*)child
{
	gtk_paned_set_end_child([self castedGObject], [child castedGObject]);
}

- (void)setPosition:(int)position
{
	gtk_paned_set_position([self castedGObject], position);
}

- (void)setResizeEndChild:(bool)resize
{
	gtk_paned_set_resize_end_child([self castedGObject], resize);
}

- (void)setResizeStartChild:(bool)resize
{
	gtk_paned_set_resize_start_child([self castedGObject], resize);
}

- (void)setShrinkEndChild:(bool)resize
{
	gtk_paned_set_shrink_end_child([self castedGObject], resize);
}

- (void)setShrinkStartChild:(bool)resize
{
	gtk_paned_set_shrink_start_child([self castedGObject], resize);
}

- (void)setStartChild:(OGTKWidget*)child
{
	gtk_paned_set_start_child([self castedGObject], [child castedGObject]);
}

- (void)setWideHandle:(bool)wide
{
	gtk_paned_set_wide_handle([self castedGObject], wide);
}


@end