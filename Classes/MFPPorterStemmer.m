#import "MFPPorterStemmer.h"
#import "porter.c"

@implementation MFPPorterStemmer

+ (NSString*)stemFromString:(NSString*)input
{
  NSInteger MAX_STEMMER_STRING_LEN = 256;
  struct stemmer stemmer;
	char stemBuffer[MAX_STEMMER_STRING_LEN];

	strncpy(stemBuffer, [input cStringUsingEncoding:NSUTF8StringEncoding],
			MAX_STEMMER_STRING_LEN - 1);

	int i = (int)strlen(stemBuffer) - 1;
	stemBuffer[stem(&stemmer, stemBuffer, i) + 1] = '\0';

	NSString* stem = [NSString stringWithCString:stemBuffer encoding:NSUTF8StringEncoding];
    return stem;
}

@end
