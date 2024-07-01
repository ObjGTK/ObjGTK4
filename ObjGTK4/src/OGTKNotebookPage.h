/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkNotebookPage` is an auxiliary object used by `GtkNotebook`.
 *
 */
@interface OGTKNotebookPage : OGObject
{

}


/**
 * Methods
 */

- (GtkNotebookPage*)castedGObject;

/**
 * Returns the notebook child to which @page belongs.
 *
 * @return the child to which @page belongs
 */
- (OGTKWidget*)child;

@end