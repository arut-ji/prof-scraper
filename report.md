# Arut Jinadit

GUID: 2506165j

Date: 19/11/2020

In this report, I am comparing my experiences with Haskell and TypeScript (TS). I have used several of the available TS libraries for doing web scraping tasks, puppeteer for example, and in this assessed exercise, I was tasked to use a Haskell library, Scalpel, to get information of the number of professors from a list of predefined schools in the University of Glasgow.

## Code Size

Since Haskell has taken the functional approach, the codes are declarative, which means, any other lower-level operations are already encapsulated in functions. As a result, the code size is greatly reduced when compared to any other languages. However, when compared to TS, the code size is not that much reduced. Since TS itself has a fair amount of functional-style methods - Array.map, Array.reduce - and so on, it can be written in a functional way, with a few lines of code required, developers can achieve the same result as Haskell.

## Code Readability

By doing this exercise, I am convinced that Haskell codes are far more readable than the TS’s ones. With human-friendly function names in Haskell, the code is easy to understand, and even easier with some syntactic sugars - do block, case expressions, pattern matching, function composition operator and many more. However, I am confused by some of the infix operators, `$`, `<|>`, `<$>`, and sometimes scared by theml; it usually takes me a while in order to understand their usage.

## Code Maintainability

Both TS and Haskell are statically typed languages, any type mismatched can be caught at compile time, at this point they are not diverged much from each other. However, TS is a multi-paradigm language, some imperative code fragments can be found in TS codes, which lead to a less maintainability - imperative approach does not care much about side-effects, and makes it harder for testing. On the other hand, a Haskell application consists of smaller bits of functions - in which they are composed to serve different purposes - and side-effects-free. Therefore, it is easier to test, and to maintain Haskell applications.

## Toolchain Support

For TS, some widely used package manager would be either npm or yarn. By comparing those to Haskell’s stack and cabal, I would say, the TS’s ones are simpler, and easier to use. When adding dependencies, I have to manually put it in either a stack.yaml or a package.yaml, on the other hand, npm and yarn automatically do it, when a new package is added via the command line interface.

## Documentation

When developing a Haskell application, I struggle to explore the documentations of community-built libraries, the websites containing documentation are either ugly or hard to read, compared to those TS’s ones; this greatly results me to have a bad developer experience.
