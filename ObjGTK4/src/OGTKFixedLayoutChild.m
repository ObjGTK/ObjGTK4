/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixedLayoutChild.h"

@implementation OGTKFixedLayoutChild

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FIXED_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FIXED_LAYOUT_CHILD);
	return gObjectClass;
}

- (GtkFixedLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FIXED_LAYOUT_CHILD, GtkFixedLayoutChild);
}

- (GskTransform*)transform
{
	GskTransform* returnValue = (GskTransform*)gtk_fixed_layout_child_get_transform((GtkFixedLayoutChild*)[self castedGObject]);

	return returnValue;
}

- (void)setTransform:(GskTransform*)transform
{
	gtk_fixed_layout_child_set_transform((GtkFixedLayoutChild*)[self castedGObject], transform);
}


@end