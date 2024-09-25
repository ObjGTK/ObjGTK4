/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBoxLayout.h"

@implementation OGTKBoxLayout

- (instancetype)init:(GtkOrientation)orientation
{
	GtkBoxLayout* gobjectValue = GTK_BOX_LAYOUT(gtk_box_layout_new(orientation));

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

- (GtkBoxLayout*)castedGObject
{
	return GTK_BOX_LAYOUT([self gObject]);
}

- (int)baselineChild
{
	int returnValue = gtk_box_layout_get_baseline_child([self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = gtk_box_layout_get_baseline_position([self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = gtk_box_layout_get_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)spacing
{
	guint returnValue = gtk_box_layout_get_spacing([self castedGObject]);

	return returnValue;
}

- (void)setBaselineChild:(int)child
{
	gtk_box_layout_set_baseline_child([self castedGObject], child);
}

- (void)setBaselinePosition:(GtkBaselinePosition)position
{
	gtk_box_layout_set_baseline_position([self castedGObject], position);
}

- (void)setHomogeneous:(bool)homogeneous
{
	gtk_box_layout_set_homogeneous([self castedGObject], homogeneous);
}

- (void)setSpacing:(guint)spacing
{
	gtk_box_layout_set_spacing([self castedGObject], spacing);
}


@end