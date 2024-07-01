/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkBuilderScope` implementation for the C language.
 * 
 * `GtkBuilderCScope` instances use symbols explicitly added to @builder
 * with prior calls to [method@Gtk.BuilderCScope.add_callback_symbol].
 * If developers want to do that, they are encouraged to create their
 * own scopes for that purpose.
 * 
 * In the case that symbols are not explicitly added; GTK will uses
 * `GModule`’s introspective features (by opening the module %NULL) to
 * look at the application’s symbol table. From here it tries to match
 * the signal function names given in the interface description with
 * symbols in the application.
 * 
 * Note that unless [method@Gtk.BuilderCScope.add_callback_symbol] is
 * called for all signal callbacks which are referenced by the loaded XML,
 * this functionality will require that `GModule` be supported on the platform.
 *
 */
@interface OGTKBuilderCScope : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkBuilderCScope*)castedGObject;

/**
 * Adds the @callback_symbol to the scope of @builder under the
 * given @callback_name.
 * 
 * Using this function overrides the behavior of
 * [method@Gtk.Builder.create_closure] for any callback symbols that
 * are added. Using this method allows for better encapsulation as it
 * does not require that callback symbols be declared in the global
 * namespace.
 *
 * @param callbackName The name of the callback, as expected in the XML
 * @param callbackSymbol The callback pointer
 */
- (void)addCallbackSymbolWithCallbackName:(OFString*)callbackName callbackSymbol:(GCallback)callbackSymbol;

/**
 * Fetches a symbol previously added with
 * gtk_builder_cscope_add_callback_symbol().
 *
 * @param callbackName The name of the callback
 * @return The callback symbol
 *   in @builder for @callback_name
 */
- (GCallback)lookupCallbackSymbol:(OFString*)callbackName;

@end