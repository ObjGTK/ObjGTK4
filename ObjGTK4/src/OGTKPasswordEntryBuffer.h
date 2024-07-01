/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEntryBuffer.h"

/**
 * A `GtkEntryBuffer` that locks the underlying memory to prevent it
 * from being swapped to disk.
 * 
 * `GtkPasswordEntry` uses a `GtkPasswordEntryBuffer`.
 *
 */
@interface OGTKPasswordEntryBuffer : OGTKEntryBuffer
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkPasswordEntryBuffer*)castedGObject;

@end