/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

@implementation OGTKBox

- (instancetype)initWithOrientation:(GtkOrientation)orientation spacing:(int)spacing
{
	GtkBox* gobjectValue = GTK_BOX(gtk_box_new(orientation, spacing));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkBox*)castedGObject
{
	return GTK_BOX([self gObject]);
}

- (void)append:(OGTKWidget*)child
{
	gtk_box_append([self castedGObject], [child castedGObject]);
}

- (int)baselineChild
{
	int returnValue = gtk_box_get_baseline_child([self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = gtk_box_get_baseline_position([self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = gtk_box_get_homogeneous([self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = gtk_box_get_spacing([self castedGObject]);

	return returnValue;
}

- (void)insertChildAfterWithChild:(OGTKWidget*)child sibling:(OGTKWidget*)sibling
{
	gtk_box_insert_child_after([self castedGObject], [child castedGObject], [sibling castedGObject]);
}

- (void)prepend:(OGTKWidget*)child
{
	gtk_box_prepend([self castedGObject], [child castedGObject]);
}

- (void)remove:(OGTKWidget*)child
{
	gtk_box_remove([self castedGObject], [child castedGObject]);
}

- (void)reorderChildAfterWithChild:(OGTKWidget*)child sibling:(OGTKWidget*)sibling
{
	gtk_box_reorder_child_after([self castedGObject], [child castedGObject], [sibling castedGObject]);
}

- (void)setBaselineChild:(int)child
{
	gtk_box_set_baseline_child([self castedGObject], child);
}

- (void)setBaselinePosition:(GtkBaselinePosition)position
{
	gtk_box_set_baseline_position([self castedGObject], position);
}

- (void)setHomogeneous:(bool)homogeneous
{
	gtk_box_set_homogeneous([self castedGObject], homogeneous);
}

- (void)setSpacing:(int)spacing
{
	gtk_box_set_spacing([self castedGObject], spacing);
}


@end