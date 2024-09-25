/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkAppChooserWidget` is a widget for selecting applications.
 * 
 * It is the main building block for [class@Gtk.AppChooserDialog].
 * Most applications only need to use the latter; but you can use
 * this widget as part of a larger widget if you have special needs.
 * 
 * `GtkAppChooserWidget` offers detailed control over what applications
 * are shown, using the
 * [property@Gtk.AppChooserWidget:show-default],
 * [property@Gtk.AppChooserWidget:show-recommended],
 * [property@Gtk.AppChooserWidget:show-fallback],
 * [property@Gtk.AppChooserWidget:show-other] and
 * [property@Gtk.AppChooserWidget:show-all] properties. See the
 * [iface@Gtk.AppChooser] documentation for more information about these
 * groups of applications.
 * 
 * To keep track of the selected application, use the
 * [signal@Gtk.AppChooserWidget::application-selected] and
 * [signal@Gtk.AppChooserWidget::application-activated] signals.
 * 
 * ## CSS nodes
 * 
 * `GtkAppChooserWidget` has a single CSS node with name appchooser.
 *
 */
@interface OGTKAppChooserWidget : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)contentType;

/**
 * Methods
 */

- (GtkAppChooserWidget*)castedGObject;

/**
 * Returns the text that is shown if there are not applications
 * that can handle the content type.
 *
 * @return the value of [property@Gtk.AppChooserWidget:default-text]
 */
- (OFString*)defaultText;

/**
 * Gets whether the app chooser should show all applications
 * in a flat list.
 *
 * @return the value of [property@Gtk.AppChooserWidget:show-all]
 */
- (bool)showAll;

/**
 * Gets whether the app chooser should show the default handler
 * for the content type in a separate section.
 *
 * @return the value of [property@Gtk.AppChooserWidget:show-default]
 */
- (bool)showDefault;

/**
 * Gets whether the app chooser should show related applications
 * for the content type in a separate section.
 *
 * @return the value of [property@Gtk.AppChooserWidget:show-fallback]
 */
- (bool)showFallback;

/**
 * Gets whether the app chooser should show applications
 * which are unrelated to the content type.
 *
 * @return the value of [property@Gtk.AppChooserWidget:show-other]
 */
- (bool)showOther;

/**
 * Gets whether the app chooser should show recommended applications
 * for the content type in a separate section.
 *
 * @return the value of [property@Gtk.AppChooserWidget:show-recommended]
 */
- (bool)showRecommended;

/**
 * Sets the text that is shown if there are not applications
 * that can handle the content type.
 *
 * @param text the new value for [property@Gtk.AppChooserWidget:default-text]
 */
- (void)setDefaultText:(OFString*)text;

/**
 * Sets whether the app chooser should show all applications
 * in a flat list.
 *
 * @param setting the new value for [property@Gtk.AppChooserWidget:show-all]
 */
- (void)setShowAll:(bool)setting;

/**
 * Sets whether the app chooser should show the default handler
 * for the content type in a separate section.
 *
 * @param setting the new value for [property@Gtk.AppChooserWidget:show-default]
 */
- (void)setShowDefault:(bool)setting;

/**
 * Sets whether the app chooser should show related applications
 * for the content type in a separate section.
 *
 * @param setting the new value for [property@Gtk.AppChooserWidget:show-fallback]
 */
- (void)setShowFallback:(bool)setting;

/**
 * Sets whether the app chooser should show applications
 * which are unrelated to the content type.
 *
 * @param setting the new value for [property@Gtk.AppChooserWidget:show-other]
 */
- (void)setShowOther:(bool)setting;

/**
 * Sets whether the app chooser should show recommended applications
 * for the content type in a separate section.
 *
 * @param setting the new value for [property@Gtk.AppChooserWidget:show-recommended]
 */
- (void)setShowRecommended:(bool)setting;

@end