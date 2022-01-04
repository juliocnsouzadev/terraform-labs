resource "local_file" "series" {
  filename          = "favorite-series.txt"
  sensitive_content = "Breaking Bad, Mr Robot, House, Dark, Dexter"
}