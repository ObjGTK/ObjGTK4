/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCenterLayout.h"

#import "OGTKWidget.h"

@implementation OGTKCenterLayout

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CENTER_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkCenterLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_center_layout_new(), GtkCenterLayout, GtkCenterLayout);

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

- (GtkCenterLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCenterLayout, GtkCenterLayout);
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_center_layout_get_baseline_position([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)centerWidget
{
	GtkWidget* gobjectValue = gtk_center_layout_get_center_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)endWidget
{
	GtkWidget* gobjectValue = gtk_center_layout_get_end_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkOrientation)orientation
{
	GtkOrientation returnValue = (GtkOrientation)gtk_center_layout_get_orientation([self castedGObject]);

	return returnValue;
}

- (bool)shrinkCenterLast
{
	bool returnValue = (bool)gtk_center_layout_get_shrink_center_last([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)startWidget
{
	GtkWidget* gobjectValue = gtk_center_layout_get_start_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setBaselinePosition:(GtkBaselinePosition)baselinePosition
{
	gtk_center_layout_set_baseline_position([self castedGObject], baselinePosition);
}

- (void)setCenterWidget:(OGTKWidget*)widget
{
	gtk_center_layout_set_center_widget([self castedGObject], [widget castedGObject]);
}

- (void)setEndWidget:(OGTKWidget*)widget
{
	gtk_center_layout_set_end_widget([self castedGObject], [widget castedGObject]);
}

- (void)setOrientation:(GtkOrientation)orientation
{
	gtk_center_layout_set_orientation([self castedGObject], orientation);
}

- (void)setShrinkCenterLast:(bool)shrinkCenterLast
{
	gtk_center_layout_set_shrink_center_last([self castedGObject], shrinkCenterLast);
}

- (void)setStartWidget:(OGTKWidget*)widget
{
	gtk_center_layout_set_start_widget([self castedGObject], [widget castedGObject]);
}


@end