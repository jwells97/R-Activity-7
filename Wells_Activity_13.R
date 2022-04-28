#Jason Wells
#11/20/2019
#Activity 13
#Group:Peyton Karno, Bryant Edwards
library(tidyverse)
library(tidytext)
library(genius)
library(gutenbergr)
rocky <- genius_album(
        artist = "A$AP Rocky",
        album = "AT.LONG.LAST.A$AP"
                     
)
rocky <- rocky %>%
mutate(
       artist = "A$AP Rocky",
       album = "AT.LONG.LAST.A$AP"
)
rocky_lyrics <- rocky %>%
  unnest_tokens(word,lyric)

rocky_lyrics %>%
  count(word) %>%
  arrange(desc(n))
rocky_lyrics %>%
  anti_join(get_stopwords(source = "smart")) %>%
  count(word) %>%
  arrange(desc(n)) %>%
  top_n(20)
# A tibble: 20 x 2
#word       n
#<chr>  <int>
#1 love      79
#2 Redacted    66
#3 yeah      52
#4 em        42
#5 fuck      41
#6 flacko    40
#7 Redacted     40
#8 shit      39
#9 back      36
#10 bitch     36
#11 slow      34
#12 make      33
#13 money     33
#14 gettin    29
#15 ow        28
#16 man       26
#17 time      24
#18 ass       21
#19 gotta     21
#20 clap      20
rocky_lyrics %>%
  anti_join(get_stopwords(source = "smart")) %>%
  inner_join(get_sentiments("bing")) %>%
  
  count(sentiment, word) %>%
  arrange(desc(n)) %>%
  top_n(20)
  