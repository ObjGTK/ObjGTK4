/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPaned.h"

@implementation OGTKPaned

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PANED;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)paned:(GtkOrientation)orientation
{
	GtkPaned* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_paned_new(orientation), GtkPaned, GtkPaned);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPaned* wrapperObject;
	@try {
		wrapperObject = [[OGTKPaned alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPaned*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPaned, GtkPaned);
}

- (OGTKWidget*)endChild
{
	GtkWidget* gobjectValue = gtk_paned_get_end_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)position
{
	int returnValue = (int)gtk_paned_get_position([self castedGObject]);

	return returnValue;
}

- (bool)resizeEndChild
{
	bool returnValue = (bool)gtk_paned_get_resize_end_child([self castedGObject]);

	return returnValue;
}

- (bool)resizeStartChild
{
	bool returnValue = (bool)gtk_paned_get_resize_start_child([self castedGObject]);

	return returnValue;
}

- (bool)shrinkEndChild
{
	bool returnValue = (bool)gtk_paned_get_shrink_end_child([self castedGObject]);

	return returnValue;
}

- (bool)shrinkStartChild
{
	bool returnValue = (bool)gtk_paned_get_shrink_start_child([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)startChild
{
	GtkWidget* gobjectValue = gtk_paned_get_start_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)wideHandle
{
	bool returnValue = (bool)gtk_paned_get_wide_handle([self castedGObject]);

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