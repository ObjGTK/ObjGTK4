/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScrollbar.h"

#import "OGTKAdjustment.h"

@implementation OGTKScrollbar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SCROLLBAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithOrientation:(GtkOrientation)orientation adjustment:(OGTKAdjustment*)adjustment
{
	GtkScrollbar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_scrollbar_new(orientation, [adjustment castedGObject]), GtkScrollbar, GtkScrollbar);

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

- (GtkScrollbar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkScrollbar, GtkScrollbar);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_scrollbar_get_adjustment([self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_scrollbar_set_adjustment([self castedGObject], [adjustment castedGObject]);
}


@end