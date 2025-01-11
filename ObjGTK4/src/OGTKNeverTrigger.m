/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNeverTrigger.h"

@implementation OGTKNeverTrigger

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NEVER_TRIGGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGTKShortcutTrigger*)get
{
	GtkShortcutTrigger* gobjectValue = gtk_never_trigger_get();

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkNeverTrigger*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkNeverTrigger, GtkNeverTrigger);
}


@end