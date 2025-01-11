/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidgetPaintable.h"

#import "OGTKWidget.h"

@implementation OGTKWidgetPaintable

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WIDGET_PAINTABLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)widgetPaintable:(OGTKWidget*)widget
{
	GtkWidgetPaintable* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_widget_paintable_new([widget castedGObject]), GtkWidgetPaintable, GtkWidgetPaintable);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKWidgetPaintable* wrapperObject;
	@try {
		wrapperObject = [[OGTKWidgetPaintable alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkWidgetPaintable*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkWidgetPaintable, GtkWidgetPaintable);
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = gtk_widget_paintable_get_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setWidget:(OGTKWidget*)widget
{
	gtk_widget_paintable_set_widget([self castedGObject], [widget castedGObject]);
}


@end