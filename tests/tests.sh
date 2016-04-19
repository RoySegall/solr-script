@test "Testing solr installation" {
  bash solr.sh -b
  wget http://localhost:8983
}
