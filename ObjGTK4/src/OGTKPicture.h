/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGGdkPixbuf;

/**
 * The `GtkPicture` widget displays a `GdkPaintable`.
 * 
 * ![An example GtkPicture](picture.png)
 * 
 * Many convenience functions are provided to make pictures simple to use.
 * For example, if you want to load an image from a file, and then display
 * it, there’s a convenience function to do this:
 * 
 * ```c
 * GtkWidget *widget = gtk_picture_new_for_filename ("myfile.png");
 * ```
 * 
 * If the file isn’t loaded successfully, the picture will contain a
 * “broken image” icon similar to that used in many web browsers.
 * If you want to handle errors in loading the file yourself,
 * for example by displaying an error message, then load the image with
 * [ctor@Gdk.Texture.new_from_file], then create the `GtkPicture` with
 * [ctor@Gtk.Picture.new_for_paintable].
 * 
 * Sometimes an application will want to avoid depending on external data
 * files, such as image files. See the documentation of `GResource` for details.
 * In this case, [ctor@Gtk.Picture.new_for_resource] and
 * [method@Gtk.Picture.set_resource] should be used.
 * 
 * `GtkPicture` displays an image at its natural size. See [class@Gtk.Image]
 * if you want to display a fixed-size image, such as an icon.
 * 
 * ## Sizing the paintable
 * 
 * You can influence how the paintable is displayed inside the `GtkPicture`
 * by changing [property@Gtk.Picture:content-fit]. See [enum@Gtk.ContentFit]
 * for details. [property@Gtk.Picture:can-shrink] can be unset to make sure
 * that paintables are never made smaller than their ideal size - but
 * be careful if you do not know the size of the paintable in use (like
 * when displaying user-loaded images). This can easily cause the picture to
 * grow larger than the screen. And [property@Gtk.Widget:halign] and
 * [property@Gtk.Widget:valign] can be used to make sure the paintable doesn't
 * fill all available space but is instead displayed at its original size.
 * 
 * ## CSS nodes
 * 
 * `GtkPicture` has a single CSS node with the name `picture`.
 * 
 * ## Accessibility
 * 
 * `GtkPicture` uses the `GTK_ACCESSIBLE_ROLE_IMG` role.
 *
 */
@interface OGTKPicture : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initForFile:(GFile*)file;
- (instancetype)initForFilename:(OFString*)filename;
- (instancetype)initForPaintable:(GdkPaintable*)paintable;
- (instancetype)initForPixbuf:(OGGdkPixbuf*)pixbuf;
- (instancetype)initForResource:(OFString*)resourcePath;

/**
 * Methods
 */

- (GtkPicture*)castedGObject;

/**
 * Gets the alternative textual description of the picture.
 * 
 * The returned string will be %NULL if the picture cannot be described textually.
 *
 * @return the alternative textual description of @self.
 */
- (OFString*)alternativeText;

/**
 * Returns whether the `GtkPicture` respects its contents size.
 *
 * @return %TRUE if the picture can be made smaller than its contents
 */
- (bool)canShrink;

/**
 * Returns the fit mode for the content of the `GtkPicture`.
 * 
 * See [enum@Gtk.ContentFit] for details.
 *
 * @return the content fit mode
 */
- (GtkContentFit)contentFit;

/**
 * Gets the `GFile` currently displayed if @self is displaying a file.
 * 
 * If @self is not displaying a file, for example when
 * [method@Gtk.Picture.set_paintable] was used, then %NULL is returned.
 *
 * @return The `GFile` displayed by @self.
 */
- (GFile*)file;

/**
 * Returns whether the `GtkPicture` preserves its contents aspect ratio.
 *
 * @return %TRUE if the self tries to keep the contents' aspect ratio
 */
- (bool)keepAspectRatio;

/**
 * Gets the `GdkPaintable` being displayed by the `GtkPicture`.
 *
 * @return the displayed paintable
 */
- (GdkPaintable*)paintable;

/**
 * Sets an alternative textual description for the picture contents.
 * 
 * It is equivalent to the "alt" attribute for images on websites.
 * 
 * This text will be made available to accessibility tools.
 * 
 * If the picture cannot be described textually, set this property to %NULL.
 *
 * @param alternativeText a textual description of the contents
 */
- (void)setAlternativeText:(OFString*)alternativeText;

/**
 * If set to %TRUE, the @self can be made smaller than its contents.
 * 
 * The contents will then be scaled down when rendering.
 * 
 * If you want to still force a minimum size manually, consider using
 * [method@Gtk.Widget.set_size_request].
 * 
 * Also of note is that a similar function for growing does not exist
 * because the grow behavior can be controlled via
 * [method@Gtk.Widget.set_halign] and [method@Gtk.Widget.set_valign].
 *
 * @param canShrink if @self can be made smaller than its contents
 */
- (void)setCanShrink:(bool)canShrink;

/**
 * Sets how the content should be resized to fit the `GtkPicture`.
 * 
 * See [enum@Gtk.ContentFit] for details.
 *
 * @param contentFit the content fit mode
 */
- (void)setContentFit:(GtkContentFit)contentFit;

/**
 * Makes @self load and display @file.
 * 
 * See [ctor@Gtk.Picture.new_for_file] for details.
 *
 * @param file a `GFile`
 */
- (void)setFile:(GFile*)file;

/**
 * Makes @self load and display the given @filename.
 * 
 * This is a utility function that calls [method@Gtk.Picture.set_file].
 *
 * @param filename the filename to play
 */
- (void)setFilename:(OFString*)filename;

/**
 * If set to %TRUE, the @self will render its contents according to
 * their aspect ratio.
 * 
 * That means that empty space may show up at the top/bottom or
 * left/right of @self.
 * 
 * If set to %FALSE or if the contents provide no aspect ratio,
 * the contents will be stretched over the picture's whole area.
 *
 * @param keepAspectRatio whether to keep aspect ratio
 */
- (void)setKeepAspectRatio:(bool)keepAspectRatio;

/**
 * Makes @self display the given @paintable.
 * 
 * If @paintable is %NULL, nothing will be displayed.
 * 
 * See [ctor@Gtk.Picture.new_for_paintable] for details.
 *
 * @param paintable a `GdkPaintable`
 */
- (void)setPaintable:(GdkPaintable*)paintable;

/**
 * Sets a `GtkPicture` to show a `GdkPixbuf`.
 * 
 * See [ctor@Gtk.Picture.new_for_pixbuf] for details.
 * 
 * This is a utility function that calls [method@Gtk.Picture.set_paintable].
 *
 * @param pixbuf a `GdkPixbuf`
 */
- (void)setPixbuf:(OGGdkPixbuf*)pixbuf;

/**
 * Makes @self load and display the resource at the given
 * @resource_path.
 * 
 * This is a utility function that calls [method@Gtk.Picture.set_file].
 *
 * @param resourcePath the resource to set
 */
- (void)setResource:(OFString*)resourcePath;

@end