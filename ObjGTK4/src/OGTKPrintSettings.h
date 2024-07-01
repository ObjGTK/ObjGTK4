/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkPrintSettings` object represents the settings of a print dialog in
 * a system-independent way.
 * 
 * The main use for this object is that once you’ve printed you can get a
 * settings object that represents the settings the user chose, and the next
 * time you print you can pass that object in so that the user doesn’t have
 * to re-set all his settings.
 * 
 * Its also possible to enumerate the settings so that you can easily save
 * the settings for the next time your app runs, or even store them in a
 * document. The predefined keys try to use shared values as much as possible
 * so that moving such a document between systems still works.
 *
 */
@interface OGTKPrintSettings : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initFromFile:(OFString*)fileName;
- (instancetype)initFromGvariant:(GVariant*)variant;
- (instancetype)initFromKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName;

/**
 * Methods
 */

- (GtkPrintSettings*)castedGObject;

/**
 * Copies a `GtkPrintSettings` object.
 *
 * @return a newly allocated copy of @other
 */
- (OGTKPrintSettings*)copy;

/**
 * Calls @func for each key-value pair of @settings.
 *
 * @param func the function to call
 * @param userData user data for @func
 */
- (void)foreachWithFunc:(GtkPrintSettingsFunc)func userData:(gpointer)userData;

/**
 * Looks up the string value associated with @key.
 *
 * @param key a key
 * @return the string value for @key
 */
- (OFString*)get:(OFString*)key;

/**
 * Returns the boolean represented by the value
 * that is associated with @key.
 * 
 * The string “true” represents %TRUE, any other
 * string %FALSE.
 *
 * @param key a key
 * @return %TRUE, if @key maps to a true value.
 */
- (bool)bool:(OFString*)key;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_COLLATE.
 *
 * @return whether to collate the printed pages
 */
- (bool)collate;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_DEFAULT_SOURCE.
 *
 * @return the default source
 */
- (OFString*)defaultSource;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_DITHER.
 *
 * @return the dithering that is used
 */
- (OFString*)dither;

/**
 * Returns the double value associated with @key, or 0.
 *
 * @param key a key
 * @return the double value of @key
 */
- (double)double:(OFString*)key;

/**
 * Returns the floating point number represented by
 * the value that is associated with @key, or @default_val
 * if the value does not represent a floating point number.
 * 
 * Floating point numbers are parsed with g_ascii_strtod().
 *
 * @param key a key
 * @param def the default value
 * @return the floating point number associated with @key
 */
- (double)doubleWithDefaultWithKey:(OFString*)key def:(double)def;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_DUPLEX.
 *
 * @return whether to print the output in duplex.
 */
- (GtkPrintDuplex)duplex;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_FINISHINGS.
 *
 * @return the finishings
 */
- (OFString*)finishings;

/**
 * Returns the integer value of @key, or 0.
 *
 * @param key a key
 * @return the integer value of @key
 */
- (int)int:(OFString*)key;

/**
 * Returns the value of @key, interpreted as
 * an integer, or the default value.
 *
 * @param key a key
 * @param def the default value
 * @return the integer value of @key
 */
- (int)intWithDefaultWithKey:(OFString*)key def:(int)def;

/**
 * Returns the value associated with @key, interpreted
 * as a length.
 * 
 * The returned value is converted to @units.
 *
 * @param key a key
 * @param unit the unit of the return value
 * @return the length value of @key, converted to @unit
 */
- (double)lengthWithKey:(OFString*)key unit:(GtkUnit)unit;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_MEDIA_TYPE.
 * 
 * The set of media types is defined in PWG 5101.1-2002 PWG.
 *
 * @return the media type
 */
- (OFString*)mediaType;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_N_COPIES.
 *
 * @return the number of copies to print
 */
- (int)ncopies;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_NUMBER_UP.
 *
 * @return the number of pages per sheet
 */
- (int)numberUp;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT.
 *
 * @return layout of page in number-up mode
 */
- (GtkNumberUpLayout)numberUpLayout;

/**
 * Get the value of %GTK_PRINT_SETTINGS_ORIENTATION,
 * converted to a `GtkPageOrientation`.
 *
 * @return the orientation
 */
- (GtkPageOrientation)orientation;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_OUTPUT_BIN.
 *
 * @return the output bin
 */
- (OFString*)outputBin;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PAGE_RANGES.
 *
 * @param numRanges return location for the length of the returned array
 * @return an array
 *   of `GtkPageRange`s. Use g_free() to free the array when
 *   it is no longer needed.
 */
- (GtkPageRange*)pageRanges:(int*)numRanges;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PAGE_SET.
 *
 * @return the set of pages to print
 */
- (GtkPageSet)pageSet;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PAPER_HEIGHT,
 * converted to @unit.
 *
 * @param unit the unit for the return value
 * @return the paper height, in units of @unit
 */
- (double)paperHeight:(GtkUnit)unit;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PAPER_FORMAT,
 * converted to a `GtkPaperSize`.
 *
 * @return the paper size
 */
- (GtkPaperSize*)paperSize;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PAPER_WIDTH,
 * converted to @unit.
 *
 * @param unit the unit for the return value
 * @return the paper width, in units of @unit
 */
- (double)paperWidth:(GtkUnit)unit;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PRINT_PAGES.
 *
 * @return which pages to print
 */
- (GtkPrintPages)printPages;

/**
 * Convenience function to obtain the value of
 * %GTK_PRINT_SETTINGS_PRINTER.
 *
 * @return the printer name
 */
- (OFString*)printer;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_PRINTER_LPI.
 *
 * @return the resolution in lpi (lines per inch)
 */
- (double)printerLpi;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_QUALITY.
 *
 * @return the print quality
 */
- (GtkPrintQuality)quality;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION.
 *
 * @return the resolution in dpi
 */
- (int)resolution;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION_X.
 *
 * @return the horizontal resolution in dpi
 */
- (int)resolutionX;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION_Y.
 *
 * @return the vertical resolution in dpi
 */
- (int)resolutionY;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_REVERSE.
 *
 * @return whether to reverse the order of the printed pages
 */
- (bool)reverse;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_SCALE.
 *
 * @return the scale in percent
 */
- (double)scale;

/**
 * Gets the value of %GTK_PRINT_SETTINGS_USE_COLOR.
 *
 * @return whether to use color
 */
- (bool)useColor;

/**
 * Returns %TRUE, if a value is associated with @key.
 *
 * @param key a key
 * @return %TRUE, if @key has a value
 */
- (bool)hasKey:(OFString*)key;

/**
 * Reads the print settings from @file_name.
 * 
 * If the file could not be loaded then error is set to either
 * a `GFileError` or `GKeyFileError`.
 * 
 * See [method@Gtk.PrintSettings.to_file].
 *
 * @param fileName the filename to read the settings from
 * @return %TRUE on success
 */
- (bool)loadFile:(OFString*)fileName;

/**
 * Reads the print settings from the group @group_name in @key_file.
 * 
 * If the file could not be loaded then error is set to either a
 * `GFileError` or `GKeyFileError`.
 *
 * @param keyFile the `GKeyFile` to retrieve the settings from
 * @param groupName the name of the group to use, or %NULL
 *   to use the default “Print Settings”
 * @return %TRUE on success
 */
- (bool)loadKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName;

/**
 * Associates @value with @key.
 *
 * @param key a key
 * @param value a string value
 */
- (void)setWithKey:(OFString*)key value:(OFString*)value;

/**
 * Sets @key to a boolean value.
 *
 * @param key a key
 * @param value a boolean
 */
- (void)setBoolWithKey:(OFString*)key value:(bool)value;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_COLLATE.
 *
 * @param collate whether to collate the output
 */
- (void)setCollate:(bool)collate;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_DEFAULT_SOURCE.
 *
 * @param defaultSource the default source
 */
- (void)setDefaultSource:(OFString*)defaultSource;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_DITHER.
 *
 * @param dither the dithering that is used
 */
- (void)setDither:(OFString*)dither;

/**
 * Sets @key to a double value.
 *
 * @param key a key
 * @param value a double value
 */
- (void)setDoubleWithKey:(OFString*)key value:(double)value;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_DUPLEX.
 *
 * @param duplex a `GtkPrintDuplex` value
 */
- (void)setDuplex:(GtkPrintDuplex)duplex;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_FINISHINGS.
 *
 * @param finishings the finishings
 */
- (void)setFinishings:(OFString*)finishings;

/**
 * Sets @key to an integer value.
 *
 * @param key a key
 * @param value an integer
 */
- (void)setIntWithKey:(OFString*)key value:(int)value;

/**
 * Associates a length in units of @unit with @key.
 *
 * @param key a key
 * @param value a length
 * @param unit the unit of @length
 */
- (void)setLengthWithKey:(OFString*)key value:(double)value unit:(GtkUnit)unit;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_MEDIA_TYPE.
 * 
 * The set of media types is defined in PWG 5101.1-2002 PWG.
 *
 * @param mediaType the media type
 */
- (void)setMediaType:(OFString*)mediaType;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_N_COPIES.
 *
 * @param numCopies the number of copies
 */
- (void)setNcopies:(int)numCopies;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_NUMBER_UP.
 *
 * @param numberUp the number of pages per sheet
 */
- (void)setNumberUp:(int)numberUp;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT.
 *
 * @param numberUpLayout a `GtkNumberUpLayout` value
 */
- (void)setNumberUpLayout:(GtkNumberUpLayout)numberUpLayout;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_ORIENTATION.
 *
 * @param orientation a page orientation
 */
- (void)setOrientation:(GtkPageOrientation)orientation;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_OUTPUT_BIN.
 *
 * @param outputBin the output bin
 */
- (void)setOutputBin:(OFString*)outputBin;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PAGE_RANGES.
 *
 * @param pageRanges an array of `GtkPageRange`s
 * @param numRanges the length of @page_ranges
 */
- (void)setPageRangesWithPageRanges:(GtkPageRange*)pageRanges numRanges:(int)numRanges;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PAGE_SET.
 *
 * @param pageSet a `GtkPageSet` value
 */
- (void)setPageSet:(GtkPageSet)pageSet;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PAPER_HEIGHT.
 *
 * @param height the paper height
 * @param unit the units of @height
 */
- (void)setPaperHeightWithHeight:(double)height unit:(GtkUnit)unit;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PAPER_FORMAT,
 * %GTK_PRINT_SETTINGS_PAPER_WIDTH and
 * %GTK_PRINT_SETTINGS_PAPER_HEIGHT.
 *
 * @param paperSize a paper size
 */
- (void)setPaperSize:(GtkPaperSize*)paperSize;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PAPER_WIDTH.
 *
 * @param width the paper width
 * @param unit the units of @width
 */
- (void)setPaperWidthWithWidth:(double)width unit:(GtkUnit)unit;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PRINT_PAGES.
 *
 * @param pages a `GtkPrintPages` value
 */
- (void)setPrintPages:(GtkPrintPages)pages;

/**
 * Convenience function to set %GTK_PRINT_SETTINGS_PRINTER
 * to @printer.
 *
 * @param printer the printer name
 */
- (void)setPrinter:(OFString*)printer;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_PRINTER_LPI.
 *
 * @param lpi the resolution in lpi (lines per inch)
 */
- (void)setPrinterLpi:(double)lpi;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_QUALITY.
 *
 * @param quality a `GtkPrintQuality` value
 */
- (void)setQuality:(GtkPrintQuality)quality;

/**
 * Sets the values of %GTK_PRINT_SETTINGS_RESOLUTION,
 * %GTK_PRINT_SETTINGS_RESOLUTION_X and
 * %GTK_PRINT_SETTINGS_RESOLUTION_Y.
 *
 * @param resolution the resolution in dpi
 */
- (void)setResolution:(int)resolution;

/**
 * Sets the values of %GTK_PRINT_SETTINGS_RESOLUTION,
 * %GTK_PRINT_SETTINGS_RESOLUTION_X and
 * %GTK_PRINT_SETTINGS_RESOLUTION_Y.
 *
 * @param resolutionX the horizontal resolution in dpi
 * @param resolutionY the vertical resolution in dpi
 */
- (void)setResolutionXyWithResolutionX:(int)resolutionX resolutionY:(int)resolutionY;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_REVERSE.
 *
 * @param reverse whether to reverse the output
 */
- (void)setReverse:(bool)reverse;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_SCALE.
 *
 * @param scale the scale in percent
 */
- (void)setScale:(double)scale;

/**
 * Sets the value of %GTK_PRINT_SETTINGS_USE_COLOR.
 *
 * @param useColor whether to use color
 */
- (void)setUseColor:(bool)useColor;

/**
 * This function saves the print settings from @settings to @file_name.
 * 
 * If the file could not be written then error is set to either a
 * `GFileError` or `GKeyFileError`.
 *
 * @param fileName the file to save to
 * @return %TRUE on success
 */
- (bool)toFile:(OFString*)fileName;

/**
 * Serialize print settings to an a{sv} variant.
 *
 * @return a new, floating, `GVariant`
 */
- (GVariant*)toGvariant;

/**
 * This function adds the print settings from @settings to @key_file.
 *
 * @param keyFile the `GKeyFile` to save the print settings to
 * @param groupName the group to add the settings to in @key_file, or
 *   %NULL to use the default “Print Settings”
 */
- (void)toKeyFileWithKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName;

/**
 * Removes any value associated with @key.
 * 
 * This has the same effect as setting the value to %NULL.
 *
 * @param key a key
 */
- (void)unset:(OFString*)key;

@end