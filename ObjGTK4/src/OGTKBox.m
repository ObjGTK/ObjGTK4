/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

@implementation OGTKBox

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_BOX);
	return gObjectClass;
}

+ (instancetype)boxWithOrientation:(GtkOrientation)orientation spacing:(int)spacing
{
	GtkBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_box_new(orientation, spacing), GTK_TYPE_BOX, GtkBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_BOX, GtkBox);
}

- (void)appendWithChild:(OGTKWidget*)child
{
	gtk_box_append((GtkBox*)[self castedGObject], [child castedGObject]);
}

- (int)baselineChild
{
	int returnValue = (int)gtk_box_get_baseline_child((GtkBox*)[self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_box_get_baseline_position((GtkBox*)[self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = (bool)gtk_box_get_homogeneous((GtkBox*)[self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = (int)gtk_box_get_spacing((GtkBox*)[self castedGObject]);

	return returnValue;
}

- (void)insertChildAfter:(OGTKWidget*)child sibling:(OGTKWidget*)sibling
{
	gtk_box_insert_child_after((GtkBox*)[self castedGObject], [child castedGObject], [sibling castedGObject]);
}

- (void)prependWithChild:(OGTKWidget*)child
{
	gtk_box_prepend((GtkBox*)[self castedGObject], [child castedGObject]);
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_box_remove((GtkBox*)[self castedGObject], [child castedGObject]);
}

- (void)reorderChildAfter:(OGTKWidget*)child sibling:(OGTKWidget*)sibling
{
	gtk_box_reorder_child_after((GtkBox*)[self castedGObject], [child castedGObject], [sibling castedGObject]);
}

- (void)setBaselineChild:(int)child
{
	gtk_box_set_baseline_child((GtkBox*)[self castedGObject], child);
}

- (void)setBaselinePosition:(GtkBaselinePosition)position
{
	gtk_box_set_baseline_position((GtkBox*)[self castedGObject], position);
}

- (void)setHomogeneous:(bool)homogeneous
{
	gtk_box_set_homogeneous((GtkBox*)[self castedGObject], homogeneous);
}

- (void)setSpacing:(int)spacing
{
	gtk_box_set_spacing((GtkBox*)[self castedGObject], spacing);
}


@end