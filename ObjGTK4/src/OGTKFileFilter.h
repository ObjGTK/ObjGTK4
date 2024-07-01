/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

/**
 * `GtkFileFilter` filters files by name or mime type.
 * 
 * `GtkFileFilter` can be used to restrict the files being shown in a
 * `GtkFileChooser`. Files can be filtered based on their name (with
 * [method@Gtk.FileFilter.add_pattern] or [method@Gtk.FileFilter.add_suffix])
 * or on their mime type (with [method@Gtk.FileFilter.add_mime_type]).
 * 
 * Filtering by mime types handles aliasing and subclassing of mime
 * types; e.g. a filter for text/plain also matches a file with mime
 * type application/rtf, since application/rtf is a subclass of
 * text/plain. Note that `GtkFileFilter` allows wildcards for the
 * subtype of a mime type, so you can e.g. filter for image/\*.
 * 
 * Normally, file filters are used by adding them to a `GtkFileChooser`
 * (see [method@Gtk.FileChooser.add_filter]), but it is also possible to
 * manually use a file filter on any [class@Gtk.FilterListModel] containing
 * `GFileInfo` objects.
 * 
 * # GtkFileFilter as GtkBuildable
 * 
 * The `GtkFileFilter` implementation of the `GtkBuildable` interface
 * supports adding rules using the `<mime-types>` and `<patterns>` and
 * `<suffixes>` elements and listing the rules within. Specifying a
 * `<mime-type>` or `<pattern>` or `<suffix>` has the same effect as
 * as calling
 * [method@Gtk.FileFilter.add_mime_type] or
 * [method@Gtk.FileFilter.add_pattern] or
 * [method@Gtk.FileFilter.add_suffix].
 * 
 * An example of a UI definition fragment specifying `GtkFileFilter`
 * rules:
 * ```xml
 * <object class="GtkFileFilter">
 *   <property name="name" translatable="yes">Text and Images</property>
 *   <mime-types>
 *     <mime-type>text/plain</mime-type>
 *     <mime-type>image/ *</mime-type>
 *   </mime-types>
 *   <patterns>
 *     <pattern>*.txt</pattern>
 *   </patterns>
 *   <suffixes>
 *     <suffix>png</suffix>
 *   </suffixes>
 * </object>
 * ```
 *
 */
@interface OGTKFileFilter : OGTKFilter
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initFromGvariant:(GVariant*)variant;

/**
 * Methods
 */

- (GtkFileFilter*)castedGObject;

/**
 * Adds a rule allowing a given mime type to @filter.
 *
 * @param mimeType name of a MIME type
 */
- (void)addMimeType:(OFString*)mimeType;

/**
 * Adds a rule allowing a shell style glob to a filter.
 * 
 * Note that it depends on the platform whether pattern
 * matching ignores case or not. On Windows, it does, on
 * other platforms, it doesn't.
 *
 * @param pattern a shell style glob
 */
- (void)addPattern:(OFString*)pattern;

/**
 * Adds a rule allowing image files in the formats supported
 * by GdkPixbuf.
 * 
 * This is equivalent to calling [method@Gtk.FileFilter.add_mime_type]
 * for all the supported mime types.
 *
 */
- (void)addPixbufFormats;

/**
 * Adds a suffix match rule to a filter.
 * 
 * This is similar to adding a match for the pattern
 * "*.@suffix".
 * 
 * In contrast to pattern matches, suffix matches
 * are *always* case-insensitive.
 *
 * @param suffix filename suffix to match
 */
- (void)addSuffix:(OFString*)suffix;

/**
 * Gets the attributes that need to be filled in for the `GFileInfo`
 * passed to this filter.
 * 
 * This function will not typically be used by applications;
 * it is intended principally for use in the implementation
 * of `GtkFileChooser`.
 *
 * @return the attributes
 */
- (const char**)attributes;

/**
 * Gets the human-readable name for the filter.
 * 
 * See [method@Gtk.FileFilter.set_name].
 *
 * @return The human-readable name of the filter
 */
- (OFString*)name;

/**
 * Sets a human-readable name of the filter.
 * 
 * This is the string that will be displayed in the file chooser
 * if there is a selectable list of filters.
 *
 * @param name the human-readable-name for the filter, or %NULL
 *   to remove any existing name.
 */
- (void)setName:(OFString*)name;

/**
 * Serialize a file filter to an `a{sv}` variant.
 *
 * @return a new, floating, `GVariant`
 */
- (GVariant*)toGvariant;

@end