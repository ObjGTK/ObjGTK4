/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKProgressBar.h"

@implementation OGTKProgressBar

- (instancetype)init
{
	GtkProgressBar* gobjectValue = GTK_PROGRESS_BAR(gtk_progress_bar_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkProgressBar*)castedGObject
{
	return GTK_PROGRESS_BAR([self gObject]);
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = gtk_progress_bar_get_ellipsize([self castedGObject]);

	return returnValue;
}

- (double)fraction
{
	double returnValue = gtk_progress_bar_get_fraction([self castedGObject]);

	return returnValue;
}

- (bool)inverted
{
	bool returnValue = gtk_progress_bar_get_inverted([self castedGObject]);

	return returnValue;
}

- (double)pulseStep
{
	double returnValue = gtk_progress_bar_get_pulse_step([self castedGObject]);

	return returnValue;
}

- (bool)showText
{
	bool returnValue = gtk_progress_bar_get_show_text([self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_progress_bar_get_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)pulse
{
	gtk_progress_bar_pulse([self castedGObject]);
}

- (void)setEllipsize:(PangoEllipsizeMode)mode
{
	gtk_progress_bar_set_ellipsize([self castedGObject], mode);
}

- (void)setFraction:(double)fraction
{
	gtk_progress_bar_set_fraction([self castedGObject], fraction);
}

- (void)setInverted:(bool)inverted
{
	gtk_progress_bar_set_inverted([self castedGObject], inverted);
}

- (void)setPulseStep:(double)fraction
{
	gtk_progress_bar_set_pulse_step([self castedGObject], fraction);
}

- (void)setShowText:(bool)showText
{
	gtk_progress_bar_set_show_text([self castedGObject], showText);
}

- (void)setText:(OFString*)text
{
	gtk_progress_bar_set_text([self castedGObject], [text UTF8String]);
}


@end