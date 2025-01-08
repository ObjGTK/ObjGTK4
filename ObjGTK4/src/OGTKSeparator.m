/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSeparator.h"

@implementation OGTKSeparator

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SEPARATOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithOrientation:(GtkOrientation)orientation
{
	GtkSeparator* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_separator_new(orientation), GtkSeparator, GtkSeparator);

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

- (GtkSeparator*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSeparator, GtkSeparator);
}


@end