/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKActivateAction.h"

@implementation OGTKActivateAction

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ACTIVATE_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGTKShortcutAction*)get
{
	GtkShortcutAction* gobjectValue = gtk_activate_action_get();

	OGTKShortcutAction* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkActivateAction*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkActivateAction, GtkActivateAction);
}


@end