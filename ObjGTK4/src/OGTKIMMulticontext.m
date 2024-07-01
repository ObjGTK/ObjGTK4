/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMMulticontext.h"

@implementation OGTKIMMulticontext

- (instancetype)init
{
	GtkIMMulticontext* gobjectValue = GTK_IM_MULTICONTEXT(gtk_im_multicontext_new());

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

- (GtkIMMulticontext*)castedGObject
{
	return GTK_IM_MULTICONTEXT([self gObject]);
}

- (OFString*)contextId
{
	const char* gobjectValue = gtk_im_multicontext_get_context_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setContextId:(OFString*)contextId
{
	gtk_im_multicontext_set_context_id([self castedGObject], [contextId UTF8String]);
}


@end