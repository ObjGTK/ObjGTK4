/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMContextSimple.h"

@implementation OGTKIMContextSimple

- (instancetype)init
{
	GtkIMContextSimple* gobjectValue = GTK_IM_CONTEXT_SIMPLE(gtk_im_context_simple_new());

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

- (GtkIMContextSimple*)castedGObject
{
	return GTK_IM_CONTEXT_SIMPLE([self gObject]);
}

- (void)addComposeFile:(OFString*)composeFile
{
	gtk_im_context_simple_add_compose_file([self castedGObject], [composeFile UTF8String]);
}

- (void)addTableWithData:(guint16*)data maxSeqLen:(int)maxSeqLen nseqs:(int)nseqs
{
	gtk_im_context_simple_add_table([self castedGObject], data, maxSeqLen, nseqs);
}


@end