/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindow.h"

@class OGTKWidget;

/**
 * The `GtkAboutDialog` offers a simple way to display information about
 * a program.
 * 
 * The shown information includes the programs' logo, name, copyright,
 * website and license. It is also possible to give credits to the authors,
 * documenters, translators and artists who have worked on the program.
 * 
 * An about dialog is typically opened when the user selects the `About`
 * option from the `Help` menu. All parts of the dialog are optional.
 * 
 * ![An example GtkAboutDialog](aboutdialog.png)
 * 
 * About dialogs often contain links and email addresses. `GtkAboutDialog`
 * displays these as clickable links. By default, it calls [method@Gtk.FileLauncher.launch]
 * when a user clicks one. The behaviour can be overridden with the
 * [signal@Gtk.AboutDialog::activate-link] signal.
 * 
 * To specify a person with an email address, use a string like
 * `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title,
 * use a string like `GTK team https://www.gtk.org`.
 * 
 * To make constructing a `GtkAboutDialog` as convenient as possible, you can
 * use the function [func@Gtk.show_about_dialog] which constructs and shows
 * a dialog and keeps it around so that it can be shown again.
 * 
 * Note that GTK sets a default title of `_("About %s")` on the dialog
 * window (where `%s` is replaced by the name of the application, but in
 * order to ensure proper translation of the title, applications should
 * set the title property explicitly when constructing a `GtkAboutDialog`,
 * as shown in the following example:
 * 
 * ```c
 * GFile *logo_file = g_file_new_for_path ("./logo.png");
 * GdkTexture *example_logo = gdk_texture_new_from_file (logo_file, NULL);
 * g_object_unref (logo_file);
 * 
 * gtk_show_about_dialog (NULL,
 *                        "program-name", "ExampleCode",
 *                        "logo", example_logo,
 *                        "title", _("About ExampleCode"),
 *                        NULL);
 * ```
 * 
 * ## CSS nodes
 * 
 * `GtkAboutDialog` has a single CSS node with the name `window` and style
 * class `.aboutdialog`.
 *
 */
@interface OGTKAboutDialog : OGTKWindow
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkAboutDialog*)castedGObject;

/**
 * Creates a new section in the "Credits" page.
 *
 * @param sectionName The name of the section
 * @param people The people who belong to that section
 */
- (void)addCreditSectionWithSectionName:(OFString*)sectionName people:(const char**)people;

/**
 * Returns the names of the artists which are displayed
 * in the credits page.
 *
 * @return A
 *   `NULL`-terminated string array containing the artists
 */
- (const char* const*)artists;

/**
 * Returns the names of the authors which are displayed
 * in the credits page.
 *
 * @return A
 *   `NULL`-terminated string array containing the authors
 */
- (const char* const*)authors;

/**
 * Returns the comments string.
 *
 * @return The comments
 */
- (OFString*)comments;

/**
 * Returns the copyright string.
 *
 * @return The copyright string
 */
- (OFString*)copyright;

/**
 * Returns the name of the documenters which are displayed
 * in the credits page.
 *
 * @return A
 *   `NULL`-terminated string array containing the documenters
 */
- (const char* const*)documenters;

/**
 * Returns the license information.
 *
 * @return The license information
 */
- (OFString*)license;

/**
 * Retrieves the license type.
 *
 * @return a [enum@Gtk.License] value
 */
- (GtkLicense)licenseType;

/**
 * Returns the paintable displayed as logo in the about dialog.
 *
 * @return the paintable displayed as
 *   logo or `NULL` if the logo is unset or has been set via
 *   [method@Gtk.AboutDialog.set_logo_icon_name]
 */
- (GdkPaintable*)logo;

/**
 * Returns the icon name displayed as logo in the about dialog.
 *
 * @return the icon name displayed as logo,
 *   or `NULL` if the logo has been set via [method@Gtk.AboutDialog.set_logo]
 */
- (OFString*)logoIconName;

/**
 * Returns the program name displayed in the about dialog.
 *
 * @return The program name
 */
- (OFString*)programName;

/**
 * Returns the system information that is shown in the about dialog.
 *
 * @return the system information
 */
- (OFString*)systemInformation;

/**
 * Returns the translator credits string which is displayed
 * in the credits page.
 *
 * @return The translator credits string
 */
- (OFString*)translatorCredits;

/**
 * Returns the version string.
 *
 * @return The version string
 */
- (OFString*)version;

/**
 * Returns the website URL.
 *
 * @return The website URL
 */
- (OFString*)website;

/**
 * Returns the label used for the website link.
 *
 * @return The label used for the website link
 */
- (OFString*)websiteLabel;

/**
 * Returns whether the license text in the about dialog is
 * automatically wrapped.
 *
 * @return `TRUE` if the license text is wrapped
 */
- (bool)wrapLicense;

/**
 * Sets the names of the artists to be displayed
 * in the "Credits" page.
 *
 * @param artists the authors of the artwork
 *   of the application
 */
- (void)setArtists:(const char**)artists;

/**
 * Sets the names of the authors which are displayed
 * in the "Credits" page of the about dialog.
 *
 * @param authors the authors of the application
 */
- (void)setAuthors:(const char**)authors;

/**
 * Sets the comments string to display in the about dialog.
 * 
 * This should be a short string of one or two lines.
 *
 * @param comments a comments string
 */
- (void)setComments:(OFString*)comments;

/**
 * Sets the copyright string to display in the about dialog.
 * 
 * This should be a short string of one or two lines.
 *
 * @param copyright the copyright string
 */
- (void)setCopyright:(OFString*)copyright;

/**
 * Sets the names of the documenters which are displayed
 * in the "Credits" page.
 *
 * @param documenters the authors of the documentation
 *   of the application
 */
- (void)setDocumenters:(const char**)documenters;

/**
 * Sets the license information to be displayed in the
 * about dialog.
 * 
 * If `license` is `NULL`, the license page is hidden.
 *
 * @param license the license information
 */
- (void)setLicense:(OFString*)license;

/**
 * Sets the license of the application showing the about dialog from a
 * list of known licenses.
 * 
 * This function overrides the license set using
 * [method@Gtk.AboutDialog.set_license].
 *
 * @param licenseType the type of license
 */
- (void)setLicenseType:(GtkLicense)licenseType;

/**
 * Sets the logo in the about dialog.
 *
 * @param logo a `GdkPaintable`
 */
- (void)setLogo:(GdkPaintable*)logo;

/**
 * Sets the icon name to be displayed as logo in the about dialog.
 *
 * @param iconName an icon name
 */
- (void)setLogoIconName:(OFString*)iconName;

/**
 * Sets the name to display in the about dialog.
 * 
 * If `name` is not set, the string returned
 * by `g_get_application_name()` is used.
 *
 * @param name the program name
 */
- (void)setProgramName:(OFString*)name;

/**
 * Sets the system information to be displayed in the about
 * dialog.
 * 
 * If `system_information` is `NULL`, the system information
 * page is hidden.
 * 
 * See [property@Gtk.AboutDialog:system-information].
 *
 * @param systemInformation system information
 */
- (void)setSystemInformation:(OFString*)systemInformation;

/**
 * Sets the translator credits string which is displayed in
 * the credits page.
 * 
 * The intended use for this string is to display the translator
 * of the language which is currently used in the user interface.
 * Using `gettext()`, a simple way to achieve that is to mark the
 * string for translation:
 * 
 * ```c
 * GtkWidget *about = gtk_about_dialog_new ();
 *  gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
 *                                           _("translator-credits"));
 * ```
 * 
 * It is a good idea to use the customary `msgid` “translator-credits”
 * for this purpose, since translators will already know the purpose of
 * that `msgid`, and since `GtkAboutDialog` will detect if “translator-credits”
 * is untranslated and omit translator credits.
 *
 * @param translatorCredits the translator credits
 */
- (void)setTranslatorCredits:(OFString*)translatorCredits;

/**
 * Sets the version string to display in the about dialog.
 *
 * @param version the version string
 */
- (void)setVersion:(OFString*)version;

/**
 * Sets the URL to use for the website link.
 *
 * @param website a URL string starting with `http://`
 */
- (void)setWebsite:(OFString*)website;

/**
 * Sets the label to be used for the website link.
 *
 * @param websiteLabel the label used for the website link
 */
- (void)setWebsiteLabel:(OFString*)websiteLabel;

/**
 * Sets whether the license text in the about dialog should be
 * automatically wrapped.
 *
 * @param wrapLicense whether to wrap the license
 */
- (void)setWrapLicense:(bool)wrapLicense;

@end