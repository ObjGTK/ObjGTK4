/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintContext.h"

#import "OGTKPageSetup.h"
#import <OGPango/OGPangoContext.h>
#import <OGPango/OGPangoFontMap.h>
#import <OGPango/OGPangoLayout.h>

@implementation OGTKPrintContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PRINT_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PRINT_CONTEXT);
	return gObjectClass;
}

- (GtkPrintContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PRINT_CONTEXT, GtkPrintContext);
}

- (OGPangoContext*)createPangoContext
{
	PangoContext* gobjectValue = gtk_print_context_create_pango_context((GtkPrintContext*)[self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoLayout*)createPangoLayout
{
	PangoLayout* gobjectValue = gtk_print_context_create_pango_layout((GtkPrintContext*)[self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (cairo_t*)cairoContext
{
	cairo_t* returnValue = (cairo_t*)gtk_print_context_get_cairo_context((GtkPrintContext*)[self castedGObject]);

	return returnValue;
}

- (double)dpiX
{
	double returnValue = (double)gtk_print_context_get_dpi_x((GtkPrintContext*)[self castedGObject]);

	return returnValue;
}

- (double)dpiY
{
	double returnValue = (double)gtk_print_context_get_dpi_y((GtkPrintContext*)[self castedGObject]);

	return returnValue;
}

- (bool)hardMarginsWithTop:(double*)top bottom:(double*)bottom left:(double*)left right:(double*)right
{
	bool returnValue = (bool)gtk_print_context_get_hard_margins((GtkPrintContext*)[self castedGObject], top, bottom, left, right);

	return returnValue;
}

- (double)height
{
	double returnValue = (double)gtk_print_context_get_height((GtkPrintContext*)[self castedGObject]);

	return returnValue;
}

- (OGTKPageSetup*)pageSetup
{
	GtkPageSetup* gobjectValue = gtk_print_context_get_page_setup((GtkPrintContext*)[self castedGObject]);

	OGTKPageSetup* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGPangoFontMap*)pangoFontmap
{
	PangoFontMap* gobjectValue = gtk_print_context_get_pango_fontmap((GtkPrintContext*)[self castedGObject]);

	OGPangoFontMap* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (double)width
{
	double returnValue = (double)gtk_print_context_get_width((GtkPrintContext*)[self castedGObject]);

	return returnValue;
}

- (void)setCairoContextWithCr:(cairo_t*)cr dpiX:(double)dpiX dpiY:(double)dpiY
{
	gtk_print_context_set_cairo_context((GtkPrintContext*)[self castedGObject], cr, dpiX, dpiY);
}


@end