/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidgetPaintable.h"

#import "OGTKWidget.h"

@implementation OGTKWidgetPaintable

- (instancetype)init:(OGTKWidget*)widget
{
	GtkWidgetPaintable* gobjectValue = GTK_WIDGET_PAINTABLE(gtk_widget_paintable_new([widget castedGObject]));

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

- (GtkWidgetPaintable*)castedGObject
{
	return GTK_WIDGET_PAINTABLE([self gObject]);
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_widget_paintable_get_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setWidget:(OGTKWidget*)widget
{
	gtk_widget_paintable_set_widget([self castedGObject], [widget castedGObject]);
}


@end