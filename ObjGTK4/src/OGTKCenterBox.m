/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCenterBox.h"

@implementation OGTKCenterBox

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CENTER_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CENTER_BOX);
	return gObjectClass;
}

+ (instancetype)centerBox
{
	GtkCenterBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_center_box_new(), GTK_TYPE_CENTER_BOX, GtkCenterBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCenterBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKCenterBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCenterBox*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CENTER_BOX, GtkCenterBox);
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_center_box_get_baseline_position((GtkCenterBox*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)centerWidget
{
	GtkWidget* gobjectValue = gtk_center_box_get_center_widget((GtkCenterBox*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)endWidget
{
	GtkWidget* gobjectValue = gtk_center_box_get_end_widget((GtkCenterBox*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)shrinkCenterLast
{
	bool returnValue = (bool)gtk_center_box_get_shrink_center_last((GtkCenterBox*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)startWidget
{
	GtkWidget* gobjectValue = gtk_center_box_get_start_widget((GtkCenterBox*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setBaselinePosition:(GtkBaselinePosition)position
{
	gtk_center_box_set_baseline_position((GtkCenterBox*)[self castedGObject], position);
}

- (void)setCenterWidgetWithChild:(OGTKWidget*)child
{
	gtk_center_box_set_center_widget((GtkCenterBox*)[self castedGObject], [child castedGObject]);
}

- (void)setEndWidgetWithChild:(OGTKWidget*)child
{
	gtk_center_box_set_end_widget((GtkCenterBox*)[self castedGObject], [child castedGObject]);
}

- (void)setShrinkCenterLast:(bool)shrinkCenterLast
{
	gtk_center_box_set_shrink_center_last((GtkCenterBox*)[self castedGObject], shrinkCenterLast);
}

- (void)setStartWidgetWithChild:(OGTKWidget*)child
{
	gtk_center_box_set_start_widget((GtkCenterBox*)[self castedGObject], [child castedGObject]);
}


@end