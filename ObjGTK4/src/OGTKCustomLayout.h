/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

/**
 * `GtkCustomLayout` uses closures for size negotiation.
 * 
 * A `GtkCustomLayout `uses closures matching to the old `GtkWidget`
 * virtual functions for size negotiation, as a convenience API to
 * ease the porting towards the corresponding `GtkLayoutManager
 * virtual functions.
 *
 */
@interface OGTKCustomLayout : OGTKLayoutManager
{

}


/**
 * Constructors
 */
- (instancetype)initWithRequestMode:(GtkCustomRequestModeFunc)requestMode measure:(GtkCustomMeasureFunc)measure allocate:(GtkCustomAllocateFunc)allocate;

/**
 * Methods
 */

- (GtkCustomLayout*)castedGObject;

@end