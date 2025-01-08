/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerLegacy.h"

@implementation OGTKEventControllerLegacy

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVENT_CONTROLLER_LEGACY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkEventControllerLegacy* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_event_controller_legacy_new(), GtkEventControllerLegacy, GtkEventControllerLegacy);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkEventControllerLegacy*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEventControllerLegacy, GtkEventControllerLegacy);
}


@end