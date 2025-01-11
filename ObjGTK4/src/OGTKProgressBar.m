/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKProgressBar.h"

@implementation OGTKProgressBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PROGRESS_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)progressBar
{
	GtkProgressBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_progress_bar_new(), GtkProgressBar, GtkProgressBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKProgressBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKProgressBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkProgressBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkProgressBar, GtkProgressBar);
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = (PangoEllipsizeMode)gtk_progress_bar_get_ellipsize([self castedGObject]);

	return returnValue;
}

- (double)fraction
{
	double returnValue = (double)gtk_progress_bar_get_fraction([self castedGObject]);

	return returnValue;
}

- (bool)inverted
{
	bool returnValue = (bool)gtk_progress_bar_get_inverted([self castedGObject]);

	return returnValue;
}

- (double)pulseStep
{
	double returnValue = (double)gtk_progress_bar_get_pulse_step([self castedGObject]);

	return returnValue;
}

- (bool)showText
{
	bool returnValue = (bool)gtk_progress_bar_get_show_text([self castedGObject]);

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