//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}
///////     1
- (NSArray*) arrayBySortingArrayAscending: (NSArray*)array {
    NSSortDescriptor *sortByAsc = [NSSortDescriptor sortDescriptorWithKey:nil  ascending: YES];
    
    NSArray *newArray = [array sortedArrayUsingDescriptors:@[sortByAsc]];
    NSLog(@"%@", newArray);
    return newArray;
}

///////     2
- (NSArray*) arrayBySortingArrayDescending: (NSArray*) array{
    NSSortDescriptor *sortByAsc = [NSSortDescriptor sortDescriptorWithKey:nil  ascending: YES];
    NSSortDescriptor *sortByDesc = [sortByAsc reversedSortDescriptor];
    
    NSArray *newArray = [array sortedArrayUsingDescriptors:@[sortByDesc]];
    NSLog(@"%@", newArray);
    return newArray;
    
}
/////////    3
- (NSArray*) arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray*) array{
    NSMutableArray *mArray = [array mutableCopy];
    [mArray exchangeObjectAtIndex:0 withObjectAtIndex:[array count]-1];
    return mArray;
}
/////////    4
- (NSArray*) arrayByReversingArray:(NSArray*) array{
    NSMutableArray *mArray = [array mutableCopy];
    [[mArray reverseObjectEnumerator]allObjects];
    NSLog(@"%@",mArray);
    return[[mArray reverseObjectEnumerator]allObjects];
}

/////////    5
- (NSString*) stringInBasicLeetFromString:(NSString*) array{
    NSString *newReplace = @"basic leet";
    newReplace =    [newReplace stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    newReplace =    [newReplace stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    newReplace =    [newReplace stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    newReplace =     [newReplace stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    newReplace =     [newReplace stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    newReplace =     [newReplace stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    NSLog(@"%@",newReplace);
    return newReplace;
}

/////////    6
- (NSArray*) splitArrayIntoNegativesAndPositives: (NSArray*) array{
    NSMutableArray *splitArrays = [[NSMutableArray alloc]init];
    NSPredicate *splitPos = [NSPredicate predicateWithFormat: @"SELF < 0"];
    NSPredicate *splitNeg = [NSPredicate predicateWithFormat: @"SELF >= 0"];
    NSArray *positive = [array filteredArrayUsingPredicate:splitPos];
    NSArray *negative = [array filteredArrayUsingPredicate:splitNeg];
    [splitArrays addObject:positive];
    [splitArrays addObject:negative];
    return splitArrays;
}

/////////    7
- (NSArray*) namesOfHobbitsInDictionary: (NSDictionary*) hobbits{
    NSArray *names = [hobbits allKeysForObject:@"hobbit"];
    return names;
}

/////////    8
- (NSArray*) stringsBeginningWithAInArray: (NSArray*) array{
    NSPredicate *aNames = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'a'"];
    NSArray *namesWithA = [array filteredArrayUsingPredicate:aNames];
    
    return namesWithA;
}

//////////    9
- (NSInteger) sumOfIntegersInArray: (NSArray*) array{
    
    NSInteger sum = 0;
    for (NSNumber *num in array) {
        sum += [num intValue];
    }
    return sum;
}

//////////    10
- (NSArray*) arrayByPluralizingStringsInArray: (NSArray*) array{
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"hand",@"foot",@"knee", @"table",@"box",@"ox",@"axle",@"radius",@"trivium",nil];
    NSIndexSet *index = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 9)];
    NSArray *new = [NSArray arrayWithObjects:@"hands",@"feet",@"knees",@"tables",@"boxes",@"oxen",@"axles",
                    @"radii",@"trivia", nil];
    [mArray replaceObjectsAtIndexes:index withObjects: new];
    
    return mArray;
}
/////////    11
- (NSDictionary*) countsOfWordsInString: (NSString*) string{
    
    NSArray *punctuations = @[@",", @";", @"-", @"."];
    NSString *noPunc = [string copy];
    
    for (NSString *punctuation in punctuations) {
        noPunc = [noPunc stringByReplacingOccurrencesOfString:punctuation withString:(@"")];
    }
    
    noPunc = [noPunc lowercaseString];
    NSArray *arrayWithWords = [noPunc componentsSeparatedByString:(@" ")];
    
    NSMutableDictionary *countingWords = [[NSMutableDictionary alloc]init];
    
    NSUInteger count = 0;
    
    for (NSString *words in arrayWithWords) {
        if ( [countingWords[words] integerValue] > 0) {
            count = [countingWords[words] integerValue] + 1;
            countingWords[words] = @(count);
        } else countingWords[words] = @1;
    }
    return [NSDictionary dictionaryWithDictionary: countingWords];
}

////////    12
- (NSDictionary*) songsGroupedByArtistFromArray: (NSArray*) array{
    
    NSMutableDictionary *artistsFromArray = [[NSMutableDictionary alloc]init];
    
    for (NSString *string in array) {
        NSArray *artistsWithSongs = [string componentsSeparatedByString: @" - "];
        NSString *songs = artistsWithSongs[1];
        NSString *artists = artistsWithSongs[0];
        
        if([[artistsFromArray allKeys] containsObject:artists]) {
            [artistsFromArray[artists] addObject:songs];
        } else {
            artistsFromArray[artists] = [ @[songs] mutableCopy];
        }
    }
        NSSortDescriptor *alphabetize = [NSSortDescriptor sortDescriptorWithKey:nil  ascending:YES];
        
        for (NSString *artists in artistsFromArray) {
            [artistsFromArray[artists] sortUsingDescriptors:@[alphabetize]];
            
        }
        return [NSDictionary dictionaryWithDictionary:artistsFromArray];
        
    }

@end
    

