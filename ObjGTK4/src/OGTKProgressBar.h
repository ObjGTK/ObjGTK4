/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkProgressBar` is typically used to display the progress of a long
 * running operation.
 * 
 * It provides a visual clue that processing is underway. `GtkProgressBar`
 * can be used in two different modes: percentage mode and activity mode.
 * 
 * ![An example GtkProgressBar](progressbar.png)
 * 
 * When an application can determine how much work needs to take place
 * (e.g. read a fixed number of bytes from a file) and can monitor its
 * progress, it can use the `GtkProgressBar` in percentage mode and the
 * user sees a growing bar indicating the percentage of the work that
 * has been completed. In this mode, the application is required to call
 * [method@Gtk.ProgressBar.set_fraction] periodically to update the progress bar.
 * 
 * When an application has no accurate way of knowing the amount of work
 * to do, it can use the `GtkProgressBar` in activity mode, which shows
 * activity by a block moving back and forth within the progress area. In
 * this mode, the application is required to call [method@Gtk.ProgressBar.pulse]
 * periodically to update the progress bar.
 * 
 * There is quite a bit of flexibility provided to control the appearance
 * of the `GtkProgressBar`. Functions are provided to control the orientation
 * of the bar, optional text can be displayed along with the bar, and the
 * step size used in activity mode can be set.
 * 
 * # CSS nodes
 * 
 * ```
 * progressbar[.osd]
 * ├── [text]
 * ╰── trough[.empty][.full]
 *     ╰── progress[.pulse]
 * ```
 * 
 * `GtkProgressBar` has a main CSS node with name progressbar and subnodes with
 * names text and trough, of which the latter has a subnode named progress. The
 * text subnode is only present if text is shown. The progress subnode has the
 * style class .pulse when in activity mode. It gets the style classes .left,
 * .right, .top or .bottom added when the progress 'touches' the corresponding
 * end of the GtkProgressBar. The .osd class on the progressbar node is for use
 * in overlays like the one Epiphany has for page loading progress.
 * 
 * # Accessibility
 * 
 * `GtkProgressBar` uses the %GTK_ACCESSIBLE_ROLE_PROGRESS_BAR role.
 *
 */
@interface OGTKProgressBar : OGTKWidget
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
+ (instancetype)progressBar;

/**
 * Methods
 */

- (GtkProgressBar*)castedGObject;

/**
 * Returns the ellipsizing position of the progress bar.
 * 
 * See [method@Gtk.ProgressBar.set_ellipsize].
 *
 * @return `PangoEllipsizeMode`
 */
- (PangoEllipsizeMode)ellipsize;

/**
 * Returns the current fraction of the task that’s been completed.
 *
 * @return a fraction from 0.0 to 1.0
 */
- (double)fraction;

/**
 * Returns whether the progress bar is inverted.
 *
 * @return %TRUE if the progress bar is inverted
 */
- (bool)inverted;

/**
 * Retrieves the pulse step.
 * 
 * See [method@Gtk.ProgressBar.set_pulse_step].
 *
 * @return a fraction from 0.0 to 1.0
 */
- (double)pulseStep;

/**
 * Returns whether the `GtkProgressBar` shows text.
 * 
 * See [method@Gtk.ProgressBar.set_show_text].
 *
 * @return %TRUE if text is shown in the progress bar
 */
- (bool)showText;

/**
 * Retrieves the text that is displayed with the progress bar.
 * 
 * The return value is a reference to the text, not a copy of it,
 * so will become invalid if you change the text in the progress bar.
 *
 * @return the text
 */
- (OFString*)text;

/**
 * Indicates that some progress has been made, but you don’t know how much.
 * 
 * Causes the progress bar to enter “activity mode,” where a block
 * bounces back and forth. Each call to [method@Gtk.ProgressBar.pulse]
 * causes the block to move by a little bit (the amount of movement
 * per pulse is determined by [method@Gtk.ProgressBar.set_pulse_step]).
 *
 */
- (void)pulse;

/**
 * Sets the mode used to ellipsize the text.
 * 
 * The text is ellipsized if there is not enough space
 * to render the entire string.
 *
 * @param mode a `PangoEllipsizeMode`
 */
- (void)setEllipsizeWithMode:(PangoEllipsizeMode)mode;

/**
 * Causes the progress bar to “fill in” the given fraction
 * of the bar.
 * 
 * The fraction should be between 0.0 and 1.0, inclusive.
 *
 * @param fraction fraction of the task that’s been completed
 */
- (void)setFraction:(double)fraction;

/**
 * Sets whether the progress bar is inverted.
 * 
 * Progress bars normally grow from top to bottom or left to right.
 * Inverted progress bars grow in the opposite direction.
 *
 * @param inverted %TRUE to invert the progress bar
 */
- (void)setInverted:(bool)inverted;

/**
 * Sets the fraction of total progress bar length to move the
 * bouncing block.
 * 
 * The bouncing block is moved when [method@Gtk.ProgressBar.pulse]
 * is called.
 *
 * @param fraction fraction between 0.0 and 1.0
 */
- (void)setPulseStepWithFraction:(double)fraction;

/**
 * Sets whether the progress bar will show text next to the bar.
 * 
 * The shown text is either the value of the [property@Gtk.ProgressBar:text]
 * property or, if that is %NULL, the [property@Gtk.ProgressBar:fraction] value,
 * as a percentage.
 * 
 * To make a progress bar that is styled and sized suitably for containing
 * text (even if the actual text is blank), set [property@Gtk.ProgressBar:show-text]
 * to %TRUE and [property@Gtk.ProgressBar:text] to the empty string (not %NULL).
 *
 * @param showText whether to show text
 */
- (void)setShowText:(bool)showText;

/**
 * Causes the given @text to appear next to the progress bar.
 * 
 * If @text is %NULL and [property@Gtk.ProgressBar:show-text] is %TRUE,
 * the current value of [property@Gtk.ProgressBar:fraction] will be displayed
 * as a percentage.
 * 
 * If @text is non-%NULL and [property@Gtk.ProgressBar:show-text] is %TRUE,
 * the text will be displayed. In this case, it will not display the progress
 * percentage. If @text is the empty string, the progress bar will still
 * be styled and sized suitably for containing text, as long as
 * [property@Gtk.ProgressBar:show-text] is %TRUE.
 *
 * @param text a UTF-8 string
 */
- (void)setText:(OFString*)text;

@end