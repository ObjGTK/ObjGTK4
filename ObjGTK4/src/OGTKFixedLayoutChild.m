/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixedLayoutChild.h"

@implementation OGTKFixedLayoutChild

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FIXED_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkFixedLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFixedLayoutChild, GtkFixedLayoutChild);
}

- (GskTransform*)transform
{
	GskTransform* returnValue = (GskTransform*)gtk_fixed_layout_child_get_transform([self castedGObject]);

	return returnValue;
}

- (void)setTransform:(GskTransform*)transform
{
	gtk_fixed_layout_child_set_transform([self castedGObject], transform);
}


@end