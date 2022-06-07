## ---- read-dataset --------
Species <- read_csv("https://raw.githubusercontent.com/derek-corcoran-barrios/OikosRepoducibleResearch/master/Species.csv")

## ---- datatable --------
DT::datatable(Species, extensions = c('Buttons', 'ColReorder'),
              filter = "top",
              options = list(dom = 'Blfrtip',
                             colReorder = TRUE,
                             scrollX='400px',
                             scrollY='200px',
                             buttons = c('copy', 'csv', 'excel', I('colvis')),
                             lengthMenu = list(c(10,25,50,-1),
                                               c(10,25,50,"All")))) %>%
  formatRound(columns=c("lon", "lat", "bio_1", "bio_2", "bio_3", "bio_4", "bio_5",
                        "bio_6", "bio_7", "bio_8", "bio_9", "bio_10", "bio_11", "bio_12",
                        "bio_13", "bio_14", "bio_15", "bio_16", "bio_17", "bio_18", "bio_19",
                        "abund_sp1", "abund_sp2", "abund_sp4"), digits=3)

cat("<table>", paste0("<caption>",
                      "(#tab:datatable)",
                      "caption",
                      "Abundances and variables for the study",
                      "</caption>"),
    "</table>", sep ="\n")

## ---- species2 --------

Species2 <- Species %>%
  pivot_longer(cols = abund_sp1:abund_sp4, names_to = "Species", values_to = "Abundance") %>% mutate(Species = str_remove_all(Species, "abund_"), Species =str_replace_all(Species, "sp", "Spp "))

## ---- Abundance --------

ggplot(Species2, aes(x = bio_12, y = Abundance)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Species, scales = "free_y") +
  theme_bw()
