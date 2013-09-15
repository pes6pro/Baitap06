//
//  ViewController.m
//  AllCollectionDemo
//
//  Created by techmaster on 9/14/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Dump.h"
#import "NSArray+Loop.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)basicArray:(id)sender {
    NSArray * array = @[@"a String", @3.14158, self, self.view];
    for (id object in array) {
        NSLog(@"%@", object);
    }
    
    NSArray * twoDArray = @[@[@"C11", @"C12", @"C13"],
                            @[@"C21", @"C22", @"C23", @"C24"],
                            @[@"C31", @"C32", @"C33"]];
    
    for (id subArray in twoDArray) {
        for (id object in subArray) {
            NSLog(@"%@", object);  //thử in các phần tử cùng hàng chỉ trên một hàng thì bằng cách nào?
        }
    }
    
    id aObject = twoDArray[2][2];
    NSLog(@"twoDArray %@", aObject);
    
    @try {
        id aGhostObject = twoDArray[2][4];
        NSLog(@"%@", aGhostObject);
    }
    @catch (NSException *exception) {
        NSLog(@"Error: %@", exception.name);
    }
        
}

- (IBAction)cArray:(id)sender {
    int intArray[] = {12, 13, 15, 16, 17, 18, 19};
    int count =  sizeof(intArray)/sizeof(intArray[0]);
    for (int i = 0; i < count; i++) {
        printf("%d\n", intArray[i]);
    }
    
    id funArray[] = {@"Hello World", self, self.view, @3.14158}; //Đây là C array lưu trữ các phần tử NSObject
    for (int i=0; i < 4; i++) {
        NSLog(@"%@", funArray[i]);
    }
}

- (IBAction)loadDataFromPlist:(id)sender {
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"array" ofType:@"plist"];
    NSLog(@"Path: %@",dataPath);
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:dataPath];

    
    //[array dump];
    [array loopArr];
    

}
- (IBAction)explodeString:(id)sender {
    NSString *string = @"This.is.a.monkey.in.the.air";
    NSArray *array = [string componentsSeparatedByString:@"."];    
    [array dump];
}

- (IBAction)mutableArray:(id)sender {
    NSMutableArray *muArray = [[NSMutableArray alloc] initWithArray:
    @[@"MU", @"Barcelona", @"Real Madrid", @"Asernal"]];
    
    [muArray exchangeObjectAtIndex:0 withObjectAtIndex:3];
    [muArray dump];
    
    [muArray addObjectsFromArray:@[@"Everton", @"Chievo", @"AC Milan", @"TheCong"]];
    [muArray dump];
}
- (IBAction)demoPredicate:(id)sender {
    //http://nshipster.com/nspredicate/
    NSArray *numArr = @[@3.14158, @2, @-2, @-100, @110, @98, @-108];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF > 0.0 && SELF < 100"];
    
    NSArray *positiveArray = [numArr filteredArrayUsingPredicate:pred];
    
    [positiveArray dump];
//    static NSString * FNKey = @"fname";
//    static NSString * LNKey = @"lname";
//    NSArray *peopeArr = @[@{FNKey: @"Trinh", LNKey: @"Cuong"},
//                          @{FNKey: @"Nguyen", LNKey: @"Thanh"}];
//    NSPredicate *predS = [NSPredicate predicateWithFormat:@"SELF[fname] like 'Trinh'"];
    
}

- (IBAction)footBallManager:(id)sender {
    
    NSMutableArray *myClubArr = [[NSMutableArray alloc] initWithArray:
                               @[@"Number1", @"Number2", @"Number3", @"Number4"
                               ,@"Number5",@"Number6",@"Number7",@"Number8"
                               ,@"Number9",@"Number10",@"Number11",@"Number12"
                               ,@"Number13",@"Number14",@"Number15",@"Number16"
                               ,@"Number17",@"Number18",@"Number19",@"Number20"
                               ,@"Number21",@"Number22",@"Number23",@"Number24"]];
    NSMutableArray *outArr = [[NSMutableArray alloc] init];
    int  arrCount = [myClubArr count];
    for (int i =0; i<11; i++) {
        int randNum = arc4random() % (arrCount-i);
        //Sets the string returnValue to a random string in the array
        NSString *returnValue =  [myClubArr objectAtIndex:randNum];
        [myClubArr exchangeObjectAtIndex:randNum withObjectAtIndex:arrCount-i-1];
        [outArr addObject:returnValue];
        
    }
    
    [outArr dump];
    NSLog(@"\n");
    
    
    
    
}

- (IBAction)countSet:(id)sender {
    
    NSCountedSet *coundSet = [[NSCountedSet alloc] initWithArray:@[@"Messi",@"Tran Bang",@"Ronaldo",@"Cong Vinh",
                              @"Ozil",@"Henry",@"Flamini",@"Messi",@"Tran Bang",@"Ronaldo",@"Ozil",
                              @"Ozil",@"Google",@"Sex",@"Baby",@"Candle",]];
    for (id obj in coundSet) {
        NSLog(@"%@--%d",obj,[coundSet countForObject:obj]);
    }
    
}


- (IBAction)putinAction:(id)sender {
    
    //Tran Van Bang lop IOS17
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"putin" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    content = [content stringByReplacingOccurrencesOfString:@"." withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"," withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"-" withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    content = [content lowercaseString];
    
    NSArray *array = [content componentsSeparatedByString:@" "];
    NSMutableArray *putinArr = [NSMutableArray arrayWithArray:array];
    //NSLog(@"putin = %@",putinArr);
    //[putinArr dump];
	for(int i=0; i<[putinArr count]; i++) {
		id element = [putinArr objectAtIndex:i];
		if([element isEqualToString:@""]) {
			[putinArr removeObjectAtIndex:i];
			i--;
		}
	}
    
    
    //dem so lan xuat hien cua 1 phan tu trong array
    NSCountedSet *coundSet = [[NSCountedSet alloc] initWithArray:putinArr];
    NSLog(@"dem so lan xuat hien cua 1 phan tu trong array");
    for (id obj in coundSet) {
        NSLog(@"%@ loop %d",obj,[coundSet countForObject:obj]);
    }
    NSLog(@"\n");
    
    //loai bo phan tu trung nhau trong array
    NSArray *noDuplicates = [[NSSet setWithArray: putinArr] allObjects];
    coundSet = [[NSCountedSet alloc] initWithArray:noDuplicates];
    NSLog(@"loai bo phan tu trung nhau trong array");
    for (id obj in coundSet) {
        NSLog(@"%@ loop %d",obj,[coundSet countForObject:obj]);
    }
    NSLog(@"\n");
    

    
    //sap xep theo Alphabet sau khi loai bo phan tu trung nhau
    NSLog(@"sap xep theo Alphabet");
    NSArray *sortedArray = [noDuplicates sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [sortedArray dump];
    NSLog(@"\n");
    
    //sap xep thep do dai cua tu sau khi da loai bo phan tu trung nhau
    NSLog(@"sap xep thep do dai cua tu");
    NSArray *sortedMakes = [sortedArray sortedArrayUsingComparator:
                            ^NSComparisonResult(id obj1, id obj2) {
                                if ([obj1 length] < [obj2 length]) {
                                    return NSOrderedAscending;
                                } else if ([obj1 length] > [obj2 length]) {
                                    return NSOrderedDescending;
                                } else {
                                    return NSOrderedSame;
                                }
                            }];
    [sortedMakes loopArr];
    NSLog(@"\n");
}

@end
