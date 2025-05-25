/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTooltip.h"

#import "OGTKWidget.h"

@implementation OGTKTooltip

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TOOLTIP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TOOLTIP);
	return gObjectClass;
}

- (GtkTooltip*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TOOLTIP, GtkTooltip);
}

- (void)setCustomWithCustomWidget:(OGTKWidget*)customWidget
{
	gtk_tooltip_set_custom((GtkTooltip*)[self castedGObject], [customWidget castedGObject]);
}

- (void)setIconWithPaintable:(GdkPaintable*)paintable
{
	gtk_tooltip_set_icon((GtkTooltip*)[self castedGObject], paintable);
}

- (void)setIconFromGicon:(GIcon*)gicon
{
	gtk_tooltip_set_icon_from_gicon((GtkTooltip*)[self castedGObject], gicon);
}

- (void)setIconFromIconName:(OFString*)iconName
{
	gtk_tooltip_set_icon_from_icon_name((GtkTooltip*)[self castedGObject], [iconName UTF8String]);
}

- (void)setMarkup:(OFString*)markup
{
	gtk_tooltip_set_markup((GtkTooltip*)[self castedGObject], [markup UTF8String]);
}

- (void)setText:(OFString*)text
{
	gtk_tooltip_set_text((GtkTooltip*)[self castedGObject], [text UTF8String]);
}

- (void)setTipAreaWithRect:(const GdkRectangle*)rect
{
	gtk_tooltip_set_tip_area((GtkTooltip*)[self castedGObject], rect);
}


@end