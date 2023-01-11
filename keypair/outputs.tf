output "newly_created_keypair_name" {
    description = "new keypair that is created"
    value = module.keypair.key_pair_name
}