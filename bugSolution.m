To fix this, you must ensure all operations on the `NSManagedObjectContext` happen on the main thread.  Here's the corrected code:

```objectivec
- (void)saveContextInBackground:(NSManagedObjectContext *)context {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
        // Perform other background tasks
        dispatch_async(dispatch_get_main_queue(), ^{  
            NSError *error = nil;
            if (![context save:&error]) {
                NSLog(@"Error saving context: %@", error);
                // Handle the error appropriately
            }
        });
    });
}
```

This corrected version uses `dispatch_async` to perform the save operation on the main queue.  This ensures that all modifications to the context occur within the thread that it was originally created on, thus preventing thread-safety issues.  Always handle potential errors during the save operation.