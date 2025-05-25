/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixed.h"

@implementation OGTKFixed

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FIXED;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FIXED);
	return gObjectClass;
}

+ (instancetype)fixed
{
	GtkFixed* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_fixed_new(), GTK_TYPE_FIXED, GtkFixed);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKFixed* wrapperObject;
	@try {
		wrapperObject = [[OGTKFixed alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFixed*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FIXED, GtkFixed);
}

- (void)childPositionWithWidget:(OGTKWidget*)widget x:(double*)x y:(double*)y
{
	gtk_fixed_get_child_position((GtkFixed*)[self castedGObject], [widget castedGObject], x, y);
}

- (GskTransform*)childTransformWithWidget:(OGTKWidget*)widget
{
	GskTransform* returnValue = (GskTransform*)gtk_fixed_get_child_transform((GtkFixed*)[self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (void)moveWithWidget:(OGTKWidget*)widget x:(double)x y:(double)y
{
	gtk_fixed_move((GtkFixed*)[self castedGObject], [widget castedGObject], x, y);
}

- (void)putWithWidget:(OGTKWidget*)widget x:(double)x y:(double)y
{
	gtk_fixed_put((GtkFixed*)[self castedGObject], [widget castedGObject], x, y);
}

- (void)removeWithWidget:(OGTKWidget*)widget
{
	gtk_fixed_remove((GtkFixed*)[self castedGObject], [widget castedGObject]);
}

- (void)setChildTransformWithWidget:(OGTKWidget*)widget transform:(GskTransform*)transform
{
	gtk_fixed_set_child_transform((GtkFixed*)[self castedGObject], [widget castedGObject], transform);
}


@end