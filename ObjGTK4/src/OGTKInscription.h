/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkInscription` is a widget to show text in a predefined area.
 * 
 * You likely want to use `GtkLabel` instead as this widget is intended only
 * for a small subset of use cases. The main scenario envisaged is inside lists
 * such as `GtkColumnView`.
 * 
 * While a `GtkLabel` sizes itself depending on the text that is displayed,
 * `GtkInscription` is given a size and inscribes the given text into that
 * space as well as it can.
 * 
 * Users of this widget should take care to plan behaviour for the common case
 * where the text doesn't fit exactly in the allocated space.
 *
 */
@interface OGTKInscription : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)text;

/**
 * Methods
 */

- (GtkInscription*)castedGObject;

/**
 * Gets the inscription's attribute list.
 *
 * @return the attribute list
 */
- (PangoAttrList*)attributes;

/**
 * Gets the `min-chars` of the inscription.
 * 
 * See the [property@Gtk.Inscription:min-chars] property.
 *
 * @return the min-chars property
 */
- (guint)minChars;

/**
 * Gets the `min-lines` of the inscription.
 * 
 * See the [property@Gtk.Inscription:min-lines] property.
 *
 * @return the min-lines property
 */
- (guint)minLines;

/**
 * Gets the `nat-chars` of the inscription.
 * 
 * See the [property@Gtk.Inscription:nat-chars] property.
 *
 * @return the nat-chars property
 */
- (guint)natChars;

/**
 * Gets the `nat-lines` of the inscription.
 * 
 * See the [property@Gtk.Inscription:nat-lines] property.
 *
 * @return the nat-lines property
 */
- (guint)natLines;

/**
 * Gets the text that is displayed.
 *
 * @return The displayed text
 */
- (OFString*)text;

/**
 * Gets the inscription's overflow method.
 *
 * @return the overflow method
 */
- (GtkInscriptionOverflow)textOverflow;

/**
 * Returns line wrap mode used by the inscription.
 * 
 * See [method@Gtk.Inscription.set_wrap_mode].
 *
 * @return the line wrap mode
 */
- (PangoWrapMode)wrapMode;

/**
 * Gets the `xalign` of the inscription.
 * 
 * See the [property@Gtk.Inscription:xalign] property.
 *
 * @return the xalign property
 */
- (float)xalign;

/**
 * Gets the `yalign` of the inscription.
 * 
 * See the [property@Gtk.Inscription:yalign] property.
 *
 * @return the yalign property
 */
- (float)yalign;

/**
 * Apply attributes to the inscription text.
 * 
 * These attributes will not be evaluated for sizing the inscription.
 *
 * @param attrs a [struct@Pango.AttrList]
 */
- (void)setAttributes:(PangoAttrList*)attrs;

/**
 * Utility function to set the text and attributes to be displayed.
 * 
 * See the [property@Gtk.Inscription:markup] property.
 *
 * @param markup The markup to display
 */
- (void)setMarkup:(OFString*)markup;

/**
 * Sets the `min-chars` of the inscription.
 * 
 * See the [property@Gtk.Inscription:min-chars] property.
 *
 * @param minChars the minimum number of characters that should fit, approximately
 */
- (void)setMinChars:(guint)minChars;

/**
 * Sets the `min-lines` of the inscription.
 * 
 * See the [property@Gtk.Inscription:min-lines] property.
 *
 * @param minLines the minimum number of lines that should fit, approximately
 */
- (void)setMinLines:(guint)minLines;

/**
 * Sets the `nat-chars` of the inscription.
 * 
 * See the [property@Gtk.Inscription:nat-chars] property.
 *
 * @param natChars the number of characters that should ideally fit, approximately
 */
- (void)setNatChars:(guint)natChars;

/**
 * Sets the `nat-lines` of the inscription.
 * 
 * See the [property@Gtk.Inscription:nat-lines] property.
 *
 * @param natLines the number of lines that should ideally fit
 */
- (void)setNatLines:(guint)natLines;

/**
 * Sets the text to be displayed.
 *
 * @param text The text to display
 */
- (void)setText:(OFString*)text;

/**
 * Sets what to do when the text doesn't fit.
 *
 * @param overflow the overflow method to use
 */
- (void)setTextOverflow:(GtkInscriptionOverflow)overflow;

/**
 * Controls how line wrapping is done.
 *
 * @param wrapMode the line wrapping mode
 */
- (void)setWrapMode:(PangoWrapMode)wrapMode;

/**
 * Sets the `xalign` of the inscription.
 * 
 * See the [property@Gtk.Inscription:xalign] property.
 *
 * @param xalign the new xalign value, between 0 and 1
 */
- (void)setXalign:(float)xalign;

/**
 * Sets the `yalign` of the inscription.
 * 
 * See the [property@Gtk.Inscription:yalign] property.
 *
 * @param yalign the new yalign value, between 0 and 1
 */
- (void)setYalign:(float)yalign;

@end