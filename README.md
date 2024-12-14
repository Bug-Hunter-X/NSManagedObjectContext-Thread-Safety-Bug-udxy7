# Objective-C NSManagedObjectContext Thread Safety Bug

This repository demonstrates a common error related to thread safety when using `NSManagedObjectContext` in Objective-C.  Attempting to save a context from a thread other than the one it was created on can result in crashes or data corruption. The `bug.m` file shows the problematic code. The solution, in `bugSolution.m`, illustrates how to correctly handle context saving across threads using appropriate synchronization mechanisms.