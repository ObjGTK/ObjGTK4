/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBoxLayout.h"

@implementation OGTKBoxLayout

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BOX_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_BOX_LAYOUT);
	return gObjectClass;
}

+ (instancetype)boxLayoutWithOrientation:(GtkOrientation)orientation
{
	GtkBoxLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_box_layout_new(orientation), GTK_TYPE_BOX_LAYOUT, GtkBoxLayout);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBoxLayout* wrapperObject;
	@try {
		wrapperObject = [[OGTKBoxLayout alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBoxLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_BOX_LAYOUT, GtkBoxLayout);
}

- (int)baselineChild
{
	int returnValue = (int)gtk_box_layout_get_baseline_child((GtkBoxLayout*)[self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_box_layout_get_baseline_position((GtkBoxLayout*)[self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = (bool)gtk_box_layout_get_homogeneous((GtkBoxLayout*)[self castedGObject]);

	return returnValue;
}

- (guint)spacing
{
	guint returnValue = (guint)gtk_box_layout_get_spacing((GtkBoxLayout*)[self castedGObject]);

	return returnValue;
}

- (void)setBaselineChild:(int)child
{
	gtk_box_layout_set_baseline_child((GtkBoxLayout*)[self castedGObject], child);
}

- (void)setBaselinePosition:(GtkBaselinePosition)position
{
	gtk_box_layout_set_baseline_position((GtkBoxLayout*)[self castedGObject], position);
}

- (void)setHomogeneous:(bool)homogeneous
{
	gtk_box_layout_set_homogeneous((GtkBoxLayout*)[self castedGObject], homogeneous);
}

- (void)setSpacing:(guint)spacing
{
	gtk_box_layout_set_spacing((GtkBoxLayout*)[self castedGObject], spacing);
}


@end