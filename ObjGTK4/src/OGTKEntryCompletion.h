/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKCellArea;
@class OGTKWidget;

/**
 * `GtkEntryCompletion` is an auxiliary object to provide completion functionality
 * for `GtkEntry`.
 * 
 * It implements the [iface@Gtk.CellLayout] interface, to allow the user
 * to add extra cells to the `GtkTreeView` with completion matches.
 * 
 * “Completion functionality” means that when the user modifies the text
 * in the entry, `GtkEntryCompletion` checks which rows in the model match
 * the current content of the entry, and displays a list of matches.
 * By default, the matching is done by comparing the entry text
 * case-insensitively against the text column of the model (see
 * [method@Gtk.EntryCompletion.set_text_column]), but this can be overridden
 * with a custom match function (see [method@Gtk.EntryCompletion.set_match_func]).
 * 
 * When the user selects a completion, the content of the entry is
 * updated. By default, the content of the entry is replaced by the
 * text column of the model, but this can be overridden by connecting
 * to the [signal@Gtk.EntryCompletion::match-selected] signal and updating the
 * entry in the signal handler. Note that you should return %TRUE from
 * the signal handler to suppress the default behaviour.
 * 
 * To add completion functionality to an entry, use
 * [method@Gtk.Entry.set_completion].
 * 
 * `GtkEntryCompletion` uses a [class@Gtk.TreeModelFilter] model to
 * represent the subset of the entire model that is currently matching.
 * While the `GtkEntryCompletion` signals
 * [signal@Gtk.EntryCompletion::match-selected] and
 * [signal@Gtk.EntryCompletion::cursor-on-match] take the original model
 * and an iter pointing to that model as arguments, other callbacks and
 * signals (such as `GtkCellLayoutDataFunc` or
 * [signal@Gtk.CellArea::apply-attributes)]
 * will generally take the filter model as argument. As long as you are
 * only calling [method@Gtk.TreeModel.get], this will make no difference to
 * you. If for some reason, you need the original model, use
 * [method@Gtk.TreeModelFilter.get_model]. Don’t forget to use
 * [method@Gtk.TreeModelFilter.convert_iter_to_child_iter] to obtain a
 * matching iter.
 *
 */
@interface OGTKEntryCompletion : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithArea:(OGTKCellArea*)area;

/**
 * Methods
 */

- (GtkEntryCompletion*)castedGObject;

/**
 * Requests a completion operation, or in other words a refiltering of the
 * current list with completions, using the current key.
 * 
 * The completion list view will be updated accordingly.
 *
 */
- (void)complete;

/**
 * Computes the common prefix that is shared by all rows in @completion
 * that start with @key.
 * 
 * If no row matches @key, %NULL will be returned.
 * Note that a text column must have been set for this function to work,
 * see [method@Gtk.EntryCompletion.set_text_column] for details.
 *
 * @param key The text to complete for
 * @return The common prefix all rows
 *   starting with @key
 */
- (char*)computePrefix:(OFString*)key;

/**
 * Get the original text entered by the user that triggered
 * the completion or %NULL if there’s no completion ongoing.
 *
 * @return the prefix for the current completion
 */
- (OFString*)completionPrefix;

/**
 * Gets the entry @completion has been attached to.
 *
 * @return The entry @completion has been attached to
 */
- (OGTKWidget*)entry;

/**
 * Returns whether the common prefix of the possible completions should
 * be automatically inserted in the entry.
 *
 * @return %TRUE if inline completion is turned on
 */
- (bool)inlineCompletion;

/**
 * Returns %TRUE if inline-selection mode is turned on.
 *
 * @return %TRUE if inline-selection mode is on
 */
- (bool)inlineSelection;

/**
 * Returns the minimum key length as set for @completion.
 *
 * @return The currently used minimum key length
 */
- (int)minimumKeyLength;

/**
 * Returns the model the `GtkEntryCompletion` is using as data source.
 * 
 * Returns %NULL if the model is unset.
 *
 * @return A `GtkTreeModel`
 */
- (GtkTreeModel*)model;

/**
 * Returns whether the completions should be presented in a popup window.
 *
 * @return %TRUE if popup completion is turned on
 */
- (bool)popupCompletion;

/**
 * Returns whether the completion popup window will be resized to the
 * width of the entry.
 *
 * @return %TRUE if the popup window will be resized to the width of
 *   the entry
 */
- (bool)popupSetWidth;

/**
 * Returns whether the completion popup window will appear even if there is
 * only a single match.
 *
 * @return %TRUE if the popup window will appear regardless of the
 *    number of matches
 */
- (bool)popupSingleMatch;

/**
 * Returns the column in the model of @completion to get strings from.
 *
 * @return the column containing the strings
 */
- (int)textColumn;

/**
 * Requests a prefix insertion.
 *
 */
- (void)insertPrefix;

/**
 * Sets whether the common prefix of the possible completions should
 * be automatically inserted in the entry.
 *
 * @param inlineCompletion %TRUE to do inline completion
 */
- (void)setInlineCompletion:(bool)inlineCompletion;

/**
 * Sets whether it is possible to cycle through the possible completions
 * inside the entry.
 *
 * @param inlineSelection %TRUE to do inline selection
 */
- (void)setInlineSelection:(bool)inlineSelection;

/**
 * Sets the match function for @completion to be @func.
 * 
 * The match function is used to determine if a row should or
 * should not be in the completion list.
 *
 * @param func the `GtkEntryCompletion`MatchFunc to use
 * @param funcData user data for @func
 * @param funcNotify destroy notify for @func_data.
 */
- (void)setMatchFuncWithFunc:(GtkEntryCompletionMatchFunc)func funcData:(gpointer)funcData funcNotify:(GDestroyNotify)funcNotify;

/**
 * Requires the length of the search key for @completion to be at least
 * @length.
 * 
 * This is useful for long lists, where completing using a small
 * key takes a lot of time and will come up with meaningless results anyway
 * (ie, a too large dataset).
 *
 * @param length the minimum length of the key in order to start completing
 */
- (void)setMinimumKeyLength:(int)length;

/**
 * Sets the model for a `GtkEntryCompletion`.
 * 
 * If @completion already has a model set, it will remove it
 * before setting the new model. If model is %NULL, then it
 * will unset the model.
 *
 * @param model the `GtkTreeModel`
 */
- (void)setModel:(GtkTreeModel*)model;

/**
 * Sets whether the completions should be presented in a popup window.
 *
 * @param popupCompletion %TRUE to do popup completion
 */
- (void)setPopupCompletion:(bool)popupCompletion;

/**
 * Sets whether the completion popup window will be resized to be the same
 * width as the entry.
 *
 * @param popupSetWidth %TRUE to make the width of the popup the same as the entry
 */
- (void)setPopupSetWidth:(bool)popupSetWidth;

/**
 * Sets whether the completion popup window will appear even if there is
 * only a single match.
 * 
 * You may want to set this to %FALSE if you
 * are using [property@Gtk.EntryCompletion:inline-completion].
 *
 * @param popupSingleMatch %TRUE if the popup should appear even for a single match
 */
- (void)setPopupSingleMatch:(bool)popupSingleMatch;

/**
 * Convenience function for setting up the most used case of this code: a
 * completion list with just strings.
 * 
 * This function will set up @completion
 * to have a list displaying all (and just) strings in the completion list,
 * and to get those strings from @column in the model of @completion.
 * 
 * This functions creates and adds a `GtkCellRendererText` for the selected
 * column. If you need to set the text column, but don't want the cell
 * renderer, use g_object_set() to set the
 * [property@Gtk.EntryCompletion:text-column] property directly.
 *
 * @param column the column in the model of @completion to get strings from
 */
- (void)setTextColumn:(int)column;

@end