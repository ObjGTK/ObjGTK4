/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkListBase` is the abstract base class for GTK's list widgets.
 *
 */
@interface OGTKListBase : OGTKWidget
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Methods
 */

- (GtkListBase*)castedGObject;

@end