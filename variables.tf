variable "location" {
  default     = "norwayeast"
  description = "What location to use for the Azure Resources"
  validation {
    condition     = contains(["norwayeast", "westeurope"], var.location)
    error_message = "Environemtn must be in approved list"
  }
}
