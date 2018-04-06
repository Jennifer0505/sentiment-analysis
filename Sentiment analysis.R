library(dplyr)
library(tidytext)

bush_41<-readLines("bush41 first state of the union.txt")
bush41_df <- data_frame(line = 1:121, text = bush_41)
tidy_bush41<-bush41_df %>%
  unnest_tokens(word, text)

bing_positive <- get_sentiments("bing") %>%
  filter(sentiment == "positive")
bing_negative <- get_sentiments("bing") %>%
  filter(sentiment == "negative")

tidy_bush41 %>%
  inner_join(bing_positive)%>%
  count(word, sentiment,sort = TRUE)

tidy_bush41 %>%
  inner_join(bing_negative)%>%
  count(word, sentiment, sort = TRUE)



nrc_joy <- get_sentiments("nrc") %>%
  filter(sentiment == "joy")
nrc_anger <-get_sentiments("nrc") %>%
  filter(sentiment == "anger")
nrc_anticipation <-get_sentiments("nrc") %>%
  filter(sentiment == "anticipation")
tidy_bush41 %>%
  inner_join(nrc_joy) %>%
  count(word, sentiment, sort = TRUE)
tidy_bush41 %>%
  inner_join(nrc_anger) %>%
  count(word, sentiment, sort = TRUE)
tidy_bush41 %>%
  inner_join(nrc_anticipation) %>%
  count(word, sentiment,sort = TRUE)

bush_43<-readLines("bush43 first state of the union.txt")
bush43_df <- data_frame(line = 1:177, text = bush_43)
tidy_bush43<-bush43_df %>%
  unnest_tokens(word, text)

tidy_bush43 %>%
  inner_join(bing_positive)%>%
  count(word, sentiment,sort = TRUE)

tidy_bush43 %>%
  inner_join(bing_negative)%>%
  count(word, sentiment,sort = TRUE)


tidy_bush43 %>%
  inner_join(nrc_joy) %>%
  count(word, sentiment,sort = TRUE)
tidy_bush43 %>%
  inner_join(nrc_anger) %>%
  count(word, sentiment,sort = TRUE)
tidy_bush43 %>%
  inner_join(nrc_anticipation) %>%
  count(word, sentiment,sort = TRUE)


#Since Bush 43 has more anticipated words in his speech, it might indicates that Bush 43 is more willing to take risk on sovling the complex social problems.
#Since Bush 43 and Bush 41 have similar number of angery words in their speech, it represents that both presidents would like to defend for their nation.
#Since Bush 43 and Bush 41 have the same number of joy words in their speech, it implies that both financial situation and social status of U.S. during Bush 41 and Bush 43 periods are prosperous.
#Since Bush 43 and Bush 41 are in the same party and have kinship, their number of using positve and negative words are almost the same under similar U.S. situation.
