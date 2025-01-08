/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSpinner.h"

@implementation OGTKSpinner

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SPINNER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkSpinner* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_spinner_new(), GtkSpinner, GtkSpinner);

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

- (GtkSpinner*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSpinner, GtkSpinner);
}

- (bool)spinning
{
	bool returnValue = (bool)gtk_spinner_get_spinning([self castedGObject]);

	return returnValue;
}

- (void)setSpinning:(bool)spinning
{
	gtk_spinner_set_spinning([self castedGObject], spinning);
}

- (void)start
{
	gtk_spinner_start([self castedGObject]);
}

- (void)stop
{
	gtk_spinner_stop([self castedGObject]);
}


@end