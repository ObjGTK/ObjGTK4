/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraintLayoutChild.h"

@implementation OGTKConstraintLayoutChild

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CONSTRAINT_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkConstraintLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkConstraintLayoutChild, GtkConstraintLayoutChild);
}


@end