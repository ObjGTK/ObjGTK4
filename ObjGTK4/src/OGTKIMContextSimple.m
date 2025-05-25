/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMContextSimple.h"

@implementation OGTKIMContextSimple

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_IM_CONTEXT_SIMPLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_IM_CONTEXT_SIMPLE);
	return gObjectClass;
}

+ (instancetype)iMContextSimple
{
	GtkIMContextSimple* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_im_context_simple_new(), GTK_TYPE_IM_CONTEXT_SIMPLE, GtkIMContextSimple);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKIMContextSimple* wrapperObject;
	@try {
		wrapperObject = [[OGTKIMContextSimple alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkIMContextSimple*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_IM_CONTEXT_SIMPLE, GtkIMContextSimple);
}

- (void)addComposeFile:(OFString*)composeFile
{
	gtk_im_context_simple_add_compose_file((GtkIMContextSimple*)[self castedGObject], [composeFile UTF8String]);
}

- (void)addTableWithData:(guint16*)data maxSeqLen:(int)maxSeqLen nseqs:(int)nseqs
{
	gtk_im_context_simple_add_table((GtkIMContextSimple*)[self castedGObject], data, maxSeqLen, nseqs);
}


@end