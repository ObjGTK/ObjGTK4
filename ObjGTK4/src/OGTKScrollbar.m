/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScrollbar.h"

#import "OGTKAdjustment.h"

@implementation OGTKScrollbar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SCROLLBAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SCROLLBAR);
	return gObjectClass;
}

+ (instancetype)scrollbarWithOrientation:(GtkOrientation)orientation adjustment:(OGTKAdjustment*)adjustment
{
	GtkScrollbar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_scrollbar_new(orientation, [adjustment castedGObject]), GTK_TYPE_SCROLLBAR, GtkScrollbar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKScrollbar* wrapperObject;
	@try {
		wrapperObject = [[OGTKScrollbar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkScrollbar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SCROLLBAR, GtkScrollbar);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_scrollbar_get_adjustment((GtkScrollbar*)[self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_scrollbar_set_adjustment((GtkScrollbar*)[self castedGObject], [adjustment castedGObject]);
}


@end