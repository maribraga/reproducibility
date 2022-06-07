# Oikos workshop - reproducibility

library(usethis)

usethis::use_git()
# # set your credentials if you must
# gitcreds::gitcreds_set()
# # if you dont have a pat you can use
# usethis::create_github_token()
# # if you need add your PAT
# usethis::edit_r_environ()
# generate your readme
usethis::use_readme_rmd()
# Edit and upload to git
usethis::use_github()

Species_dataset <- readr::read_csv2("Species_dataset.csv")



