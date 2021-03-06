kable_BY2011_growth_crosswalk <- function (
  input_data,
  caption = "Growth profile configuration (DataBank, {DataBank:::DB_activity_tbl(BY(2011))})."
) {
  
  kable_data <-
    input_data %>%
    transmute(
      category,
      backcast,
      forecast,
      profile = glue::glue(
        "#{gpf_id} {gpf_name}")) %>%
    distinct() %>%
    mutate_at(
      vars(backcast, forecast),
      ~ if_else(., true = "Yes", false = "No", missing = "NA"))
  
  kable_data %>%
    kable_BY2011(
      align = "lccl",
      caption = glue::glue(caption))
  
}
