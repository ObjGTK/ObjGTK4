/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

/**
 * `GtkStringFilter` determines whether to include items by comparing
 * strings to a fixed search term.
 * 
 * The strings are obtained from the items by evaluating a `GtkExpression`
 * set with [method@Gtk.StringFilter.set_expression], and they are
 * compared against a search term set with [method@Gtk.StringFilter.set_search].
 * 
 * `GtkStringFilter` has several different modes of comparison - it
 * can match the whole string, just a prefix, or any substring. Use
 * [method@Gtk.StringFilter.set_match_mode] choose a mode.
 * 
 * It is also possible to make case-insensitive comparisons, with
 * [method@Gtk.StringFilter.set_ignore_case].
 *
 */
@interface OGTKStringFilter : OGTKFilter
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkExpression*)expression;

/**
 * Methods
 */

- (GtkStringFilter*)castedGObject;

/**
 * Gets the expression that the string filter uses to
 * obtain strings from items.
 *
 * @return a `GtkExpression`
 */
- (GtkExpression*)expression;

/**
 * Returns whether the filter ignores case differences.
 *
 * @return %TRUE if the filter ignores case
 */
- (bool)ignoreCase;

/**
 * Returns the match mode that the filter is using.
 *
 * @return the match mode of the filter
 */
- (GtkStringFilterMatchMode)matchMode;

/**
 * Gets the search term.
 *
 * @return The search term
 */
- (OFString*)search;

/**
 * Sets the expression that the string filter uses to
 * obtain strings from items.
 * 
 * The expression must have a value type of %G_TYPE_STRING.
 *
 * @param expression a `GtkExpression`
 */
- (void)setExpression:(GtkExpression*)expression;

/**
 * Sets whether the filter ignores case differences.
 *
 * @param ignoreCase %TRUE to ignore case
 */
- (void)setIgnoreCase:(bool)ignoreCase;

/**
 * Sets the match mode for the filter.
 *
 * @param mode the new match mode
 */
- (void)setMatchMode:(GtkStringFilterMatchMode)mode;

/**
 * Sets the string to search for.
 *
 * @param search The string to search for
 *   or %NULL to clear the search
 */
- (void)setSearch:(OFString*)search;

@end