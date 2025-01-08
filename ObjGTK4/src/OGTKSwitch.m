/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSwitch.h"

@implementation OGTKSwitch

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SWITCH;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkSwitch* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_switch_new(), GtkSwitch, GtkSwitch);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkSwitch*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSwitch, GtkSwitch);
}

- (bool)active
{
	bool returnValue = (bool)gtk_switch_get_active([self castedGObject]);

	return returnValue;
}

- (bool)state
{
	bool returnValue = (bool)gtk_switch_get_state([self castedGObject]);

	return returnValue;
}

- (void)setActive:(bool)isActive
{
	gtk_switch_set_active([self castedGObject], isActive);
}

- (void)setState:(bool)state
{
	gtk_switch_set_state([self castedGObject], state);
}


@end