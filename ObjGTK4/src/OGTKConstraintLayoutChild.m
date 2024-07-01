/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraintLayoutChild.h"

@implementation OGTKConstraintLayoutChild

- (GtkConstraintLayoutChild*)castedGObject
{
	return GTK_CONSTRAINT_LAYOUT_CHILD([self gObject]);
}


@end