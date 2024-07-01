/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPrintContext.h"

#import "OGTKPageSetup.h"
#import <OGPango/OGPangoContext.h>
#import <OGPango/OGPangoLayout.h>
#import <OGPango/OGPangoFontMap.h>

@implementation OGTKPrintContext

- (GtkPrintContext*)castedGObject
{
	return GTK_PRINT_CONTEXT([self gObject]);
}

- (OGPangoContext*)createPangoContext
{
	PangoContext* gobjectValue = PANGO_CONTEXT(gtk_print_context_create_pango_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoLayout*)createPangoLayout
{
	PangoLayout* gobjectValue = PANGO_LAYOUT(gtk_print_context_create_pango_layout([self castedGObject]));

	OGPangoLayout* returnValue = [OGPangoLayout withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (cairo_t*)cairoContext
{
	cairo_t* returnValue = gtk_print_context_get_cairo_context([self castedGObject]);

	return returnValue;
}

- (double)dpiX
{
	double returnValue = gtk_print_context_get_dpi_x([self castedGObject]);

	return returnValue;
}

- (double)dpiY
{
	double returnValue = gtk_print_context_get_dpi_y([self castedGObject]);

	return returnValue;
}

- (bool)hardMarginsWithTop:(double*)top bottom:(double*)bottom left:(double*)left right:(double*)right
{
	bool returnValue = gtk_print_context_get_hard_margins([self castedGObject], top, bottom, left, right);

	return returnValue;
}

- (double)height
{
	double returnValue = gtk_print_context_get_height([self castedGObject]);

	return returnValue;
}

- (OGTKPageSetup*)pageSetup
{
	GtkPageSetup* gobjectValue = GTK_PAGE_SETUP(gtk_print_context_get_page_setup([self castedGObject]));

	OGTKPageSetup* returnValue = [OGTKPageSetup withGObject:gobjectValue];
	return returnValue;
}

- (OGPangoFontMap*)pangoFontmap
{
	PangoFontMap* gobjectValue = PANGO_FONT_MAP(gtk_print_context_get_pango_fontmap([self castedGObject]));

	OGPangoFontMap* returnValue = [OGPangoFontMap withGObject:gobjectValue];
	return returnValue;
}

- (double)width
{
	double returnValue = gtk_print_context_get_width([self castedGObject]);

	return returnValue;
}

- (void)setCairoContextWithCr:(cairo_t*)cr dpiX:(double)dpiX dpiY:(double)dpiY
{
	gtk_print_context_set_cairo_context([self castedGObject], cr, dpiX, dpiY);
}


@end