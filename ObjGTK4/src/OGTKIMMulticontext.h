/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMContext.h"

/**
 * `GtkIMMulticontext` is an input method context supporting multiple,
 * switchable input methods.
 * 
 * Text widgets such as `GtkText` or `GtkTextView` use a `GtkIMMultiContext`
 * to implement their `im-module` property for switching between different
 * input methods.
 *
 */
@interface OGTKIMMulticontext : OGTKIMContext
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkIMMulticontext*)castedGObject;

/**
 * Gets the id of the currently active delegate of the @context.
 *
 * @return the id of the currently active delegate
 */
- (OFString*)contextId;

/**
 * Sets the context id for @context.
 * 
 * This causes the currently active delegate of @context to be
 * replaced by the delegate corresponding to the new context id.
 * 
 * Setting this to a non-%NULL value overrides the system-wide
 * IM module setting. See the [property@Gtk.Settings:gtk-im-module]
 * property.
 *
 * @param contextId the id to use
 */
- (void)setContextId:(OFString*)contextId;

@end