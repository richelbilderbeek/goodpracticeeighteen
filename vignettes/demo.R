## ------------------------------------------------------------------------
# function with examples filename
fwef <- "~/GitHubs/Cer2016/man/add_alignments.Rd"
testit::assert(file.exists(fwef))
doc <- tools::parse_Rd(fwef)
testit::assert(class(doc) == "Rd")

## ------------------------------------------------------------------------
tags <- tools:::RdTags(doc)
print("\\examples" %in% tags)

## ------------------------------------------------------------------------
print(length(doc[[which(tags == "\\examples")]]))

