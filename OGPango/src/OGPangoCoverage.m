/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoCoverage.h"

@implementation OGPangoCoverage

+ (void)load
{
	GType gtypeToAssociate = pango_coverage_get_type();

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGPangoCoverage*)fromBytesWithBytes:(guchar*)bytes nbytes:(int)nbytes
{
	PangoCoverage* gobjectValue = pango_coverage_from_bytes(bytes, nbytes);

	OGPangoCoverage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (instancetype)init
{
	PangoCoverage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_coverage_new(), PangoCoverage, PangoCoverage);

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

- (PangoCoverage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoCoverage, PangoCoverage);
}

- (OGPangoCoverage*)copy
{
	PangoCoverage* gobjectValue = pango_coverage_copy([self castedGObject]);

	OGPangoCoverage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoCoverageLevel)get:(int)index
{
	PangoCoverageLevel returnValue = (PangoCoverageLevel)pango_coverage_get([self castedGObject], index);

	return returnValue;
}

- (void)max:(OGPangoCoverage*)other
{
	pango_coverage_max([self castedGObject], [other castedGObject]);
}

- (void)setWithIndex:(int)index level:(PangoCoverageLevel)level
{
	pango_coverage_set([self castedGObject], index, level);
}

- (void)toBytesWithBytes:(guchar**)bytes nbytes:(int*)nbytes
{
	pango_coverage_to_bytes([self castedGObject], bytes, nbytes);
}


@end
