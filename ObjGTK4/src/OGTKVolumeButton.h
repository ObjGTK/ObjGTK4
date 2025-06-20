/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScaleButton.h"

@class OGTKWidget;

/**
 * `GtkVolumeButton` is a `GtkScaleButton` subclass tailored for
 * volume control.
 * 
 * ![An example GtkVolumeButton](volumebutton.png)
 *
 */
@interface OGTKVolumeButton : OGTKScaleButton
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)volumeButton;

/**
 * Methods
 */

- (GtkVolumeButton*)castedGObject;

@end