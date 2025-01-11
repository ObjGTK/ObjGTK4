/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorChooserWidget.h"

@implementation OGTKColorChooserWidget

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLOR_CHOOSER_WIDGET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)colorChooserWidget
{
	GtkColorChooserWidget* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_color_chooser_widget_new(), GtkColorChooserWidget, GtkColorChooserWidget);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKColorChooserWidget* wrapperObject;
	@try {
		wrapperObject = [[OGTKColorChooserWidget alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkColorChooserWidget*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkColorChooserWidget, GtkColorChooserWidget);
}


@end