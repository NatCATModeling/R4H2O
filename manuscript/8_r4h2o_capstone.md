# In Closing {#close}
I hope this exploration of the R language in the context of managing a water utility has been useful to you.

As stated in the introduction, the purpose of this course is to introduce you to the possibilities of the R language. My aim is to motivate you to want to learn more about writing data science code to manage this precious resource.

The best path towards the digital water utility is to educate established professionals in the possibilities of data science. You might not do this as your day job, but it will certainly help you communicate with coding experts if you need a problem to be solved.

This course barely touches the surface of what can be achieved with writing code. The open source nature of the R language means that there is a strong community of people willing to help you increase your skills. This section closes with some suggestions on how to expand your skills in R coding.

## Searching for answers
The chapter about the [basics](#basics) of the R language explains how to read the built-in help file. If the help entry is not very helpful, then you fin ans answer to your problem using your favourite search engine. You will quickly find that there will be very few problems that have not already been experienced and solved by somebody else.

## Forums
Your search engine will most likely divert you to one of the many online forums where developers help each other. Websites such as [stackoverflow](https://stackoverflow.com/questions/tagged/r) are very active communities where you can ask coding questions. On Twitter, use the #RStats hashtag to connect with fellow data scientists.

Before you post anything on these websites, check to see whether your question has not already be answered, perhaps in a slightly different form.

The best way to ensure you get an answer is to be as specific as possible. Add an example of your code and include a sample data set. Providing this information will make it much easier for others to answer your question.

A good question would be: "How can I convert the wide data frame to a long version?"

{format: r, line-numbers: false}
```
df_wide <- tibble(A = c(1, 2),
             B = c(12, 34),
             C = c(43, 76),
             D = c(5, 12))

df_long <- tibble(A = c(1, 2, 1, 2, 1, 2),
             var = c("B", "B", "C", "C", "D", "D"),
			 val = c(12, 34, 43, 76, 5, 12)
```

This question gives the forum members sufficient information to provide an answer.

Make sure you read the rules of the forum you choose to use before you post any questions.

The answer to this question is, of course, to use the `gather()` function from the *tidyr*  package in the Tidyverse (see [chapter 5](#tidy)).

## Systematic Study
If you like to develop your skills further, then I highly recommend to systematically study the R language.

A great place to systematically learn about R is [DataCamp](https://www.datacamp.com/). This website provides free introduction courses and paid advanced courses. DataCamp also provides courses about other languages, such as Python, SQL and even spreadsheets. 

For a thorough in-depth course on data science with the R language, I recommend the [Data Science Specialisation](https://www.coursera.org/specializations/jhu-data-science) by John Hopkins University on the Coursera platform.

If you like to know more about the Tidyverse, then please read the [R for Data Science](https://r4ds.had.co.nz/). This book is freely available on the web, or you can purchase a paper copy from an a retailer.

## Thanks
Thanks for making it to the end of this course. The LeanPub system is very flexible and this course is regularly updated with clarifications and possibly future further chapter.

I would appreciate any feedback on how to improve this course. You can contact me through my Twitter handle @LucidManager or through my [website](https://lucidmanager.org/).
