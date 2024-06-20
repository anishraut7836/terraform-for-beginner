resource "local_file" "pet" {
    filename = "c:/Users/10730351/Music/project/terraform/file-module/pets.txt"
    content = "We love pets!"
    file_permission = "0700"
  
}

resource "local_file" "things-to-do" {
  filename     = "/root/things-to-do.txt"
  content  = "Clean my room before Christmas\nComplete the CKA Certification!"
}
resource "local_file" "more-things-to-do" {
  filename     = "/root/more-things-to-do.txt"
  content  = "Learn how to play Astronomia on the guitar!"
}