/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkPageSetup` object stores the page size, orientation and margins.
 * 
 * The idea is that you can get one of these from the page setup dialog
 * and then pass it to the `GtkPrintOperation` when printing.
 * The benefit of splitting this out of the `GtkPrintSettings` is that
 * these affect the actual layout of the page, and thus need to be set
 * long before user prints.
 * 
 * ## Margins
 * 
 * The margins specified in this object are the “print margins”, i.e. the
 * parts of the page that the printer cannot print on. These are different
 * from the layout margins that a word processor uses; they are typically
 * used to determine the minimal size for the layout margins.
 * 
 * To obtain a `GtkPageSetup` use [ctor@Gtk.PageSetup.new] to get the defaults,
 * or use [func@Gtk.print_run_page_setup_dialog] to show the page setup dialog
 * and receive the resulting page setup.
 * 
 * ## A page setup dialog
 * 
 * ```c
 * static GtkPrintSettings *settings = NULL;
 * static GtkPageSetup *page_setup = NULL;
 * 
 * static void
 * do_page_setup (void)
 * {
 *   GtkPageSetup *new_page_setup;
 * 
 *   if (settings == NULL)
 *     settings = gtk_print_settings_new ();
 * 
 *   new_page_setup = gtk_print_run_page_setup_dialog (GTK_WINDOW (main_window),
 *                                                     page_setup, settings);
 * 
 *   if (page_setup)
 *     g_object_unref (page_setup);
 * 
 *   page_setup = new_page_setup;
 * }
 * ```
 *
 */
@interface OGTKPageSetup : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)pageSetup;
+ (instancetype)pageSetupFromFileWithFileName:(OFString*)fileName;
+ (instancetype)pageSetupFromGvariant:(GVariant*)variant;
+ (instancetype)pageSetupFromKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName;

/**
 * Methods
 */

- (GtkPageSetup*)castedGObject;

/**
 * Copies a `GtkPageSetup`.
 *
 * @return a copy of @other
 */
- (OGTKPageSetup*)copy;

/**
 * Gets the bottom margin in units of @unit.
 *
 * @param unit the unit for the return value
 * @return the bottom margin
 */
- (double)bottomMarginWithUnit:(GtkUnit)unit;

/**
 * Gets the left margin in units of @unit.
 *
 * @param unit the unit for the return value
 * @return the left margin
 */
- (double)leftMarginWithUnit:(GtkUnit)unit;

/**
 * Gets the page orientation of the `GtkPageSetup`.
 *
 * @return the page orientation
 */
- (GtkPageOrientation)orientation;

/**
 * Returns the page height in units of @unit.
 * 
 * Note that this function takes orientation
 * and margins into consideration.
 * See [method@Gtk.PageSetup.get_paper_height].
 *
 * @param unit the unit for the return value
 * @return the page height.
 */
- (double)pageHeightWithUnit:(GtkUnit)unit;

/**
 * Returns the page width in units of @unit.
 * 
 * Note that this function takes orientation
 * and margins into consideration.
 * See [method@Gtk.PageSetup.get_paper_width].
 *
 * @param unit the unit for the return value
 * @return the page width.
 */
- (double)pageWidthWithUnit:(GtkUnit)unit;

/**
 * Returns the paper height in units of @unit.
 * 
 * Note that this function takes orientation,
 * but not margins into consideration.
 * See [method@Gtk.PageSetup.get_page_height].
 *
 * @param unit the unit for the return value
 * @return the paper height.
 */
- (double)paperHeightWithUnit:(GtkUnit)unit;

/**
 * Gets the paper size of the `GtkPageSetup`.
 *
 * @return the paper size
 */
- (GtkPaperSize*)paperSize;

/**
 * Returns the paper width in units of @unit.
 * 
 * Note that this function takes orientation,
 * but not margins into consideration.
 * See [method@Gtk.PageSetup.get_page_width].
 *
 * @param unit the unit for the return value
 * @return the paper width.
 */
- (double)paperWidthWithUnit:(GtkUnit)unit;

/**
 * Gets the right margin in units of @unit.
 *
 * @param unit the unit for the return value
 * @return the right margin
 */
- (double)rightMarginWithUnit:(GtkUnit)unit;

/**
 * Gets the top margin in units of @unit.
 *
 * @param unit the unit for the return value
 * @return the top margin
 */
- (double)topMarginWithUnit:(GtkUnit)unit;

/**
 * Reads the page setup from the file @file_name.
 * 
 * See [method@Gtk.PageSetup.to_file].
 *
 * @param fileName the filename to read the page setup from
 * @return %TRUE on success
 */
- (bool)loadFileWithFileName:(OFString*)fileName;

/**
 * Reads the page setup from the group @group_name in the key file
 * @key_file.
 *
 * @param keyFile the `GKeyFile` to retrieve the page_setup from
 * @param groupName the name of the group in the key_file to read
 *   to use the default name “Page Setup”
 * @return %TRUE on success
 */
- (bool)loadKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName;

/**
 * Sets the bottom margin of the `GtkPageSetup`.
 *
 * @param margin the new bottom margin in units of @unit
 * @param unit the units for @margin
 */
- (void)setBottomMargin:(double)margin unit:(GtkUnit)unit;

/**
 * Sets the left margin of the `GtkPageSetup`.
 *
 * @param margin the new left margin in units of @unit
 * @param unit the units for @margin
 */
- (void)setLeftMargin:(double)margin unit:(GtkUnit)unit;

/**
 * Sets the page orientation of the `GtkPageSetup`.
 *
 * @param orientation a `GtkPageOrientation` value
 */
- (void)setOrientation:(GtkPageOrientation)orientation;

/**
 * Sets the paper size of the `GtkPageSetup` without
 * changing the margins.
 * 
 * See [method@Gtk.PageSetup.set_paper_size_and_default_margins].
 *
 * @param size a `GtkPaperSize`
 */
- (void)setPaperSize:(GtkPaperSize*)size;

/**
 * Sets the paper size of the `GtkPageSetup` and modifies
 * the margins according to the new paper size.
 *
 * @param size a `GtkPaperSize`
 */
- (void)setPaperSizeAndDefaultMargins:(GtkPaperSize*)size;

/**
 * Sets the right margin of the `GtkPageSetup`.
 *
 * @param margin the new right margin in units of @unit
 * @param unit the units for @margin
 */
- (void)setRightMargin:(double)margin unit:(GtkUnit)unit;

/**
 * Sets the top margin of the `GtkPageSetup`.
 *
 * @param margin the new top margin in units of @unit
 * @param unit the units for @margin
 */
- (void)setTopMargin:(double)margin unit:(GtkUnit)unit;

/**
 * This function saves the information from @setup to @file_name.
 *
 * @param fileName the file to save to
 * @return %TRUE on success
 */
- (bool)toFileWithFileName:(OFString*)fileName;

/**
 * Serialize page setup to an a{sv} variant.
 *
 * @return a new, floating, `GVariant`
 */
- (GVariant*)toGvariant;

/**
 * This function adds the page setup from @setup to @key_file.
 *
 * @param keyFile the `GKeyFile` to save the page setup to
 * @param groupName the group to add the settings to in @key_file,
 *   or %NULL to use the default name “Page Setup”
 */
- (void)toKeyFile:(GKeyFile*)keyFile groupName:(OFString*)groupName;

@end