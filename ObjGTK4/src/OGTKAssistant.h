/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindow.h"

@class OGTKWidget;
@class OGTKAssistantPage;

/**
 * `GtkAssistant` is used to represent a complex as a series of steps.
 * 
 * ![An example GtkAssistant](assistant.png)
 * 
 * Each step consists of one or more pages. `GtkAssistant` guides the user
 * through the pages, and controls the page flow to collect the data needed
 * for the operation.
 * 
 * `GtkAssistant` handles which buttons to show and to make sensitive based
 * on page sequence knowledge and the [enum@Gtk.AssistantPageType] of each
 * page in addition to state information like the *completed* and *committed*
 * page statuses.
 * 
 * If you have a case that doesn’t quite fit in `GtkAssistant`s way of
 * handling buttons, you can use the %GTK_ASSISTANT_PAGE_CUSTOM page
 * type and handle buttons yourself.
 * 
 * `GtkAssistant` maintains a `GtkAssistantPage` object for each added
 * child, which holds additional per-child properties. You
 * obtain the `GtkAssistantPage` for a child with [method@Gtk.Assistant.get_page].
 * 
 * # GtkAssistant as GtkBuildable
 * 
 * The `GtkAssistant` implementation of the `GtkBuildable` interface
 * exposes the @action_area as internal children with the name
 * “action_area”.
 * 
 * To add pages to an assistant in `GtkBuilder`, simply add it as a
 * child to the `GtkAssistant` object. If you need to set per-object
 * properties, create a `GtkAssistantPage` object explicitly, and
 * set the child widget as a property on it.
 * 
 * # CSS nodes
 * 
 * `GtkAssistant` has a single CSS node with the name window and style
 * class .assistant.
 *
 */
@interface OGTKAssistant : OGTKWindow
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkAssistant*)castedGObject;

/**
 * Adds a widget to the action area of a `GtkAssistant`.
 *
 * @param child a `GtkWidget`
 */
- (void)addActionWidget:(OGTKWidget*)child;

/**
 * Appends a page to the @assistant.
 *
 * @param page a `GtkWidget`
 * @return the index (starting at 0) of the inserted page
 */
- (int)appendPage:(OGTKWidget*)page;

/**
 * Erases the visited page history.
 * 
 * GTK will then hide the back button on the current page,
 * and removes the cancel button from subsequent pages.
 * 
 * Use this when the information provided up to the current
 * page is hereafter deemed permanent and cannot be modified
 * or undone. For example, showing a progress page to track
 * a long-running, unreversible operation after the user has
 * clicked apply on a confirmation page.
 *
 */
- (void)commit;

/**
 * Returns the page number of the current page.
 *
 * @return The index (starting from 0) of the current
 *   page in the @assistant, or -1 if the @assistant has no pages,
 *   or no current page
 */
- (int)currentPage;

/**
 * Returns the number of pages in the @assistant
 *
 * @return the number of pages in the @assistant
 */
- (int)npages;

/**
 * Returns the child widget contained in page number @page_num.
 *
 * @param pageNum the index of a page in the @assistant,
 *   or -1 to get the last page
 * @return the child widget, or %NULL
 *   if @page_num is out of bounds
 */
- (OGTKWidget*)nthPage:(int)pageNum;

/**
 * Returns the `GtkAssistantPage` object for @child.
 *
 * @param child a child of @assistant
 * @return the `GtkAssistantPage` for @child
 */
- (OGTKAssistantPage*)page:(OGTKWidget*)child;

/**
 * Gets whether @page is complete.
 *
 * @param page a page of @assistant
 * @return %TRUE if @page is complete.
 */
- (bool)pageComplete:(OGTKWidget*)page;

/**
 * Gets the title for @page.
 *
 * @param page a page of @assistant
 * @return the title for @page
 */
- (OFString*)pageTitle:(OGTKWidget*)page;

/**
 * Gets the page type of @page.
 *
 * @param page a page of @assistant
 * @return the page type of @page
 */
- (GtkAssistantPageType)pageType:(OGTKWidget*)page;

/**
 * Gets a list model of the assistant pages.
 *
 * @return A list model of the pages.
 */
- (GListModel*)pages;

/**
 * Inserts a page in the @assistant at a given position.
 *
 * @param page a `GtkWidget`
 * @param position the index (starting at 0) at which to insert the page,
 *   or -1 to append the page to the @assistant
 * @return the index (starting from 0) of the inserted page
 */
- (int)insertPageWithPage:(OGTKWidget*)page position:(int)position;

/**
 * Navigate to the next page.
 * 
 * It is a programming error to call this function when
 * there is no next page.
 * 
 * This function is for use when creating pages of the
 * %GTK_ASSISTANT_PAGE_CUSTOM type.
 *
 */
- (void)nextPage;

/**
 * Prepends a page to the @assistant.
 *
 * @param page a `GtkWidget`
 * @return the index (starting at 0) of the inserted page
 */
- (int)prependPage:(OGTKWidget*)page;

/**
 * Navigate to the previous visited page.
 * 
 * It is a programming error to call this function when
 * no previous page is available.
 * 
 * This function is for use when creating pages of the
 * %GTK_ASSISTANT_PAGE_CUSTOM type.
 *
 */
- (void)previousPage;

/**
 * Removes a widget from the action area of a `GtkAssistant`.
 *
 * @param child a `GtkWidget`
 */
- (void)removeActionWidget:(OGTKWidget*)child;

/**
 * Removes the @page_num’s page from @assistant.
 *
 * @param pageNum the index of a page in the @assistant,
 *   or -1 to remove the last page
 */
- (void)removePage:(int)pageNum;

/**
 * Switches the page to @page_num.
 * 
 * Note that this will only be necessary in custom buttons,
 * as the @assistant flow can be set with
 * gtk_assistant_set_forward_page_func().
 *
 * @param pageNum index of the page to switch to, starting from 0.
 *   If negative, the last page will be used. If greater
 *   than the number of pages in the @assistant, nothing
 *   will be done.
 */
- (void)setCurrentPage:(int)pageNum;

/**
 * Sets the page forwarding function to be @page_func.
 * 
 * This function will be used to determine what will be
 * the next page when the user presses the forward button.
 * Setting @page_func to %NULL will make the assistant to
 * use the default forward function, which just goes to the
 * next visible page.
 *
 * @param pageFunc the `GtkAssistantPageFunc`, or %NULL
 *   to use the default one
 * @param data user data for @page_func
 * @param destroy destroy notifier for @data
 */
- (void)setForwardPageFuncWithPageFunc:(GtkAssistantPageFunc)pageFunc data:(gpointer)data destroy:(GDestroyNotify)destroy;

/**
 * Sets whether @page contents are complete.
 * 
 * This will make @assistant update the buttons state
 * to be able to continue the task.
 *
 * @param page a page of @assistant
 * @param complete the completeness status of the page
 */
- (void)setPageCompleteWithPage:(OGTKWidget*)page complete:(bool)complete;

/**
 * Sets a title for @page.
 * 
 * The title is displayed in the header area of the assistant
 * when @page is the current page.
 *
 * @param page a page of @assistant
 * @param title the new title for @page
 */
- (void)setPageTitleWithPage:(OGTKWidget*)page title:(OFString*)title;

/**
 * Sets the page type for @page.
 * 
 * The page type determines the page behavior in the @assistant.
 *
 * @param page a page of @assistant
 * @param type the new type for @page
 */
- (void)setPageTypeWithPage:(OGTKWidget*)page type:(GtkAssistantPageType)type;

/**
 * Forces @assistant to recompute the buttons state.
 * 
 * GTK automatically takes care of this in most situations,
 * e.g. when the user goes to a different page, or when the
 * visibility or completeness of a page changes.
 * 
 * One situation where it can be necessary to call this
 * function is when changing a value on the current page
 * affects the future page flow of the assistant.
 *
 */
- (void)updateButtonsState;

@end