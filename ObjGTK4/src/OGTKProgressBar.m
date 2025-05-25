/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKProgressBar.h"

@implementation OGTKProgressBar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PROGRESS_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PROGRESS_BAR);
	return gObjectClass;
}

+ (instancetype)progressBar
{
	GtkProgressBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_progress_bar_new(), GTK_TYPE_PROGRESS_BAR, GtkProgressBar);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PROGRESS_BAR, GtkProgressBar);
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = (PangoEllipsizeMode)gtk_progress_bar_get_ellipsize((GtkProgressBar*)[self castedGObject]);

	return returnValue;
}

- (double)fraction
{
	double returnValue = (double)gtk_progress_bar_get_fraction((GtkProgressBar*)[self castedGObject]);

	return returnValue;
}

- (bool)inverted
{
	bool returnValue = (bool)gtk_progress_bar_get_inverted((GtkProgressBar*)[self castedGObject]);

	return returnValue;
}

- (double)pulseStep
{
	double returnValue = (double)gtk_progress_bar_get_pulse_step((GtkProgressBar*)[self castedGObject]);

	return returnValue;
}

- (bool)showText
{
	bool returnValue = (bool)gtk_progress_bar_get_show_text((GtkProgressBar*)[self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_progress_bar_get_text((GtkProgressBar*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)pulse
{
	gtk_progress_bar_pulse((GtkProgressBar*)[self castedGObject]);
}

- (void)setEllipsizeWithMode:(PangoEllipsizeMode)mode
{
	gtk_progress_bar_set_ellipsize((GtkProgressBar*)[self castedGObject], mode);
}

- (void)setFraction:(double)fraction
{
	gtk_progress_bar_set_fraction((GtkProgressBar*)[self castedGObject], fraction);
}

- (void)setInverted:(bool)inverted
{
	gtk_progress_bar_set_inverted((GtkProgressBar*)[self castedGObject], inverted);
}

- (void)setPulseStepWithFraction:(double)fraction
{
	gtk_progress_bar_set_pulse_step((GtkProgressBar*)[self castedGObject], fraction);
}

- (void)setShowText:(bool)showText
{
	gtk_progress_bar_set_show_text((GtkProgressBar*)[self castedGObject], showText);
}

- (void)setText:(OFString*)text
{
	gtk_progress_bar_set_text((GtkProgressBar*)[self castedGObject], [text UTF8String]);
}


@end