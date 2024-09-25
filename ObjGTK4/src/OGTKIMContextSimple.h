/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMContext.h"

/**
 * `GtkIMContextSimple` is an input method supporting table-based input methods.
 * 
 * ## Compose sequences
 * 
 * `GtkIMContextSimple` reads compose sequences from the first of the
 * following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,
 * /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
 * Compose file). A subset of the file syntax described in the Compose(5)
 * manual page is supported. Additionally, `include "%L"` loads GTK’s built-in
 * table of compose sequences rather than the locale-specific one from X11.
 * 
 * If none of these files is found, `GtkIMContextSimple` uses a built-in table
 * of compose sequences that is derived from the X11 Compose files.
 * 
 * Note that compose sequences typically start with the Compose_key, which is
 * often not available as a dedicated key on keyboards. Keyboard layouts may
 * map this keysym to other keys, such as the right Control key.
 * 
 * ## Unicode characters
 * 
 * `GtkIMContextSimple` also supports numeric entry of Unicode characters
 * by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a
 * hexadecimal Unicode codepoint.
 * 
 * For example,
 * 
 *     Ctrl-Shift-u 1 2 3 Enter
 * 
 * yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.
 * 
 * ## Dead keys
 * 
 * `GtkIMContextSimple` supports dead keys. For example, typing
 * 
 *     dead_acute a
 * 
 *  yields U+00E! LATIN SMALL LETTER_A WITH ACUTE, i.e. á. Note that this
 *  depends on the keyboard layout including dead keys.
 *
 */
@interface OGTKIMContextSimple : OGTKIMContext
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkIMContextSimple*)castedGObject;

/**
 * Adds an additional table from the X11 compose file.
 *
 * @param composeFile The path of compose file
 */
- (void)addComposeFile:(OFString*)composeFile;

/**
 * Adds an additional table to search to the input context.
 * Each row of the table consists of @max_seq_len key symbols
 * followed by two #guint16 interpreted as the high and low
 * words of a #gunicode value. Tables are searched starting
 * from the last added.
 * 
 * The table must be sorted in dictionary order on the
 * numeric value of the key symbol fields. (Values beyond
 * the length of the sequence should be zero.)
 *
 * @param data the table
 * @param maxSeqLen Maximum length of a sequence in the table
 * @param nseqs number of sequences in the table
 */
- (void)addTableWithData:(guint16*)data maxSeqLen:(int)maxSeqLen nseqs:(int)nseqs;

@end