/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomLayout.h"

@implementation OGTKCustomLayout

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CUSTOM_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CUSTOM_LAYOUT);
	return gObjectClass;
}

+ (instancetype)customLayoutWithRequestMode:(GtkCustomRequestModeFunc)requestMode measure:(GtkCustomMeasureFunc)measure allocate:(GtkCustomAllocateFunc)allocate
{
	GtkCustomLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_custom_layout_new(requestMode, measure, allocate), GTK_TYPE_CUSTOM_LAYOUT, GtkCustomLayout);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKCustomLayout* wrapperObject;
	@try {
		wrapperObject = [[OGTKCustomLayout alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCustomLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CUSTOM_LAYOUT, GtkCustomLayout);
}


@end