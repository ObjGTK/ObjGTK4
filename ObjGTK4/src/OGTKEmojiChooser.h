/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopover.h"

@class OGTKWidget;

/**
 * The `GtkEmojiChooser` is used by text widgets such as `GtkEntry` or
 * `GtkTextView` to let users insert Emoji characters.
 * 
 * ![An example GtkEmojiChooser](emojichooser.png)
 * 
 * `GtkEmojiChooser` emits the [signal@Gtk.EmojiChooser::emoji-picked]
 * signal when an Emoji is selected.
 * 
 * # CSS nodes
 * 
 * ```
 * popover
 * ├── box.emoji-searchbar
 * │   ╰── entry.search
 * ╰── box.emoji-toolbar
 *     ├── button.image-button.emoji-section
 *     ├── ...
 *     ╰── button.image-button.emoji-section
 * ```
 * 
 * Every `GtkEmojiChooser` consists of a main node called popover.
 * The contents of the popover are largely implementation defined
 * and supposed to inherit general styles.
 * The top searchbar used to search emoji and gets the .emoji-searchbar
 * style class itself.
 * The bottom toolbar used to switch between different emoji categories
 * consists of buttons with the .emoji-section style class and gets the
 * .emoji-toolbar style class itself.
 *
 */
@interface OGTKEmojiChooser : OGTKPopover
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkEmojiChooser*)castedGObject;

@end