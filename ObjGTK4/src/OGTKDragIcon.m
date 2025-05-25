/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDragIcon.h"

#import <OGdk4/OGdkDrag.h>

@implementation OGTKDragIcon

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DRAG_ICON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DRAG_ICON);
	return gObjectClass;
}

+ (OGTKWidget*)createWidgetForValue:(const GValue*)value
{
	GtkWidget* gobjectValue = gtk_drag_icon_create_widget_for_value(value);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (OGTKWidget*)forDrag:(OGdkDrag*)drag
{
	GtkWidget* gobjectValue = gtk_drag_icon_get_for_drag([drag castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (void)setFromPaintableWithDrag:(OGdkDrag*)drag paintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY
{
	gtk_drag_icon_set_from_paintable([drag castedGObject], paintable, hotX, hotY);
}

- (GtkDragIcon*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DRAG_ICON, GtkDragIcon);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_drag_icon_get_child((GtkDragIcon*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_drag_icon_set_child((GtkDragIcon*)[self castedGObject], [child castedGObject]);
}


@end