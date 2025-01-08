/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNothingAction.h"

@implementation OGTKNothingAction

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NOTHING_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGTKShortcutAction*)get
{
	GtkShortcutAction* gobjectValue = gtk_nothing_action_get();

	OGTKShortcutAction* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkNothingAction*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkNothingAction, GtkNothingAction);
}


@end