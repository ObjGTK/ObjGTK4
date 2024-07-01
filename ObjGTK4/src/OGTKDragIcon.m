/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDragIcon.h"

#import <OGdk4/OGGdkDrag.h>

@implementation OGTKDragIcon

+ (OGTKWidget*)createWidgetForValue:(const GValue*)value
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_drag_icon_create_widget_for_value(value));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (OGTKWidget*)forDrag:(OGGdkDrag*)drag
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_drag_icon_get_for_drag([drag castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

+ (void)setFromPaintableWithDrag:(OGGdkDrag*)drag paintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY
{
	gtk_drag_icon_set_from_paintable([drag castedGObject], paintable, hotX, hotY);
}

- (GtkDragIcon*)castedGObject
{
	return GTK_DRAG_ICON([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_drag_icon_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_drag_icon_set_child([self castedGObject], [child castedGObject]);
}


@end