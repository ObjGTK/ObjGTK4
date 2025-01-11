/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

@implementation OGTKBox

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)boxWithOrientation:(GtkOrientation)orientation spacing:(int)spacing
{
	GtkBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_box_new(orientation, spacing), GtkBox, GtkBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBox*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBox, GtkBox);
}

- (void)append:(OGTKWidget*)child
{
	gtk_box_append([self castedGObject], [child castedGObject]);
}

- (int)baselineChild
{
	int returnValue = (int)gtk_box_get_baseline_child([self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_box_get_baseline_position([self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = (bool)gtk_box_get_homogeneous([self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = (int)gtk_box_get_spacing([self castedGObject]);

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