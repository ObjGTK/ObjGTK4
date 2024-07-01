/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoCoverage.h"

@implementation OGPangoCoverage

+ (OGPangoCoverage*)fromBytesWithBytes:(guchar*)bytes nbytes:(int)nbytes
{
	PangoCoverage* gobjectValue = PANGO_COVERAGE(pango_coverage_from_bytes(bytes, nbytes));

	OGPangoCoverage* returnValue = [OGPangoCoverage withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (instancetype)init
{
	PangoCoverage* gobjectValue = PANGO_COVERAGE(pango_coverage_new());

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
	return PANGO_COVERAGE([self gObject]);
}

- (OGPangoCoverage*)copy
{
	PangoCoverage* gobjectValue = PANGO_COVERAGE(pango_coverage_copy([self castedGObject]));

	OGPangoCoverage* returnValue = [OGPangoCoverage withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoCoverageLevel)get:(int)index
{
	PangoCoverageLevel returnValue = pango_coverage_get([self castedGObject], index);

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