/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKPageSetup;
@class OGPangoContext;
@class OGPangoFontMap;
@class OGPangoLayout;

/**
 * A `GtkPrintContext` encapsulates context information that is required when
 * drawing pages for printing.
 * 
 * This includes the cairo context and important parameters like page size
 * and resolution. It also lets you easily create [class@Pango.Layout] and
 * [class@Pango.Context] objects that match the font metrics of the cairo surface.
 * 
 * `GtkPrintContext` objects get passed to the
 * [signal@Gtk.PrintOperation::begin-print],
 * [signal@Gtk.PrintOperation::end-print],
 * [signal@Gtk.PrintOperation::request-page-setup] and
 * [signal@Gtk.PrintOperation::draw-page] signals on the
 * [class@Gtk.PrintOperation] object.
 * 
 * ## Using GtkPrintContext in a ::draw-page callback
 * 
 * ```c
 * static void
 * draw_page (GtkPrintOperation *operation,
 *            GtkPrintContext   *context,
 *            int                page_nr)
 * {
 *   cairo_t *cr;
 *   PangoLayout *layout;
 *   PangoFontDescription *desc;
 * 
 *   cr = gtk_print_context_get_cairo_context (context);
 * 
 *   // Draw a red rectangle, as wide as the paper (inside the margins)
 *   cairo_set_source_rgb (cr, 1.0, 0, 0);
 *   cairo_rectangle (cr, 0, 0, gtk_print_context_get_width (context), 50);
 * 
 *   cairo_fill (cr);
 * 
 *   // Draw some lines
 *   cairo_move_to (cr, 20, 10);
 *   cairo_line_to (cr, 40, 20);
 *   cairo_arc (cr, 60, 60, 20, 0, M_PI);
 *   cairo_line_to (cr, 80, 20);
 * 
 *   cairo_set_source_rgb (cr, 0, 0, 0);
 *   cairo_set_line_width (cr, 5);
 *   cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND);
 *   cairo_set_line_join (cr, CAIRO_LINE_JOIN_ROUND);
 * 
 *   cairo_stroke (cr);
 * 
 *   // Draw some text
 *   layout = gtk_print_context_create_pango_layout (context);
 *   pango_layout_set_text (layout, "Hello World! Printing is easy", -1);
 *   desc = pango_font_description_from_string ("sans 28");
 *   pango_layout_set_font_description (layout, desc);
 *   pango_font_description_free (desc);
 * 
 *   cairo_move_to (cr, 30, 20);
 *   pango_cairo_layout_path (cr, layout);
 * 
 *   // Font Outline
 *   cairo_set_source_rgb (cr, 0.93, 1.0, 0.47);
 *   cairo_set_line_width (cr, 0.5);
 *   cairo_stroke_preserve (cr);
 * 
 *   // Font Fill
 *   cairo_set_source_rgb (cr, 0, 0.0, 1.0);
 *   cairo_fill (cr);
 * 
 *   g_object_unref (layout);
 * }
 * ```
 *
 */
@interface OGTKPrintContext : OGObject
{

}


/**
 * Methods
 */

- (GtkPrintContext*)castedGObject;

/**
 * Creates a new `PangoContext` that can be used with the
 * `GtkPrintContext`.
 *
 * @return a new Pango context for @context
 */
- (OGPangoContext*)createPangoContext;

/**
 * Creates a new `PangoLayout` that is suitable for use
 * with the `GtkPrintContext`.
 *
 * @return a new Pango layout for @context
 */
- (OGPangoLayout*)createPangoLayout;

/**
 * Obtains the cairo context that is associated with the
 * `GtkPrintContext`.
 *
 * @return the cairo context of @context
 */
- (cairo_t*)cairoContext;

/**
 * Obtains the horizontal resolution of the `GtkPrintContext`,
 * in dots per inch.
 *
 * @return the horizontal resolution of @context
 */
- (double)dpiX;

/**
 * Obtains the vertical resolution of the `GtkPrintContext`,
 * in dots per inch.
 *
 * @return the vertical resolution of @context
 */
- (double)dpiY;

/**
 * Obtains the hardware printer margins of the `GtkPrintContext`,
 * in units.
 *
 * @param top top hardware printer margin
 * @param bottom bottom hardware printer margin
 * @param left left hardware printer margin
 * @param right right hardware printer margin
 * @return %TRUE if the hard margins were retrieved
 */
- (bool)hardMarginsWithTop:(double*)top bottom:(double*)bottom left:(double*)left right:(double*)right;

/**
 * Obtains the height of the `GtkPrintContext`, in pixels.
 *
 * @return the height of @context
 */
- (double)height;

/**
 * Obtains the `GtkPageSetup` that determines the page
 * dimensions of the `GtkPrintContext`.
 *
 * @return the page setup of @context
 */
- (OGTKPageSetup*)pageSetup;

/**
 * Returns a `PangoFontMap` that is suitable for use
 * with the `GtkPrintContext`.
 *
 * @return the font map of @context
 */
- (OGPangoFontMap*)pangoFontmap;

/**
 * Obtains the width of the `GtkPrintContext`, in pixels.
 *
 * @return the width of @context
 */
- (double)width;

/**
 * Sets a new cairo context on a print context.
 * 
 * This function is intended to be used when implementing
 * an internal print preview, it is not needed for printing,
 * since GTK itself creates a suitable cairo context in that
 * case.
 *
 * @param cr the cairo context
 * @param dpiX the horizontal resolution to use with @cr
 * @param dpiY the vertical resolution to use with @cr
 */
- (void)setCairoContextWithCr:(cairo_t*)cr dpiX:(double)dpiX dpiY:(double)dpiY;

@end