/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGGdkPixbuf;

/**
 * The `GtkImage` widget displays an image.
 * 
 * ![An example GtkImage](image.png)
 * 
 * Various kinds of object can be displayed as an image; most typically,
 * you would load a `GdkTexture` from a file, using the convenience function
 * [ctor@Gtk.Image.new_from_file], for instance:
 * 
 * ```c
 * GtkWidget *image = gtk_image_new_from_file ("myfile.png");
 * ```
 * 
 * If the file isn’t loaded successfully, the image will contain a
 * “broken image” icon similar to that used in many web browsers.
 * 
 * If you want to handle errors in loading the file yourself,
 * for example by displaying an error message, then load the image with
 * [ctor@Gdk.Texture.new_from_file], then create the `GtkImage` with
 * [ctor@Gtk.Image.new_from_paintable].
 * 
 * Sometimes an application will want to avoid depending on external data
 * files, such as image files. See the documentation of `GResource` inside
 * GIO, for details. In this case, [property@Gtk.Image:resource],
 * [ctor@Gtk.Image.new_from_resource], and [method@Gtk.Image.set_from_resource]
 * should be used.
 * 
 * `GtkImage` displays its image as an icon, with a size that is determined
 * by the application. See [class@Gtk.Picture] if you want to show an image
 * at is actual size.
 * 
 * ## CSS nodes
 * 
 * `GtkImage` has a single CSS node with the name `image`. The style classes
 * `.normal-icons` or `.large-icons` may appear, depending on the
 * [property@Gtk.Image:icon-size] property.
 * 
 * ## Accessibility
 * 
 * `GtkImage` uses the `GTK_ACCESSIBLE_ROLE_IMG` role.
 *
 */
@interface OGTKImage : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initFromFile:(OFString*)filename;
- (instancetype)initFromGicon:(GIcon*)icon;
- (instancetype)initFromIconName:(OFString*)iconName;
- (instancetype)initFromPaintable:(GdkPaintable*)paintable;
- (instancetype)initFromPixbuf:(OGGdkPixbuf*)pixbuf;
- (instancetype)initFromResource:(OFString*)resourcePath;

/**
 * Methods
 */

- (GtkImage*)castedGObject;

/**
 * Resets the image to be empty.
 *
 */
- (void)clear;

/**
 * Gets the `GIcon` being displayed by the `GtkImage`.
 * 
 * The storage type of the image must be %GTK_IMAGE_EMPTY or
 * %GTK_IMAGE_GICON (see [method@Gtk.Image.get_storage_type]).
 * The caller of this function does not own a reference to the
 * returned `GIcon`.
 *
 * @return a `GIcon`
 */
- (GIcon*)gicon;

/**
 * Gets the icon name and size being displayed by the `GtkImage`.
 * 
 * The storage type of the image must be %GTK_IMAGE_EMPTY or
 * %GTK_IMAGE_ICON_NAME (see [method@Gtk.Image.get_storage_type]).
 * The returned string is owned by the `GtkImage` and should not
 * be freed.
 *
 * @return the icon name
 */
- (OFString*)iconName;

/**
 * Gets the icon size used by the @image when rendering icons.
 *
 * @return the image size used by icons
 */
- (GtkIconSize)iconSize;

/**
 * Gets the image `GdkPaintable` being displayed by the `GtkImage`.
 * 
 * The storage type of the image must be %GTK_IMAGE_EMPTY or
 * %GTK_IMAGE_PAINTABLE (see [method@Gtk.Image.get_storage_type]).
 * The caller of this function does not own a reference to the
 * returned paintable.
 *
 * @return the displayed paintable
 */
- (GdkPaintable*)paintable;

/**
 * Gets the pixel size used for named icons.
 *
 * @return the pixel size used for named icons.
 */
- (int)pixelSize;

/**
 * Gets the type of representation being used by the `GtkImage`
 * to store image data.
 * 
 * If the `GtkImage` has no image data, the return value will
 * be %GTK_IMAGE_EMPTY.
 *
 * @return image representation being used
 */
- (GtkImageType)storageType;

/**
 * Sets a `GtkImage` to show a file.
 * 
 * See [ctor@Gtk.Image.new_from_file] for details.
 *
 * @param filename a filename
 */
- (void)setFromFile:(OFString*)filename;

/**
 * Sets a `GtkImage` to show a `GIcon`.
 * 
 * See [ctor@Gtk.Image.new_from_gicon] for details.
 *
 * @param icon an icon
 */
- (void)setFromGicon:(GIcon*)icon;

/**
 * Sets a `GtkImage` to show a named icon.
 * 
 * See [ctor@Gtk.Image.new_from_icon_name] for details.
 *
 * @param iconName an icon name
 */
- (void)setFromIconName:(OFString*)iconName;

/**
 * Sets a `GtkImage` to show a `GdkPaintable`.
 * 
 * See [ctor@Gtk.Image.new_from_paintable] for details.
 *
 * @param paintable a `GdkPaintable`
 */
- (void)setFromPaintable:(GdkPaintable*)paintable;

/**
 * Sets a `GtkImage` to show a `GdkPixbuf`.
 * 
 * See [ctor@Gtk.Image.new_from_pixbuf] for details.
 * 
 * Note: This is a helper for [method@Gtk.Image.set_from_paintable],
 * and you can't get back the exact pixbuf once this is called,
 * only a paintable.
 *
 * @param pixbuf a `GdkPixbuf` or `NULL`
 */
- (void)setFromPixbuf:(OGGdkPixbuf*)pixbuf;

/**
 * Sets a `GtkImage` to show a resource.
 * 
 * See [ctor@Gtk.Image.new_from_resource] for details.
 *
 * @param resourcePath a resource path
 */
- (void)setFromResource:(OFString*)resourcePath;

/**
 * Suggests an icon size to the theme for named icons.
 *
 * @param iconSize the new icon size
 */
- (void)setIconSize:(GtkIconSize)iconSize;

/**
 * Sets the pixel size to use for named icons.
 * 
 * If the pixel size is set to a value != -1, it is used instead
 * of the icon size set by [method@Gtk.Image.set_from_icon_name].
 *
 * @param pixelSize the new pixel size
 */
- (void)setPixelSize:(int)pixelSize;

@end