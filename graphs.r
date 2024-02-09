# Install and load the tidyverse package
install.packages("tidyverse")
library(tidyverse)

# Importing data sheet
debernardi <- read.csv("C:\\Users\\Elizabeth Anniss\\Code\\hello\\deb.csv")

# Counting sample origin frequency
item_counts <- table(debernardi$sample_origin)
print(item_counts)

# Convert item_counts to a data frame
item_counts_df <- as.data.frame(item_counts)
# Adding meaningful column names
names(item_counts_df) <- c("sample_origin", "count")

#making diagnosis a string
diagnosis_string <- as.character(debernardi$diagnosis)
print(diagnosis_string)

```{r}
# Create a STACKED BAR CHART using ggplot--------------------------------------
bar_chart <- ggplot(data = debernardi) +
  geom_bar(mapping = aes(x = sample_origin, fill = sex)) +
  labs(title = "Sample Origin by Sex", ,
       x = "Sample Origin",
       y = "Count") +
  theme(
    plot.title = element_text(size = 24, face = "bold"),
    axis.title.x = element_text(size = 18, face = "bold"),
    axis.title.y = element_text(size = 18, face = "bold"),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 18, face = "bold")
  )
print(bar_chart)
```

```{r}
#Create a PIE CHART------------------------------------------------------------

pie_chart <- ggplot(data = debernardi) +
  geom_bar(mapping = aes(x = diagnosis_string, fill = diagnosis_string), width = 1) +
  coord_polar("y") +
  labs(title = "Pie Chart Example") +
  theme(
    plot.title = element_text(size = 24, face = "bold"),
    axis.title.x = element_text(size = 18, face = "bold"),
    axis.title.y = element_text(size = 18, face = "bold"),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 18, face = "bold")
  )
```

```{r}
#BOX PLOTS---------------------------------------------------------------------

#making boxplot(creatinine)
boxplot_creatinine <- ggplot(debernardi, aes(diagnosis_string, creatinine))+
  geom_boxplot(aes(fill = creatinine)) +
  theme(
    plot.title = element_text(size = 24, face = "bold"),
    axis.title.x = element_text(size = 18, face = "bold"),
    axis.title.y = element_text(size = 18, face = "bold"),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 18, face = "bold")
  )
print(boxplot_creatinine)

#making boxplot(LYVE1)
boxplot_lyve1 <- ggplot(debernardi, aes(diagnosis_string, LYVE1,
  fill = factor(LYVE1))) +
  geom_boxplot(pattern = c("solid", "dashed", "dotted"), outlier.shape = NA) +
labs(title = "Box Plot of LYVE1 by diagnosis",
     x = "Diagnosis",
     y = "LYVE1") +
  scale_fill_manual(values = c("#003f5c", "#ff6361", "#ffa600"))
theme(
    plot.title = element_text(size = 24, face = "bold"),
    axis.title.x = element_text(size = 18, face = "bold"),
    axis.title.y = element_text(size = 18, face = "bold"),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 18, face = "bold")
  )
print(boxplot_lyve1)

#making boxplot(REG1B)
boxplot_REG1B <- ggplot(debernardi, aes(diagnosis_string, REG1B))+
    geom_boxplot(aes(fill = REG1B))+
theme(
    plot.title = element_text(size = 24, face = "bold"),
    axis.title.x = element_text(size = 18, face = "bold"),
    axis.title.y = element_text(size = 18, face = "bold"),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 18, face = "bold")
    )
print(boxplot_REG1B)
```

