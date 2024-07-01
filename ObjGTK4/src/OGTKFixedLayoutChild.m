/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixedLayoutChild.h"

@implementation OGTKFixedLayoutChild

- (GtkFixedLayoutChild*)castedGObject
{
	return GTK_FIXED_LAYOUT_CHILD([self gObject]);
}

- (GskTransform*)transform
{
	GskTransform* returnValue = gtk_fixed_layout_child_get_transform([self castedGObject]);

	return returnValue;
}

- (void)setTransform:(GskTransform*)transform
{
	gtk_fixed_layout_child_set_transform([self castedGObject], transform);
}


@end